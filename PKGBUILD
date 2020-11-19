# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=platon
pkgver=171020
pkgrel=2
pkgdesc="A Multipurpose Crystallographic Tool"
arch=("x86_64")
url="https://www.platonsoft.nl"
license=('custom')
depends=('gcc-libs' 'libx11')
makedepends=('gcc-fortran' 'gzip' 'tar')
source=($pkgname-$pkgver.tar.gz::"$url/spek/xraysoft/unix/$pkgname.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  mkdir share
  gzip -d *.gz
  tar xf *.tar -C share
}

pkgver() {
  cd "$srcdir/$pkgname"
  grep "IGBL(4) = " platon.f | awk -F'= ' '{print $2}'
}

build() {
  cd "$srcdir/$pkgname"
  gfortran $CFLAGS -o platon platon.f xdrvr.c -lX11
}

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir"/usr/{bin,share/licenses/$pkgname}
  install -m755 platon "$pkgdir/usr/bin"
  cp -r share/* "$pkgdir/usr/share"
  chmod -R 755 "$pkgdir/usr/share"
  cat <<EOF > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
C **********************************************************************
C * THIS PROGRAM MAY BE USED FREE OF CHARGE ONLY FOR USE WITHIN THE    *
C * ACADEMIC COMMUNITY AND NOT FOR PROFIT WITHOUT EXPLICIT PERMISSION  *
C * IT IS TO BE UNDERSTOOD THAT THE AUTHOR OR HIS UNIVERSITY CANNOT    *
C * BE HELD RESPONSIBLE FOR ANY PROBLEMS CAUSED BY ERRORS IN THE CODE  *
C **********************************************************************
EOF
}
