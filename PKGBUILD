# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=linphone-desktop-all-git
pkgver=4.1.1.r522.578e1a27
pkgrel=1
pkgdesc="A free VoIP and video softphone based on the SIP protocol (Installed in /opt with all deps included)."
arch=("x86_64")
url="https://www.${pkgname%-desktop-all-git}.org/"
license=("GPL2")
depends=("qt5-base" "qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-svg" "qt5-tools")
makedepends=("cmake" "doxygen" "git" "graphviz" "ladspa" "python-pystache" "yasm")
conflicts=("${pkgname%-all-git}")
source=("${pkgname%-all-git}::git://git.${pkgname%-desktop-all-git}.org/${pkgname%-all-git}"
        "${pkgname%-desktop-all-git}.desktop"
        "${pkgname%-all-git}-submodules.patch")
sha256sums=("SKIP"
            "87cab988f97e522252f308c6190dd7f2b47c553336e3f0fd839cfd2c23da42ba"
            "2896ee561bae9a99277202d715999b1b4b1597da025e11f47570a9c097cee4c9")

prepare() {
  cd "${srcdir}/${pkgname%-all-git}"

  msg2 "Synchronizing submodules..."
  git submodule sync

  msg2 "Updating submodules..."
  git submodule update --init --recursive
  
  #Patch generated via: git submodule --quiet foreach --recursive 'git diff --src-prefix=a/${name}/ --dst-prefix=b/${name}/' > submodules.patch
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

  msg2 "Removing possible link in ${pkgname%-all-git} ..."
  rm -rf "/tmp/${pkgname%-all-git}"

  msg2 "Moving source files to ${pkgname%-all-git} ..."
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
}
