# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Raphael Proust <raphlalou at gmail dot com>

pkgname=surf
pkgver=2.0+9+g5c52733
pkgrel=1
pkgdesc='A simple web browser based on WebKit/GTK+.'
arch=('x86_64')
url='https://surf.suckless.org/'
license=('MIT')
depends=('webkit2gtk' 'xorg-xprop')
optdepends=('dmenu: URL-bar'
            'ca-certificates: SSL verification'
            'xterm: default download handler'
            'curl: default download handler')
makedepends=('git')
install='surf.install'
_commit=5c527339842fdd06411eaf25547aef0902f96915
source=("git+git://git.suckless.org/surf#commit=$_commit"
        'config.h')
sha256sums=('SKIP'
            '439b6812d6aff2fe9f69f6e2d0b8fa521bc4466ea072510409617d25778b5fba')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"

  cp "${srcdir}/config.h" config.h

  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/CFLAGS =/CFLAGS +=/g' config.mk
  sed -i 's/LDFLAGS =/LDFLAGS +=/g' config.mk

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
