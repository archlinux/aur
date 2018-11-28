# Maintainer: Adrian Petrescu <apetresc at gmail dot com>
# Contributor: algebro <algebro at tuta dot io>

pkgname=lizzie
pkgver=0.6
pkgrel=1
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero')
makedepends=('git' 'maven' 'curl')
source=("https://github.com/featurecat/lizzie/archive/${pkgver}.tar.gz"
        'winrate.patch::https://github.com/featurecat/lizzie/commit/d50f73a2cfb14b8f79c315f4057de8350bd5cfe5.patch'
        'lizzie.sh'
        'lizzie.desktop')
sha256sums=('0bc244914d80d7fecab1ef22e6ad2a540992019734e4081138bb9cf757bc79cd'
            'babc24f1bdd9e5c6315aff72eb6881489ec6ea0cae8bf277285a019c918dd665'
            '58a4987ab4167aab557e1bcd2bb22daec252ce7c6397e76040c038516b74de70'
            'cf5d1651023f04294e580243aa7ef05bc9ebedb468631f4035fd3d5ce0f212f0')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # Use leela-zero-git's weights file instead of downloading a new one just for `mvn test`
  ln -sf /usr/share/leela-zero/networks/weights.txt network.gz

  # Necessary bug fix to pass tests
  patch -Np1 -i "$srcdir/winrate.patch"
}

build() {
  cd $srcdir/$pkgname-$pkgver

  mvn package
}

check() {
  cd $srcdir/$pkgname-$pkgver

  mvn test
}

package() {
  sed -i 's/network.gz/\/usr\/share\/leela-zero\/networks\/weights.txt/g' "$pkgname"-"$pkgver"/config.txt

  install -Dm644 "$pkgname-$pkgver"/target/lizzie-"$pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$pkgname"/"$pkgname".jar
  install -Dm644 "$pkgname-$pkgver"/config.txt "$pkgdir"/usr/share/"$pkgname"/config.txt
  install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
}
