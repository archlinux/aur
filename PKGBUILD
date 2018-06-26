# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=linphone-desktop-all-git
pkgver=4.1.1.r415.efa3e107
pkgrel=1
pkgdesc="A free VoIP and video softphone based on the SIP protocol (Installed in /opt with all deps included)."
arch=("x86_64")
url="https://www.${pkgname%-desktop-all-git}.org/"
license=("GPL2")
depends=("qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-svg" "qt5-tools")
makedepends=("cmake" "git")
source=("${pkgname%-all-git}::git://git.${pkgname%-desktop-all-git}.org/${pkgname%-all-git}"
        "mediastreamer2.patch"
        "belle-sip.patch"
        "${pkgname%-desktop-all-git}.patch")
sha256sums=("SKIP"
            "bc0589eb2739aee429db9c67aa4308fcd817324ef5248b1766efee717798a900"
            "8a365864cfa8c6eb517701bcb2a2a7d51009bf504c104884ed3fbd05a36b3a84"
            "1db32dff8a93d7508dbbb7d293860f72a33a54da3e3499f5a5535d2a351a88ce")

prepare() {
  cd "${srcdir}/${pkgname%-all-git}"

  msg2 "Synchronizing submodules..."
  git submodule sync

  msg2 "Updating submodules..."
  git submodule update --init --recursive
  
  patch -Np1 -i "../mediastreamer2.patch"
  patch -Np1 -i "../belle-sip.patch"
  patch -Np1 -i "../${pkgname%-desktop-all-git}.patch"
}

pkgver() {
  cd "${srcdir}/${pkgname%-all-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[a-Z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${srcdir}/${pkgname%-all-git}"

  msg2 "Preparing build..."
  CXXFLAGS="$CXXFLAGS -w"
  ./prepare.py -c
  ./prepare.py --list-cmake-variables -DENABLE_STRICT=NO -DENABLE_STATIC=NO

  msg2 "Building..."
  make
}

package() {
  cd "${srcdir}/${pkgname%-all-git}"

  msg2 "Installing in /opt"
  install -d "${pkgdir}/opt"
  cp -r "OUTPUT/desktop" "${pkgdir}/opt/${pkgname%-all-git}"
}
