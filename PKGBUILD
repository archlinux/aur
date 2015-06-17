# Maintainer: M0Rf30

pkgname=codebox
pkgver=0.8.1
pkgrel=1
pkgdesc="Open source cloud & desktop IDE"
arch=('i686' 'x86_64')
url="https://www.codebox.io"
license=('APACHE')
depends=('nodejs' 'chromium')
makedepends=('nodejs-grunt-cli' 'python2')
conflicts=('codebox-git')
provides=("codebox")
options=('!strip')
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_packagename=codebox-${pkgver}
_DEST="/var/lib/codebox"

source=(https://github.com/CodeboxIDE/codebox/archive/$pkgver.tar.gz
        codebox.desktop
	codebox.png
	codebox.sh
	patch)

export PYTHON=/usr/bin/python2

prepare() {
  cd ${srcdir}/${_packagename}
  
  patch -Np1 -i ../patch

  # Get dependencies
  npm install
}

build() {
  cd ${srcdir}/${_packagename}

  # Build
  grunt build
}

package() {
  cd ${srcdir}/${_packagename}
 
 # Program
  msg2 "Installing program to ${_DEST}"
 
 #Create folder for user codebox
  install -dm755 $pkgdir/${_DEST}
  cp -r * $pkgdir/${_DEST}
  
  chown 518:518 -R $pkgdir/${_DEST}

  # Link to program
  install -vDm755  $srcdir/codebox.sh $pkgdir/usr/bin/codebox


  # Desktop file
  install -Dm644 "${srcdir}/codebox.desktop" "${pkgdir}/usr/share/applications/codebox.desktop"

  # Icon
  install -Dm644 "${srcdir}/codebox.png" "${pkgdir}/usr/share/pixmaps/codebox.png"
}

md5sums=('47ffd457c77202585a8992efc6ad2c21'
         'a8fc2754ad75e7d862afd30a2a0489f9'
         '6c86317e59784c87ea0c2280f6daf8ff'
         'd902fa5bcab6ba80bb223467194347ff'
         '56a9ae4523f31a76c5981ef23fbdd6df')
