#maintainer: BrainDamage
pkgname=helio-workstation
pkgver=3.8
pkgrel=3
pkgdesc="One music sequencer for all major platforms, desktop and mobile"
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('curl' 'freetype2' 'libxinerama' 'libglvnd' 'alsa-lib')
makedepends=('git' 'vst2sdk' 'libxrandr' 'libxcursor' 'libxcomposite' 'jack' 'asio' 'freeglut' 'mdbook')
source=("git+https://github.com/helio-fm/${pkgname}#tag=${pkgver}" "git+https://github.com/peterrudenko/JUCE.git" "git+https://github.com/peterrudenko/hopscotch-map.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')
#FIXME: figure out how to use native packages for juce / hopscotchmap

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.ThirdParty/HopscotchMap.url "../../hopscotch-map"
  git config submodule.ThirdParty/JUCE.url "../../JUCE"
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  cd Projects/LinuxMakefile
  CONFIG=Release64 make
  cd "${srcdir}/${pkgname}"
  cd Docs
  mdbook build -d ../doc
}

package() {
  cd "${srcdir}/${pkgname}/"
  install -Dvm755 "Projects/LinuxMakefile/build/helio" "${pkgdir}/usr/bin/helio"
  install -Dvm755 "Projects/Deployment/Linux/Debian/x64/usr/share/applications/Helio.desktop" "${pkgdir}/usr/share/applications/Helio.desktop"
  install -dvm755 "Projects/Deployment/Linux/Debian/x64/usr/share/icons" "${pkgdir}/usr/share/icons"
  cp -drv --no-preserve='ownership' Projects/Deployment/Linux/Debian/x64/usr/share/icons/* "${pkgdir}/usr/share/icons/"
  install -dvm755 doc "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -drv --no-preserve='ownership' doc/* "${pkgdir}/usr/share/doc/${pkgname}/"
}

