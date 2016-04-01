# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl-git
pkgver=r610.83a3dc1
pkgrel=1
pkgdesc='Flexible Intermediate Representation for RTL'
arch=('any')
url='https://github.com/ucb-bar/firrtl'
license=('BSD')
provides=('firrtl')
conflicts=('firrtl')
depends=('java-environment' 'bash')
makedepends=('sbt' 'git')
source=('git+https://github.com/ucb-bar/firrtl.git'
       'firrtl.sh')

sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd $srcdir/firrtl
  sbt assembly
}

package() {
  jar_location="$pkgdir"/usr/share/scala/"$pkgname"

  install -d "$pkgdir"/usr/share/licenses/"$pkgname"
  install -d "$pkgdir"/usr/bin

  cd "$srcdir"

  # Install an executable bash script created for this specific
  # package (not the one in utils/bin)
  install -Dm755 \
          firrtl.sh \
          "$pkgdir"/usr/bin/firrtl

  cd firrtl

  # Install the jar
  install -Dm755 \
          utils/bin/firrtl.jar \
          $jar_location/firrtl.jar


   # Install the license
  install -Dm644 \
          src/LICENSE.txt \
          "$pkgdir"/usr/share/licenses/"$pkgname"/
}

