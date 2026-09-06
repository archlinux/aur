# SPDX-License-Identifier: MIT
# Maintainer: Chris <goabonga@pm.me>
#
# YateBTS, imported from https://aur.archlinux.org/packages/yate-bts and
# brought back to life.
#
# The AUR package pinned a tarball on yate.null.ro. That host no longer
# resolves at all, so the package had been unbuildable for anyone who
# tried it: makepkg could not fetch a single byte. Upstream's own site
# (yatebts.com) is still up, but it serves no tarballs; the code now
# lives only in the GitHub repository, which carries neither tags nor
# releases.
#
# So the source is a pinned commit. That is the reproducible option
# available: a commit hash names exactly one tree forever, where a
# branch name would silently change what this package builds.
#
# `pkgver` follows AC_INIT in the upstream configure.ac (6.1.1 at the
# pinned commit) rather than a release, because upstream publishes none.
# multicz does NOT own it: see multicz.toml, and CONTRIBUTING.md under
# "Packaging rules".

pkgname=yate-bts
pkgver=6.1.1
pkgrel=1
pkgdesc="YateBTS is an open source GSM Base Station software"
arch=('x86_64')
url="https://yatebts.com/"
license=('GPL-2.0-only')
depends=('yate')
# `git` fetches the source; the tarballs shipped a pre-generated
# ./configure and the repository does not, so autoconf has to run.
makedepends=('git' 'autoconf')
optdepends=('nginx: nipc_web support'
            'apache: nipc_web support'
            'php-fpm: nipc_web support')
backup=('etc/yate/snmp_data.conf'
        'etc/yate/ybts.conf'
        'etc/yate/tmsidata.conf'
        'etc/yate/subscribers.conf')
# Last commit on master as of 2023-05-30, "Updated copyright notices."
_commit=9b289b413c93e882bc4a0722060e94f5538ba1aa
# nipc/web/ansql is the PHP framework the web interface is built on. The
# release tarballs vendored it; the repository does not carry it, and the
# nipc install target chmods a file inside it - so `make install` fails
# outright without it. It has its own upstream repository.
#
# Pinned to ansql's current head, NOT to a commit contemporary with the
# yatebts one above. Matching the eras would reproduce what upstream
# shipped together, which was the first instinct here and is the wrong
# one: yatebts froze in 2023, ansql did not, and Arch ships PHP 8.5.
# ansql has taken at least five PHP 8 fixes since - including a fatal
# error under 8.1 and the dynamic-properties attribute 8.2 needs - so
# the era-matched pin would install a web interface that breaks on the
# only PHP this distribution has.
_ansqlcommit=a19283f47b6d125a0c0e70f2bd104baa0235ed57
source=("${pkgname}::git+https://github.com/yatevoip/yatebts.git#commit=${_commit}"
        "ansql::git+https://github.com/yatevoip/ansql.git#commit=${_ansqlcommit}")
# SKIP is correct here and only here: a git source is pinned by its
# commit hash, which is a stronger guarantee than a checksum over a
# tarball whose bytes a forge can regenerate.
sha256sums=('SKIP'
            'SKIP')

# The AUR package carried a gcc.patch working around `operator<<` on a
# std::ostringstream. It is gone: upstream fixed both sites properly with
# `.str()`, whereas the patch substituted `(!os.fail())` and logged a
# boolean where the channel dump was meant to be. Keeping it would have
# reintroduced that.

prepare() {
    # Drop ansql where the nipc Makefile expects to find it. Idempotent,
    # so a rebuild with `makepkg -f` over an existing $srcdir does not
    # nest one copy inside the last.
    rm -rf "$srcdir/$pkgname/nipc/web/ansql"
    cp -r "$srcdir/ansql" "$srcdir/$pkgname/nipc/web/ansql"
    # The nipc install target copies every file under web/ verbatim, so
    # a .git left here ends up inside the package - thirteen hook samples
    # and a full object store shipped to every user.
    rm -rf "$srcdir/$pkgname/nipc/web/ansql/.git"
}

pkgver() {
    # Upstream ships no tags, so the version is whatever configure.ac
    # declares at the pinned commit. Read rather than hardcoded, so a
    # commit bump that moves the version cannot silently disagree with
    # pkgver above.
    cd "$srcdir/$pkgname"
    sed -n 's/^AC_INIT(.*,[[:space:]]*\([0-9.]\+\)).*/\1/p' configure.ac | head -1
}

build() {
    cd "$srcdir/$pkgname"
    # No ./configure in the repository - autogen.sh runs autoconf to
    # generate it.
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install

    # The build installs these as directories' contents only; pacman needs
    # the files to exist for `backup=` to track them.
    touch "$pkgdir/etc/yate/snmp_data.conf" "$pkgdir/etc/yate/tmsidata.conf"

    # The two auth helpers are compiled binaries, and upstream installs
    # them into Yate's script directory - which is under /usr/share,
    # reserved by the FHS for architecture-independent data. Arch's own
    # yate package puts nothing but text there, so this is upstream's
    # mistake rather than a convention to follow, and namcap flags it as
    # an error.
    #
    # Move them under /usr/lib and leave symlinks behind: anything that
    # resolves them through Yate's configured scriptdir still finds them,
    # and the real ELF files now sit in a path the FHS allows.
    install -d "$pkgdir/usr/lib/yate/scripts"
    local helper
    for helper in do_nipc_comp128 do_nipc_milenage; do
        mv "$pkgdir/usr/share/yate/scripts/$helper" \
           "$pkgdir/usr/lib/yate/scripts/$helper"
        ln -s "../../../lib/yate/scripts/$helper" \
              "$pkgdir/usr/share/yate/scripts/$helper"
    done
}
