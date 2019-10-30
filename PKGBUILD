# Contributor: Milk Brewster <aur@milkmiruku.com>
# Maintainer: Matthew Sexton <wsdmatty@gmail.com>
pkgname=helio-workstation-git
pkgver=2.3.r28.2a76dc3f
pkgrel=1
pkgdesc="high-performance MIDI sequencer with a clean interface, version control, and more"
arch=('x86_64')
url="https://helioworkstation.com/"
license=('GPL3')
depends=('hicolor-icon-theme' 'curl' 'freetype2' 'libxinerama' 'libglvnd' 'alsa-lib')
makedepends=('git' 'steinberg-vst36' 'libxrandr' 'libxcursor' 'libxcomposite' 'jack' 'asio' 'freeglut')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/helio-fm/helio-workstation.git"
        "git+https://github.com/WeAreROLI/JUCE.git"
        "git+https://github.com/greg7mdp/sparsepp.git")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule init
  git config submodule.JUCE.url "${srcdir}"/ThirdParty/JUCE
  git config submodule.sparsepp.url "${srcdir}"/ThirdParty/SparseHashMap
  git submodule update
  
}

build() {
  cd "$srcdir/${pkgname%-git}/Projects/LinuxMakefile"
  export CONFIG=Release64
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/Projects/"
  install -Dm755 "LinuxMakefile/build/Helio" "${pkgdir}/usr/bin/helio"
  install -Dm755 "Deployment/Linux/Debian/x64/usr/share/applications/Helio.desktop" "${pkgdir}/usr/share/applications/Helio.desktop"
  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve='ownership' Deployment/Linux/Debian/x64/usr/share/icons/* "${pkgdir}/usr/share/icons/"
  }

