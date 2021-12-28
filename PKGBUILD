# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>

pkgname=higan-git
pkgver=115.r232.g9bf1b3314
pkgrel=2
pkgdesc="Multi-system emulator focused on accuracy, preservation, and configurability"
arch=(x86_64)
url="https://higan-emu.com/"
license=(GPL3)
depends=(libpulse qt5-base sdl2 libxv libao libgl openal libxrandr)
makedepends=(git mesa)
provides=(higan)
conflicts=(higan)
source=("git+https://github.com/higan-emu/higan.git")
sha256sums=('SKIP')

pkgver() {
  cd higan
  git describe --long --tags --exclude nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd higan
  sed 's|/usr/local/lib/qt5/bin/moc|moc|' -i hiro/GNUmakefile
}

build() {
  cd higan

  make -C higan-ui hiro=qt5
  make -C icarus   hiro=qt5
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/{higan,icarus}

  install -Dm 755 higan/higan-ui/out/higan -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/higan-ui/resource/higan.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/higan-ui/resource/higan.png -t "${pkgdir}"/usr/share/pixmaps/
  cp -dr --no-preserve='ownership' higan/higan/System "${pkgdir}"/usr/share/higan/Templates

  install -Dm 755 higan/icarus/out/icarus -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/icarus/resource/icarus.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/icarus/resource/icarus.svg -t "${pkgdir}"/usr/share/pixmaps/
  cp -dr --no-preserve='ownership' higan/icarus/Database higan/icarus/Firmware "${pkgdir}"/usr/share/icarus/
}
