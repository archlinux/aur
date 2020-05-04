# Maintainer: Darshit Shah <darnir [at] gnu [dot] org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=libpsl
pkgname=$_pkgname-git
pkgver=libpsl.0.21.0.r41.g72365d3
pkgrel=1
pkgdesc='Public Suffix List library'
url='https://github.com/rockdaboot/libpsl'
arch=('x86_64')
license=('MIT')
depends=('libidn2' 'libunistring')
makedepends=('libxslt' 'python' 'publicsuffix-list' 'gtk-doc' 'git')
provides=('libpsl')
conflicts=('libpsl')
source=(git+https://github.com/rockdaboot/${_pkgname}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  ./autogen.sh
}

build() {
  cd ${_pkgname}
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --enable-man \
    --enable-gtk-doc \
    --enable-{builtin,runtime}=libidn2 \
    --with-psl-file=/usr/share/publicsuffix/effective_tld_names.dat \
    --with-psl-testfile=/usr/share/publicsuffix/test_psl.txt
  LC_CTYPE=en_US.UTF-8 make
}

check() {
  cd ${_pkgname}
  make check
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
