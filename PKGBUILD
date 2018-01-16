# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

pkgname=electra-wallet-git
_pkgname=electra-wallet
pkgver=0.r52.ca33111
pkgrel=1
pkgshortname="Electra Wallet"
pkgdesc='The Electra Wallet'
arch=('any')
url='https://github.com/electra01/Electra'
license=('MIT')
depends=('openssl-1.0' 'miniupnpc' 'db4.8')
makedepends=('git' 'gendesk')
source=("${pkgname}"::'git://github.com/electra01/Electra.git'
        "electra_enable_build_with_boost_166.patch"
        "electra_build_on_arch_qmake.patch"
        "$_pkgname.png::https://electraproject.org/wp-content/uploads/2017/12/1000.png")
sha256sums=('SKIP'
            '59c2943cd8bb3b1e2ecdba5591b99e0dd1c8ee6d5115ecbd4c2d5c980bfa8387'
            'af17e03dfd17dd682b1b063a1feaf09fdace3e31761d6fe634cd7cea3b93bb59'
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
