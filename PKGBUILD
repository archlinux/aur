# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>
pkgname=xperia-flashtool-git
_pkgname=Flashtool
__pkgname=xperia-flashtool
pkgver=0.9.36.0.r7.g7529dce
pkgrel=2
pkgdesc='A S1 protocol flashing software for Sony Xperia phones'
arch=('x86_64')
license=('GPL3+')
url="http://www.flashtool.net/"
depends=('systemd-libs' 'glib2' 'mono' 'java-environment-common')
makedepends=('git' 'base-devel' 'gradle' 'java-environment-common' 'mono-tools')
source=("${_pkgname}-${pkgver}::git+https://github.com/Androxyde/Flashtool#branch=master"
        'xperia-flashtool.desktop')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}-${pkgver}/"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
   cd "${_pkgname}-${pkgver}/"
   export JAVA_HOME=$(find /usr/lib/jvm -name 'javac' | sed "s:/bin/javac::")
   export JAVA_HOME=/usr/lib/jvm/$(archlinux-java get)
   gradle
}

package() {
  # Install program files
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/lib/"
  install -Dm755 "${srcdir}/Deploy/${_pkgname}" "${pkgdir}/usr/lib/${__pkgname}"
  ln -s "${JAVA_HOME}" "${pkgdir}/usr/lib/${_pkgname}/x10flasher_native/jre"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${_pkgname}/src/gui/ressources/icons/flash_512.png" "${pkgdir}/usr/share/icons/${__pkgname}.png"
  install -Dm644 "${__pkgname}.desktop" "${pkgdir}/usr/share/applications/${__pkgname}.desktop"
}
