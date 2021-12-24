# Maintainer: alyrow

pkgname=hyperlap2d-git
pkgver=v0.0.7.r89.g08d6510
pkgrel=1
pkgdesc="A powerful, platform-independent, visual editor for complex 2D worlds and scenes."
arch=('x86_64')
url="https://hyperlap2d.rednblack.games/"
license=('GPL3')
conflicts=("hyperlap2d-bin")
provides=("hyperlap2d")
depends=('libxtst' 'libxrender' 'alsa-lib' 'hicolor-icon-theme' 'libnet' 'java-runtime')
makedepends=('java-environment' 'git' 'dpkg' 'binutils' 'tar')
optdepends=()
source=("$pkgname::git+https://github.com/rednblackgames/HyperLap2D.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if ! archlinux-java get | grep 16 ; then 
      echo "You don't have a Java 16 JDK selected but the following installed on your system:"
      echo "`archlinux-java status | grep 16`"
      echo "Select a Java 16 JDK using \"sudo archlinux-java set [name from the list above]\""
      echo "If you switched to a JDK 16, please re-run the installation."
      return 1
  fi

  cd "${srcdir}/hyperlap2d-git"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/hyperlap2d-git"
  chmod +x gradlew
  ./gradlew dist
  ./gradlew jpackage -PSNAPSHOT=true
  mkdir dist
  mv build/jpackage/*.deb dist/hyperlap2d.deb
  cd dist
  ar xv hyperlap2d.deb
  tar -xvf data.tar.xz
}

package() {
  mkdir -p "${pkgdir}/opt/hyperlap2d/"
  cp -R "${srcdir}/hyperlap2d-git/dist/opt" "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/hyperlap2d/bin/HyperLap2D" "${pkgdir}/usr/bin/hyperlap2d"

  install -Dm644 "${srcdir}/hyperlap2d-git/dist/opt/hyperlap2d/lib/hyperlap2d-HyperLap2D.desktop" "${pkgdir}/usr/share/applications/hyperlap2d-HyperLap2D.desktop"
  install -Dm644 "${srcdir}/hyperlap2d-git/dist/opt/hyperlap2d/lib/HyperLap2D.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/HyperLap2D.png"
}
