# Maintainer: Adrian Petrescu <adrian@apetre.sc>
# Contributor: algebro <algebro@tuta.io>

pkgname=lizzie
pkgver=0.7.4
pkgrel=2
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero')
makedepends=('git' 'maven' 'curl')
source=("https://github.com/featurecat/lizzie/archive/${pkgver}.tar.gz"
        'lizzie.sh'
        'lizzie.desktop'
        'lznetwork.gz::https://zero.sjeng.org/networks/0e9ea880fd3c4444695e8ff4b8a36310d2c03f7c858cadd37af3b76df1d1d15f.gz')
noextract=('lznetwork.gz')
sha256sums=('9c984ebe6c44f5b4798c3396dabd337f335a91c5eca890bd03f6abef974e4c91'
            '100e1c567f150ad64f0925c84ce773c2afe0b6fc780a39e31bdf77c19adc2bed'
            'cf5d1651023f04294e580243aa7ef05bc9ebedb468631f4035fd3d5ce0f212f0'
            '6937f00970b368c3a7f686f7152d3c0fc491a1ad580258c257de4d2bc58ac00d')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # Use leela-zero-git's weights file instead of downloading a new one just for `mvn test`
  ln -sf /usr/share/leela-zero/networks/weights.txt network.gz
}

build() {
  cd $srcdir/$pkgname-$pkgver

  mvn package -DskipTests
}

check() {
  cd $srcdir/$pkgname-$pkgver

  mvn test
}

package() {
  install -Dm644 "$pkgname-$pkgver"/target/lizzie-"$pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$pkgname"/"$pkgname".jar
  install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 lznetwork.gz "$pkgdir"/usr/local/share/lizzie/lznetwork.gz
}
