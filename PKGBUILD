# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=fish
pkgver=3.6.1
pkgrel=1
pkgdesc='Smart and user friendly shell intended mostly for interactive use'
url='https://fishshell.com/'
arch=('x86_64')
license=('GPL2')
depends=('glibc' 'gcc-libs' 'ncurses' 'pcre2')
optdepends=('python: man page completion parser / web config tool'
            'pkgfile: command-not-found hook')
makedepends=('cmake' 'python-sphinx')
checkdepends=('expect' 'procps-ng')
install=fish.install
backup=(etc/fish/config.fish)
source=(https://github.com/fish-shell/fish-shell/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz{,.asc})
validpgpkeys=(003837986104878835FA516D7A67D962D88A709A) # David Adam <zanchey@gmail.com>
sha256sums=('55402bb47ca6739d8aba25e41780905b5ce1bce0a5e0dd17dca908b5bc0b49b2'
            'SKIP')
sha512sums=('ee6f5c7699307d515f111c8c4f1633d9eb9703e045a93cfc2fcec722a03cca4ab25e4e09f6fd94ff2d07180d8b37c6ab733323bb2645065fdeb4e94771347597'
            'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_DOCS=True \
    -Wno-dev
  make -C build VERBOSE=1
}

check() {
  cd ${pkgname}-${pkgver}
  make -C build test
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
