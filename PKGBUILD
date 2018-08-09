# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=owl-lisp-git
pkgver=0.1.13+569+g64730ee
pkgrel=1
pkgdesc='Simple purely functional lisp'
url='https://gitlab.com/owl-lisp/owl.git'
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git' 'pandoc')
provides=('owl-lisp')
conflicts=('owl-lisp')
options=('!makeflags')
source=(${pkgname}::git+https://gitlab.com/owl-lisp/owl)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v?(.+)|\1|g'
}

prepare() {
  cd ${pkgname}
  # support distro CFLAGS and CPPFLAGS
  sed -e'/export CFLAGS/d' -e '/CFLAGS =/d' \
    -e 's|$(CFLAGS)|$(CFLAGS) $(CPPFLAGS)|g' -i Makefile
  # make build reproducible, we compress ourselves
  sed -e 's|gzip -9|@echo|g' -e 's|\.gz||g' -i Makefile
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 fasl/* -t "${pkgdir}/var/lib/${pkgname}/fasl"
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md manual.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
