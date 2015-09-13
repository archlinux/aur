# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

_gitname=yara
pkgname=yara-git
pkgver=3.4.0.1113.f502bdf
pkgrel=1
pkgdesc="Tool aimed at helping malware researchers to identify and classify malware samples"
url="https://plusvic.github.io/yara/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('openssl')
makedepends=('git' 'openssl')
provides=('yara')
conflicts=('yara')
source=(${pkgname}::git+https://github.com/plusvic/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgbase}
  sed -r 's|(-Wshorten-64-to-32)||g' -i libyara/Makefile.am
}

build() {
  cd ${pkgbase}
  autoreconf --force --install
  ./configure --prefix=/usr --with-crypto
  make
}

package() {
  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}"
}


# vim: ts=2 sw=2 et:
