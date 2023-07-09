# Maintainer: Victor Dmitriyev <mrvviter@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Simon Lipp <sloonz+aur at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=java-flexdock
pkgver=1.2.4
pkgrel=4
pkgdesc="Docking framework for Swing"
arch=('any')
url="https://gitlab.com/scilab/forge/flexdock"
license=('MIT')
depends=('java-runtime')
makedepends=(ant)
provides=('flexdock')
conflicts=('flexdock')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/scilab/forge/flexdock/-/archive/f12705f1934ea347b59f5f2befee156d29b0ea44/flexdock-f12705f1934ea347b59f5f2befee156d29b0ea44.tar.gz"
'build.xml.patch')
sha512sums=('95d190fc14cba8a2dd59acdf564de28c86c46e7a815f90ceb2a84229cf0961bde811aa1b0526a7ed2d62a52123457de3ac208f046ce3c5e05208eb23c9376a4e'
            'db755d502a66075ef149d5b762033214419e19b92e5aad8399f2157024bec5945505c404cd682add4288bc3a3a2de61534a455577d632196fb1a9464ccae7c45')

prepare () {
  mv flexdock-* flexdock
  cd flexdock
  # http://openjdk.java.net/jeps/182
  # > In JDK 9 and going forward, javac will use a "one + three back" policy of supported source and target options.
  # NOTE: I just hope, that it'll compile right.
  local java_ver="$(javac -version | sed -ne 's/^javac\s\+\([0-9]\+\.[0-9]\+\).*$/\1/p')"
  # NOTE: jdk8 outputs version on STDERR together with other messages,
  # jdk11, jdk17, jdk20 output version on STDOUT
  if [ -z $java_ver ]; then
          java_ver="$(javac -version 2>&1 | sed -ne 's/^javac\s\+\([0-9]\+\.[0-9]\+\).*$/\1/p')"
  fi
  if [ -z $java_ver ]; then
          msg2 "Couldn't read java version"
          exit 1
  fi
  # accepted: 1.8, 17
  # not accepted: 17.0
  case $java_ver in
    1.*) ;;
    *) java_ver="${java_ver%.*}" ;;
  esac
  msg2 "Using javac version $java_ver"
  sed "s/%VERSION%/$java_ver/g" < ../build.xml.patch | patch -Np0
}

build() {
  cd flexdock
  ant jar
}

package() {
  cd flexdock
  install -Dm644 "build/flexdock-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/flexdock/flexdock.jar"
  install -Dm644 "LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
