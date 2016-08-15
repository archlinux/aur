# Maintainer: Simon Bachmann <simonbachmann@bluewin.ch>

pkgname=tkcon-cvs
pkgver=20160814
pkgrel=1
pkgdesc="TkCon is an enhanced interactive console for developing in Tcl."
url="http://tkcon.sourceforge.net"
license=('BSD')
arch=(any)
depends=('tcl' 'tk')
makedepends=('cvs')
conflicts=('tkcon')
provides=('tkcon')
source=('under-patch.diff')
md5sums=('aba22675d6dc3bdc4685f334ef2e7a4d')

_cvsroot=pserver:anonymous@tkcon.cvs.sourceforge.net:/cvsroot/tkcon
_cvsmod=tkcon

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d:"$_cvsroot" co -D "$pkgver" -f -P "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  #
  # patch tkcon.tcl
  #
  patch -p1 < "$srcdir/under-patch.diff"
}

package() {
  cd "$srcdir/$_cvsmod-build"
  install -D -m644 -t "${pkgdir}/usr/share/${pkgname}-${pkgver}/docs/" docs/*.html docs/*.txt docs/*.css docs/*.png
  install -D -m644 docs/license.terms "${pkgdir}/usr/share/licenses/${pkgname}/licensce.terms"
  install -D -m644 index.html "${pkgdir}/usr/share/${pkgname}-${pkgver}/index.html"
  install -D -m644 -t "${pkgdir}/usr/share/man/mann/" docs/*.n.man 
  install -D -m644 -t "${pkgdir}/usr/share/man/man1/" docs/*.1.man
  #install -D -m755 "${srcdir}/tkcon-run.sh ${pkgdir}/usr/bin/tkcon"
  install -D -m755 tkcon.tcl "${pkgdir}/usr/share/$pkgname-$pkgver/tkcon.tcl"
  install -d "${pkgdir}/usr/bin/"
  cd "${pkgdir}/usr/bin/"
  ln -s "../share/${pkgname}-${pkgver}/tkcon.tcl" "tkcon"
}

