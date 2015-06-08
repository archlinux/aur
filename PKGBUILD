# Maintainer: Nigel Michki <nigeil@yahoo.com>
pkgname=sonic-pi-git
pkgver=v2.3.0.r15.gabcd931
pkgrel=2
pkgdesc="A music-centric programming environment, originally built for the raspberry pi."
arch=('i686' 
      'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
groups=()
depends=('sed'
	 'ruby'
	 'libffi'
	 'lua'
	 'qscintilla-qt5'
	 'jack')
makedepends=('cmake'
	     'git'
	     'supercollider'
        'qt5-tools')
optdepends=('qjackctl: for graphical jackd spawning/configuration'
	    'jack2: better jackd if you want to use without gui')
source=('sonic-pi::git+https://github.com/samaaron/sonic-pi.git'
	'Qt5scintilla2_archLib.patch'
	'launcher.sh'
   'sonic-pi-git.png'
   'sonic-pi-git.desktop')
md5sums=('SKIP'
         '68932f655fca2779a9e8a001d917ca6d'
         '9c6a820718f549d9c49dfb3d9a8b102e'
         'ba86680be610cc3d6f12d4a89b0f434d'
         'f283c44f25e1297008a34f42af3588bc')

prepare() {
  msg2 "Fix wrongly-named (on Arch) QT library"
  patch -p1 $srcdir/sonic-pi/app/gui/qt/SonicPi.pro $srcdir/Qt5scintilla2_archLib.patch
}

build() {
#Based on instructions from INSTALL.md in upstream sources
#Building
  cd $srcdir/sonic-pi
  cd app/server/bin
  ./compile-extensions.rb
  cd ../../gui/qt
  ./rp-build-app
#Remove object files
  #cd $srcdir
  #rm -r *.o
}

pkgver() {
  cd $srcdir/sonic-pi
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
#Install sources to /opt/
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/sonic-pi-git
  cp -R $srcdir/sonic-pi $pkgdir/opt/sonic-pi-git/
#Add a launcher script to /usr/bin
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  install -Dm644 "$srcdir/launcher.sh" "$pkgdir/usr/bin/sonic-pi"
  chmod +x $pkgdir/usr/bin/sonic-pi
#Add a desktop entry
  mkdir $pkgdir/usr/share
  mkdir $pkgdir/usr/share/applications
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  mkdir $pkgdir/usr/share/pixmaps
  install -Dm644 "sonic-pi-git.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
#Install the license to /usr/share/licenses
  mkdir $pkgdir/usr/share/licenses
  mkdir $pkgdir/usr/share/licenses/sonic-pi-git
  install -Dm644 "$srcdir/sonic-pi/app/gui/qt/info/LICENSE.html" "$pkgdir/usr/share/licenses/sonic-pi-git/LICENSE.html" 
}
