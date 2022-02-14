#maintainer: BrainDamage
pkgname=helio-workstation
pkgver=3.8
pkgrel=1
pkgdesc="One music sequencer for all major platforms, desktop and mobile"
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('curl' 'freetype2' 'libxinerama' 'libglvnd' 'alsa-lib')
makedepends=('git' 'vst2sdk' 'libxrandr' 'libxcursor' 'libxcomposite' 'jack' 'asio' 'freeglut')
source=("git+https://github.com/helio-fm/${pkgname}#tag=${pkgver}" "git+https://github.com/peterrudenko/JUCE.git" "git+https://github.com/peterrudenko/hopscotch-map.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')
#FIXME: figure out how to use native packages for juce / hopscotchmap

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.ThirdParty/HopscotchMap.url "$../../hopscotch-map"
  git config submodule.ThirdParty/JUCE.url "$../../JUCE"
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}/Projects/LinuxMakefile"
  export CONFIG=Release64
  make
}

package() {
  cd "${srcdir}/${pkgname}/Projects/"
  install -Dvm755 "LinuxMakefile/build/helio" "${pkgdir}/usr/bin/helio"
  install -Dvm755 "Deployment/Linux/Debian/x64/usr/share/applications/Helio.desktop" "${pkgdir}/usr/share/applications/Helio.desktop"
  install -dvm755 "Deployment/Linux/Debian/x64/usr/share/icons" "${pkgdir}/usr/share/icons"
  cp -drv --no-preserve='ownership' Deployment/Linux/Debian/x64/usr/share/icons/* "${pkgdir}/usr/share/icons/"
}

