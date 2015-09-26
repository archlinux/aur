# Maintainer: VirtualTam <<virtualtam@flibidi.net>>
pkgname=iannix-git
pkgver=0.9.16.r25.g78dddf7
pkgrel=1
pkgdesc="A graphical sequencer, based on Iannis Xenakis' works, for digital art."
arch=('i686' 'x86_64')
url="http://www.iannix.org/"
license=('GPL3')
depends=('alsa-lib' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glu'
         'libjpeg-turbo' 'libpng' 'libsm' 'libtiff' 'libxrender'
         'mesa' 'qt4' 'sqlite')
makedepends=('gcc' 'git')
optdepends=('ffmpeg: record and convert audio streams'
            'libfreenect: XBox Kinect'
            'libwacom: Wacom tablets and trackpads')
provides=('iannix')
_gitname=iannix
source=("${_gitname}::git+http://github.com/iannix/IanniX.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_gitname}
  # Workaround until Qmake INSTALLS are set for *nix
  echo 'target.path = /usr/bin/' >> IanniX.pro
  echo 'INSTALLS += target' >> IanniX.pro
}

build() {
  cd ${_gitname}
  PREFIX="/usr" qmake-qt4
  make
}

package() {
  cd ${_gitname}
  make INSTALL_ROOT="${pkgdir}" install
}
