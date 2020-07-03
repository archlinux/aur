# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>

pkgname=higan-git
pkgver=110.r0.g483c5781
pkgrel=1
pkgdesc="Nintendo multi-system emulator by Byuu"
arch=(x86_64 i686)
url="https://higan.byuu.org/"
license=(GPL3)
depends=(qt5-base libpulse gtksourceview2 sdl2 libxv libao libgl openal)
makedepends=(git mesa)
provides=(higan)
conflicts=(higan)
source=("git+https://github.com/byuu/higan")
sha256sums=('SKIP')

pkgver() {
  cd higan
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd higan
  sed 's|/usr/local/lib/qt5/bin/moc|moc|' -i hiro/GNUmakefile
}

build() {
  cd higan

  make -C higan hiro=qt5
  make -C icarus hiro=qt5
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/{higan,icarus}

  install -Dm 755 higan/higan/out/higan -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/higan/target-higan/resource/higan.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/higan/target-higan/resource/higan.svg -t "${pkgdir}"/usr/share/pixmaps/
  cp -dr --no-preserve='ownership' higan/higan/System "${pkgdir}"/usr/share/higan/Templates

  install -Dm 755 higan/icarus/out/icarus -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/icarus/data/icarus.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/icarus/data/icarus.svg -t "${pkgdir}"/usr/share/pixmaps/
  cp -dr --no-preserve='ownership' higan/icarus/Database higan/icarus/Firmware "${pkgdir}"/usr/share/icarus/
}
