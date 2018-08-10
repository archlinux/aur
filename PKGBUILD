# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=linphone-desktop-all-git
pkgver=4.1.1.r520.b2e96277
pkgrel=2
pkgdesc="A free VoIP and video softphone based on the SIP protocol (Installed in /opt with all deps included)."
arch=("x86_64")
url="https://www.${pkgname%-desktop-all-git}.org/"
license=("GPL2")
depends=("qt5-base" "qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-svg" "qt5-tools")
makedepends=("cmake" "doxygen" "git" "graphviz" "ladspa" "python-pystache" "yasm")
conflicts=("linphone-dekstop")
source=("${pkgname%-all-git}::git://git.${pkgname%-desktop-all-git}.org/${pkgname%-all-git}"
        "${pkgname%-desktop-all-git}.desktop"
        "${pkgname%-all-git}-submodules.patch")
sha256sums=("SKIP"
            "0a3212622757639905b0d82bcb2b4ebfef11dc7312011c4413334db70ca2e1e6"
            "a37f04a276899944c0c0def3fffe5486c1cd33ede0632c79f1c5daf6e33c2eed")

prepare() {
  cd "${srcdir}/${pkgname%-all-git}"

  msg2 "Synchronizing submodules..."
  git submodule sync

  msg2 "Updating submodules..."
  git submodule update --init --recursive
  
  #git submodule --quiet foreach --recursive 'git diff --src-prefix=a/${name}/ --dst-prefix=b/${name}/' > submodules.patch
  patch -Np1 -i "../${pkgname%-all-git}-submodules.patch"
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

  msg2 "Removing possible possible link in /tmp/linphone-desktop ..."
  rm -rf "/tmp/${pkgname%-all-git}"

  msg2 "Moving source files to /tmp/linphone-desktop ..."
  mv "${srcdir}/${pkgname%-all-git}" "/tmp/"

  msg2 "Preparing build..."
  cd "/tmp/${pkgname%-all-git}"
  ./prepare.py -c
  ./prepare.py --list-cmake-variables -DENABLE_RELATIVE_PREFIX=YES

  msg2 "Building..."
  make

  msg2 "Leaving installation files as expected..."
  mv "/tmp/${pkgname%-all-git}" "${srcdir}"
}

package() {
  cd "${srcdir}/${pkgname%-all-git}"

  msg2 "Installing desktop file into /usr/share/applications/"
  install -D -m 0644 "${srcdir}/${pkgname%-desktop-all-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-desktop-all-git}.desktop"
  
  msg2 "Installing in /opt"
  install -d "${pkgdir}/opt"
  cp -r "OUTPUT/desktop" "${pkgdir}/opt/${pkgname%-all-git}"

  msg2 "Installing icons"
  install -d "${pkgdir}/usr/share"
  mv "${pkgdir}/opt/${pkgname%-all-git}/share/icons" "${pkgdir}/usr/share"

  #cp -r "OUTPUT/desktop" "${pkgdir}/usr"
  #Conflicting packages if installed in /usr
  #bcmatroska2-git
  #bctoolbox-git
  #belcard-git
  #belle-sip-git
  #belr-git
  #bzrtp-git
  #ffmpeg
  #gsm
  #libsrtp
  #libvpx
  #libxml2
  #linphone-desktop-git
  #linphone-git
  #mbedtls
  #mediastreamer-git
  #minizip-git
  #opus
  #ortp-git
  #speex
  #speexdsp
  #sqlite
  #v4l-utils
  #zlib
}
