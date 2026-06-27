# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=platon
pkgver=20260620
pkgrel=1
pkgdesc="A Multipurpose Crystallographic Tool"
arch=(x86_64 aarch64)
url="https://www.platonsoft.nl"
license=(custom)
depends=(gcc-libs libx11)
makedepends=(gcc-fortran)
source=($pkgname-$pkgver.tar.gz::"http://www.platonsoft.nl/xraysoft/unix/$pkgname.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  mkdir share
  gzip -d *.gz
  tar xf *.tar -C share
}

pkgver() {
  cd "$srcdir/$pkgname"
  local d=$(grep -m1 "IGBL(4) = " platon.f | awk -F'= ' '{print $2}' | tr -dc '0-9')
  printf '%06d' "$d" | sed -E 's/(..)(..)(..)/20\3\2\1/'
}

build() {
  cd "$srcdir/$pkgname"
  gfortran -O3 -o platon platon.f xdrvr.c -lX11
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
