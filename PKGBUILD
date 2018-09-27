# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

pkgname=electra-wallet-git
_pkgname=electra-wallet
pkgver=0.r100.1554030
pkgrel=1
pkgdesc='QT-wallet for Electra blockchain.'
arch=('any')
url='https://github.com/electra01/Electra'
license=('MIT')
depends=('openssl-1.0' 'miniupnpc' 'db4.8')
makedepends=('git' 'gendesk' 'qt5-tools')
source=("${pkgname}"::"git://github.com/Electra-project/electra"
        "electra_enable_build_with_boost_166.patch"
        "electra_build_on_arch_qmake.patch"
        "electra-wallet.png")
sha256sums=('SKIP'
            '59c2943cd8bb3b1e2ecdba5591b99e0dd1c8ee6d5115ecbd4c2d5c980bfa8387'
            '4dc9609862794e104ab11a1f0870ea16d5e42b81f6de9c7c6ebb018549851db0'
            '88e42e495f1c4ea917ac559f32506b44ed83447760c4d8eb97d65691d1ae1682')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  # apply patch enable boost 1.66 build
  patch -p1 < ../electra_enable_build_with_boost_166.patch

  # apply patch qmake arch build 
  patch -p1 < ../electra_build_on_arch_qmake.patch

  qmake RELEASE=1

  make -j$(nproc)
}

prepare() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --name "$pkgshortname"
}

package() {
  cd "$srcdir"
  
  install -Dm644 "$_pkgname.png" "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm755 "$pkgname/Electra-qt" "$pkgdir"/usr/bin/$_pkgname
}
