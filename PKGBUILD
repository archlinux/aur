# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.1.4
pkgname=lemonade-desktop
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)"
pkgver=9.1.4
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
depends=('electron' 'lemonade-server')
makedepends=('npm')
provides=('lemonade-desktop')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
"$pkgname.sh"
"$pkgname.desktop"
)

sha256sums=(
'ca1a439e4e184aaea1cbfb13ed470905a905758f4d63cdeffe7e56ac00e2b89d'
'e232749150095212ea3b74b798a81a16eb409443a4b57dca670cd4f38caa9f2b'
'd79018cd17fd8524f45f336d63ec86b39f3d3a8e75736cecec9f495ebdce20fa'
)

_npmargs="--cache '$srcdir/npm-cache' --no-audit --no-fund"


prepare() {
  cd $srcdir/lemonade-$pkgver/src/app
  npm $_npmargs install
}

build() {
  cd $srcdir/lemonade-$pkgver/src/app
  npm $_npmargs run build
}

package() {
  install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"

  cd $srcdir/lemonade-$pkgver/src/app/
  install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" dist-app/linux-unpacked/resources/app.asar
  install -Dm0644 assets/logo.svg "$pkgdir/usr/share/icons/$pkgname.svg"
}
