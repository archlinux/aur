# Maintainer: Pavel Horniak <gouster4@gmail.com>
pkgname=xperia-flashtool-git
pkgver=master
pkgrel=1
pkgdesc='A S1 protocol flashing software for Sony Xperia phones'
arch=('x86_64')
license=('GPL3+')
url="http://www.flashtool.net/"
depends=('libselinux' 'libsystemd' 'glib2' 'mono' 'java-environment')
makedepends=('p7zip' 'ant' 'gcc' 'expat' 'zlib' 'make' 'java-environment-common')
source=("git://github.com/Androxyde/Flashtool"
"Flashtool.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}


build() {
   cd "$srcdir"/Flashtool
   mkdir ./bin
   export JAVA_HOME=$(find /usr/lib/jvm -name 'javac' | sed "s:/bin/javac::")
   ant -buildfile ant/deploy-release.xml
}

package(){
  # Moving everything to pkg/.
  mkdir "$pkgdir"/usr "$pkgdir"/usr/lib "$pkgdir"/usr/bin "$pkgdir"/usr/share "$pkgdir"/usr/share/applications "$pkgdir"/usr/share/icons
  mv "${srcdir}/Deploy/FlashTool" "${pkgdir}/usr/lib/FlashTool"
  ln -s $JAVA_HOME "$pkgdir"/usr/lib/FlashTool/x10flasher_native/jre
  ln -s /usr/lib/FlashTool/FlashTool "$pkgdir"/usr/bin/flashtool
  install "Flashtool.desktop" "${pkgdir}/usr/share/applications/Flashtool.desktop"
  install "Flashtool/src/gui/ressources/icons/flash_512.png" "${pkgdir}/usr/share/icons/Flashtool.png"
}

