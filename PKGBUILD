# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: WAntilles <wantilles@adslgr.com>
# Contributor: Lucas Tsatiris

pkgname=systester
pkgver=1.5.1
pkgrel=6
pkgdesc="System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi."
license=('GPL')
arch=(x86_64 aarch64)
url="http://systester.sourceforge.net/"
makedepends=(gmp)
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/1.5.0/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8e88b368d35f45303c586f4028ee010a0e5e67d89d8494cad0fd53359b741df5')

build() {
  cd "$srcdir"/$pkgname-$pkgver/cli

  # only x86_64 can build both cli and lite
  if [[ $CARCH == "x86_64" ]]; then
    make
  elif [[ $CARCH == "aarch64" ]]; then
    make lite
  else
    warning "Building for arm can result in an executable that will be unstable is NOT recommended!"
    exit 1
  fi
}

package() {
  pkgdesc="System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi."
  depends=('gmp')

  [[ $CARCH == "x86_64" ]] && install -Dm755 "$srcdir/$pkgname-$pkgver/cli/systester-cli" "$pkgdir/usr/bin/systester-cli"
  install -Dm755 "$srcdir/$pkgname-$pkgver/cli/systester-lite" "$pkgdir/usr/bin/systester-lite"
}

