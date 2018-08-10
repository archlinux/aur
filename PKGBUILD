# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=linphone-desktop-all-git
pkgver=4.1.1.r522.578e1a27
pkgrel=2
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
            "346d983f503873811b3a4f72772e5afe4990275526c9e15c1b5cde2ad69a0544"
            "2896ee561bae9a99277202d715999b1b4b1597da025e11f47570a9c097cee4c9")

prepare() {
  cd "${srcdir}/${pkgname%-all-git}"

  git submodule sync
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

  ./prepare.py -c
  ./prepare.py --list-cmake-variables -DENABLE_RELATIVE_PREFIX=YES -DCMAKE_INSTALL_RPATH=/opt/linphone-desktop/lib:/opt/linphone-desktop/lib64
  make
}

package() {
  cd "${srcdir}/${pkgname%-all-git}"

  install -D -m 0644 "${srcdir}/${pkgname%-desktop-all-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-desktop-all-git}.desktop"
  install -d "${pkgdir}/opt"
  cp -r "OUTPUT/desktop" "${pkgdir}/opt/${pkgname%-all-git}"

  install -d "${pkgdir}/usr/share"
  mv "${pkgdir}/opt/${pkgname%-all-git}/share/icons" "${pkgdir}/usr/share"
}
