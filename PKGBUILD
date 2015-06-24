
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: Alex <devkral@web.de>
pkgname=makehuman-svn
_pkgname=makehuman
pkgver=5231
pkgrel=1
pkgdesc="Parametrical modeling program for creating human bodies"
arch=('i686' 'x86_64')
url="http://www.makehuman.org/"
depends=('python2' 'python2-pyqt' 'python2-opengl' 'python2-numpy')
#optdepends=('aqsis: rendering')
license=('GPL3')
conflicts=(makehuman makehuman-nightly)
source=(makehuman.desktop makehuman.sh makehuman.png makehuman.install "${pkgname}::svn+http://makehuman.googlecode.com/svn/trunk/")
install=makehuman.install
makedepends=('subversion')

sha256sums=('c9f7042d0b1c0e94a1b0ae208b4b76420b08e53c3a186ec999c707acba5f571b'
            '0a929a27a50439595dff3e17fa1c943d9cd9683745d6b2b0ec9603e21fefcf71'
            'd48711c8446b110b30622facc4da6afb2410a8f319a2fb638f41ec06cfdba87e'
            '375998dcda6186d2361b7754ce93463397fa69cdd047a8f977f08a41f8923573'
            'SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  svnversion | tr -d [A-z]
}


package() {
  cd "$srcdir/$pkgname/$_pkgname"

  install -d -m755 "$pkgdir"/opt/$_pkgname/
  cp -a {apps,core,data,docs,licenses,license.txt,lib,makehuman.py,plugins,shared,utils} \
      "$pkgdir"/opt/$_pkgname/
  #,backgrounds
  # importers contains blender import scripts

  # remove svn files
  find "$pkgdir"/opt/$_pkgname -type d -name ".svn" -exec rm -rf '{}' '+'
  find "$pkgdir"/opt/$_pkgname -type f -name "*.exe" -exec rm '{}' '+'
  find "$pkgdir"/opt/$_pkgname -type f -name "*.bat" -exec rm '{}' '+'
  # fix python location
  find "$pkgdir"/opt/$_pkgname -type f -name "*.py" -exec sed -i 's|^#!.*|#!/usr/bin/python2|' '{}' '+'
  
  install -D -m755 "$srcdir"/$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
  
  install -D -m644 "$srcdir"/$_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -D -m644 "$srcdir"/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}
