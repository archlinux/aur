# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

_pkgname=e-foto
pkgname=$_pkgname-svn
pkgrel=1
pkgver=434
pkgdesc="A free GNU/GPL educational digital photogrammetric workstation"
arch=(i686 x86_64)
url=http://www.efoto.eng.uerj.br
license=(GPL2)
depends=('shapelib' 'qt4')
makedepends=('svn' 'cmake')
optdepends=()
options=()
conflicts=('e-foto')
provides=('e-foto')
source=($pkgname::svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  svnversion | egrep -o "[0-9]+"
}

build() {
  cd ${pkgname}

  qmake-qt4
  make
}

package() {
  cd ${pkgname}
  
  make DESTDIR="$pkgdir" install || return 1
  
  mkdir -p ${pkgdir}/usr/{bin,share/{applications,pixmaps}}
  install -m 755 -p "./build/bin/e-foto" "${pkgdir}/usr/bin/e-foto"
  install -D -m644 efoto.ico "${pkgdir}/usr/share/pixmaps/efoto.ico"  
  
  echo "[Desktop Entry]
    Name=${_pkgname}
    Comment=A free GNU/GPL educational digital photogrammetric workstation
    Exec=/usr/bin/e-foto
    Icon=/usr/share/pixmaps/efoto.ico
    Terminal=false
    Type=Application
    X-MultipleArgs=false
    Categories=GTK;Science;" > "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}    
