# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname="bsdsed"
_freebsd_ver="14.1.0"
pkgver="$_freebsd_ver"
pkgrel=4
pkgdesc="BSD variant of sed"
arch=('x86_64')
url="https://github.com/freebsd/freebsd-src/tree/main/usr.bin/sed"
_clone_url="http://github.com/freebsd/freebsd-src.git"
license=('BSD-2-Clause-Views')
depends=('glibc')
makedepends=('git')
source=("Makefile"
        "errc.c"
        "linux_compat.h")
sha256sums=('00bc48abb117ffbdad4064095d87d4de95fd4f5b5851d755834e5fe7499a646d'
            'ffa4df0805e86b6298758b0abd4857b189d2d8b4df0de510376efd064a3d5e64'
            '64c848535ea2af835c1cf3b24a0843408bc4ecd542ff660f023fe9413d6888c2')

prepare() {
    cd "$srcdir"

    # we don't keep existing clones
    if [ -d freebsd-src ]; then
      msg2 "removing existing checkout..."
      rm -rf freebsd-src
    fi

    msg2 "making a sparce close of $_clone_url"
    # we do this to avoid cloning the entire FreeBSD source repo (multiple gigs)
    git clone -n --depth=1 --filter=tree:0 -b release/${_freebsd_ver} --single-branch ${_clone_url}

    git -C freebsd-src sparse-checkout set --no-cone '/COPYRIGHT' '/usr.bin/sed' '/lib/libc/string'
    git -C freebsd-src checkout
}

build() {
	cd "$srcdir"
	make FREEBSDVER=$_freebsd_ver
}

package() {
	cd "$srcdir"
	make FREEBSDVER=$_freebsd_ver DESTDIR="$pkgdir/" install

	install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname/ freebsd-src/COPYRIGHT
}
