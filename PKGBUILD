# Maintainer: ryoskzypu <ryoskzypu@proton.me>
#
# Why does this package exist?
#   See https://asciinema.org/a/3Uiq1UtbpepgCUVD.
#
# NOTE:
#   locale-gen script is renamed to lc-gen and locale.gen config to lc.gen.
#
#   Rationale:
#     locale-gen depends on glibc package for the locale stuff, therefore glibc
#     owns /usr/bin/locale-gen and /etc/locale.gen, causing pacman to complain
#     about conflicting files.
#
#   Do not forget to pass `-c /etc/lc.gen` to lc-gen, otherwise it will use the
#   glibc one. Also, uncomment the desired locales in /etc/lc.gen or lc-gen will
#   compile all supported locales. See locale.gen(5), locale-gen(8).

pkgname=locale-gen
pkgver=3.10
pkgrel=1
pkgdesc='Generate locales based upon the config file /etc/locale.gen'
arch=('any')
url=https://gitweb.gentoo.org/proj/locale-gen.git/
license=('GPL-2.0-only')
depends=(
    'glibc'
    'perl-file-slurper'
    'perl>=5.36'
)
makedepends=('git')
backup=('etc/lc.gen')
install=locale-gen.install
source=(
    "$pkgname::git+https://gitweb.gentoo.org/proj/locale-gen.git#tag=$pkgname-$pkgver"
    '10-glibc-locale-gen.hook'
)
sha256sums=(
    '343b5395d0f4930b162a7cc9a8c19d7740a9829dec0fbacde25d2b2abb3c0a29'
    'b275ac71afa1144b25dc210be15ebe3fbc2c4e22ec73921d2e9dd7e17913bfad'
)

_mkconfig()
{
    cat << 'END'
# This file defines which locales to incorporate into the glibc locale archive.
# See the locale.gen(5) and locale-gen(8) man pages for more details.

END

    if [[ -e /usr/share/i18n/SUPPORTED ]]; then
        /usr/bin/perl mkconfig
    else
        printf '%s\n' \
            'Skipping the incorporation of locale.gen examples because the SUPPORTED file is absent' >&2
    fi
}

# https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-apps/locale-gen/locale-gen-3.10.ebuild
package()
{
    cd "$pkgname"
    mv locale-gen lc-gen

    install -Dm755 lc-gen       -t "$pkgdir/usr/bin/"
    install -Dm755 locale-gen.8 -t "$pkgdir/usr/share/man/man8/"
    install -Dm755 locale.gen.5 -t "$pkgdir/usr/share/man/man5/"
    install -Dm644 COPYING      -t "$pkgdir/usr/share/licenses/$pkgname/"

    mkdir "$pkgdir/etc"

    # Override the glibc hook to prevent it from generating wrong locales.
    # https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/blob/main/10-glibc-locale-gen.hook
    install -vDm 644 ../10-glibc-locale-gen.hook -t "$pkgdir/etc/pacman.d/hooks/"

    if ! _mkconfig > "$pkgdir/etc/lc.gen"; then
        printf '%s\n' 'Failed to generate and/or install locale.gen' >&2
        return 1
    fi
}
