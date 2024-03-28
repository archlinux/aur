# Maintainer: alyrow

pkgname=hyperlap2d-git
pkgver=v0.1.3.r35.g67790cc0
pkgrel=1
pkgdesc="A powerful, platform-independent, visual editor for complex 2D worlds and scenes."
arch=('x86_64')
url="https://hyperlap2d.rednblack.games/"
license=('GPL3')
conflicts=("hyperlap2d-bin")
provides=("hyperlap2d")
depends=('libxi' 'java-runtime>=16')
makedepends=('java-environment>=16' 'java-environment<=19' 'git' 'dpkg' 'binutils' 'tar')
optdepends=()
source=("$pkgname::git+https://github.com/rednblackgames/HyperLap2D.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  jver=$(archlinux-java get | sed -r 's/java-([[:digit:]]+)-.*/\1/')
  if [[ $jver < 16 || $jver > 19 ]]; then
  #if ! archlinux-java get | grep 16 ; then 
      echo "You don't have a Java [16-19] JDK selected but the following are installed on your system:"
      echo "`archlinux-java status`"
      echo "Select a Java [16-19] JDK using \"sudo archlinux-java set [name from the list above]\""
      echo "If you switched to a JDK [16-19], please re-run the installation."
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
  mkdir -p dist
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
