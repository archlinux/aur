# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=xperia-flashtool-git
_pkgname=Flashtool
__pkgname=xperia-flashtool
pkgver=0.9.36.0.r7.g7529dce
pkgrel=3
pkgdesc='A S1 protocol flashing software for Sony Xperia phones'
arch=('any')
license=('GPL3+')
url="http://www.flashtool.net/"
depends=('systemd-libs' 'bash' 'glib2' 'glibc' 'alsa-lib' 'mono' 'java-runtime-common' 'java-environment-common'
                  'libx11' 'gcc-libs' 'libxrender' 'freetype2' 'libxext' 'libxtst' 'libxi' 'zlib')
makedepends=('git' 'base-devel' 'gradle' 'java-environment-common' 'java-runtime-common' 'mono-tools' 'desktop-file-utils')
conflicts=('xperia-flashtool' 'xperia-flashtool-bin')
provides=('xperia-flashtool' 'Flashtool' 'adb' 'bin2elf' 'bin2sin' 'fastboot' 'unyaffs' 'libusbx-1.0.so.0.2.0')
source=("${_pkgname}::git+https://github.com/Androxyde/Flashtool#branch=master"
               'xperia-flashtool.desktop' 'xperia-flashtool.png')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
   cd "${_pkgname}"
   export JAVA_HOME=$(find /usr/lib/jvm -name 'javac' | sed "s:/bin/javac::")
   export JAVA_HOME=/usr/lib/jvm/$(archlinux-java get)
   # Cannot pass trough this BUILD process
   gradle --stacktrace
   # Cannot pass trough this BUILD process
}

package() {
  # Install program files . . .
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/lib/"
  install -Dm755 "${srcdir}/Deploy/${_pkgname}" "${pkgdir}/usr/lib/${__pkgname}"
  ln -s "${JAVA_HOME}" "${pkgdir}/usr/lib/${_pkgname}/x10flasher_native/jre"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${_pkgname}/src/gui/ressources/icons/flash_512.png" "${pkgdir}/usr/share/icons/${__pkgname}.png"
  install -Dm644 "${__pkgname}.desktop" "${pkgdir}/usr/share/applications/${__pkgname}.desktop"
}
