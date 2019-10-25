# Maintainer: Adrian Petrescu <adrian@apetre.sc>
# Contributor: algebro <algebro@tuta.io>

pkgname=lizzie
pkgver=0.7.2
pkgrel=1
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero')
makedepends=('git' 'maven' 'curl')
source=("https://github.com/featurecat/lizzie/archive/${pkgver}.tar.gz"
        'lizzie.sh'
        'lizzie.desktop'
        '0.7.2.patch::https://github.com/featurecat/lizzie/commit/15f10dcfb0975ed350a74c6d79cc867e5f2e4a17.patch'
        'lznetwork.gz::http://zero.sjeng.org/networks/0d2694c5f5c6657d4b39c829b0b5f6626c3f1e09fdaad791dcb7771207e9c9c3.gz')
noextract=('lznetwork.gz')
sha256sums=('ffa468049b1d14585b2820e639e074ae8a2be6e8068d7cca9a84938c9b826a90'
            '100e1c567f150ad64f0925c84ce773c2afe0b6fc780a39e31bdf77c19adc2bed'
            'cf5d1651023f04294e580243aa7ef05bc9ebedb468631f4035fd3d5ce0f212f0'
            '1f14871d3d8cdf85927fb778a5635dc60e30263be11a30e889f94c8337022348'
            'a1cdb58a522d6a425445af071aae74df1073a67eecb8230a17eee47685d458ac')
prepare() {
  cd $srcdir/$pkgname-$pkgver

  # Use leela-zero-git's weights file instead of downloading a new one just for `mvn test`
  ln -sf /usr/share/leela-zero/networks/weights.txt network.gz

  # Patch to apply post-release commit that bumps the version number to the right one
  patch -Np1 -i "$srcdir/0.7.2.patch"
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
