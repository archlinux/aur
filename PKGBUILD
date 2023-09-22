# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Maintainer: Michael Beaumont <mjboamail@gmail.com>

# Upstream package at https://github.com/michaelbeaumont/aur-packages
# More info at https://github.com/michaelbeaumont/fish-shell/issues/1

pkgname=fish-smart-prompt-truncate
_pkgname=fish
pkgver=3.6.1
pkgrel=1
pkgdesc='Fork of fish that allows non-final prompt lines to be reflowed by the terminal instead of truncated.'
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
conflicts=(fish)
source=(
  https://github.com/fish-shell/fish-shell/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.asc}
  only-truncate-final-line.patch
)
validpgpkeys=(003837986104878835FA516D7A67D962D88A709A) # David Adam <zanchey@gmail.com>
sha256sums=('55402bb47ca6739d8aba25e41780905b5ce1bce0a5e0dd17dca908b5bc0b49b2'
            'SKIP'
            'SKIP')
sha512sums=('ee6f5c7699307d515f111c8c4f1633d9eb9703e045a93cfc2fcec722a03cca4ab25e4e09f6fd94ff2d07180d8b37c6ab733323bb2645065fdeb4e94771347597'
            'SKIP'
            'SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/only-truncate-final-line.patch"

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
  cd ${_pkgname}-${pkgver}
  make -C build test
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
