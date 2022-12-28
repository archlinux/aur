# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Fabian Piribauer <fabian.piribauer@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Original Carlos Silva <r3pek@r3pek.org>

pkgname=piper-git
pkgver=0.7.r21.g4827954
pkgrel=1
pkgdesc='Piper is a GUI interface to ratbagd, the system daemon for configurable mice'
arch=('any')
url='https://github.com/libratbag/piper'
license=('GPL')
depends=('python3' 'python-gobject>=3.0' 'libratbag-git' 'python-lxml' 'python-cairo' 'hicolor-icon-theme' 'libblockdev' 'libibus')
makedepends=('git' 'meson' 'flake8' 'appstream' 'gtk-update-icon-cache' 'desktop-file-utils')
options=(!emptydirs)
source=("${pkgname}::git+https://github.com/libratbag/piper.git")
sha256sums=('SKIP')
conflicts=('piper')
provides=('piper')

prepare() {
  cd "${pkgname}"

  # Remove install script
  # This is handled by pacman hooks
  sed -i "/meson.add_install_script('meson_install.sh')/d" meson.build
}

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    meson builddir --prefix=/usr/
    ninja -C builddir
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C builddir install
}
