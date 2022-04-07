# Maintainer: 3mb3dw0rk5 <3mb3dw0rk5 at gmail dot com>

pkgname=hexcurse-git
pkgver=v1.60.0.r6.ga7d60e8
pkgrel=3
pkgdesc="Versatile ncurses-based hex editor."
arch=('x86_64')
url="https://github.com/LonnyGomes/hexcurse"
license=('GPL')
depends=('ncurses')
provides=('hexcurse')
conflicts=('hexcurse')
options=('!makeflags')
source=("git+https://github.com/LonnyGomes/hexcurse"
        "https://github.com/gentoo/gentoo/raw/d6f5624d344f8d50aa7ca7a852fb0f935938e09a/app-editors/hexcurse/files/hexcurse-1.60.0-Werror.patch"
        "https://github.com/gentoo/gentoo/raw/d6f5624d344f8d50aa7ca7a852fb0f935938e09a/app-editors/hexcurse/files/hexcurse-1.60.0-gcc10.patch"
        "https://github.com/gentoo/gentoo/raw/d6f5624d344f8d50aa7ca7a852fb0f935938e09a/app-editors/hexcurse/files/hexcurse-1.60.0-tinfo.patch"
        "hexcurse_pr40.patch::https://github.com/LonnyGomes/hexcurse/commit/cb70d4a93a46102f488f471fad31a7cfc9fec025.patch")
md5sums=('SKIP'
         '3f8372409addcbb199f6cfb635c95a5a'
         '1be42b813594507f9910be2fc014e4e9'
         '7db1bd4770c0f4350f5ae80991421b50'
         '1f67d69aa4b0944477c5ad174af96f8d')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch --forward --strip=1 --input="${srcdir}/hexcurse-1.60.0-Werror.patch"
  patch --forward --strip=1 --input="${srcdir}/hexcurse-1.60.0-gcc10.patch"
  patch --forward --strip=1 --input="${srcdir}/hexcurse-1.60.0-tinfo.patch"
  patch --forward --strip=1 --input="${srcdir}/hexcurse_pr40.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  autoreconf -f -i
  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir/" install
}
