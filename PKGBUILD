# Maintainer: algebro <algebro at tuta dot io>
# Contributor: Adrian Petrescu <apetresc at gmail dot com>

pkgname=lizzie-git
_pkgname=lizzie
pkgver=0.6.r19.g6fa818e
_pkgver=0.6
pkgrel=1
pkgdesc="Analysis interface for Leela Zero"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime' 'leela-zero-git')
makedepends=('git' 'maven')
provides=('lizzie')
conflicts=('lizzie')
source=("git+https://github.com/featurecat/lizzie.git"
        "lizzie.sh"
        "lizzie.desktop")
sha256sums=('SKIP'
            '58a4987ab4167aab557e1bcd2bb22daec252ce7c6397e76040c038516b74de70'
            'cf5d1651023f04294e580243aa7ef05bc9ebedb468631f4035fd3d5ce0f212f0')

pkgver() {
  cd lizzie
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
  # Use leela-zero-git's weights file instead of downloading a new one just for `mvn test`
  ln -s /usr/share/leela-zero/networks/weights.txt lizzie/network.gz
  cd lizzie
  mvn package
}

check() {
  cd lizzie
  mvn test
}

package() {
  sed -i 's/network.gz/\/usr\/share\/leela-zero\/networks\/weights.txt/g' "$_pkgname"/config.txt

  install -Dm644 "$_pkgname"/target/lizzie-"$_pkgver"-shaded.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
  install -Dm644 "$_pkgname"/config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
  install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
}
