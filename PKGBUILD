# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=jtharness
_version=6.0
_build=b04
pkgver=${_version}_${_build}
pkgrel=2
pkgdesc="general purpose, fully-featured, flexible, and configurable test harness very well suited for most types of unit testing"
arch=('any')
url="https://wiki.openjdk.java.net/display/CodeTools/JT+Harness"
license=('GPL2')
groups=()
depends=('java-runtime>=7')
makedepends=('ant' 'java-environment-openjdk=8' 'junit' 'java-asm')
optdepends=('junit')
checkdepends=()
provides=()
conflicts=()
install=
_tag=jt${_version}-${_build}
source=("http://hg.openjdk.java.net/code-tools/jtharness/archive/${_tag}.tar.gz"
        "${pkgname}.patch"
)
sha256sums=('acabdb1ac97644619087351e3aab3292e99c95d08833af239e21fb1a01895a3e'
            '9ec405ec5c1dc1f545aa60a374aa8fa2abe9152489ace9f266b44f8ab95b0265')
_jtdir=${pkgname}-jt${_version}-${_build}
prepare() {
  cd ${srcdir}/${_jtdir}
  patch -p1 -i "${srcdir}/${pkgname}.patch"
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant -f build/build.xml clean
}

build() {
  cd ${srcdir}/${_jtdir}
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant -f build/build.xml
}

check() {
  cd ${srcdir}/${_jtdir}
# test does not compile
#  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant -f build/build.xml test
}

package() {
  cd ${srcdir}/JTHarness-build/binaries
  install -D -m 644 lib/javatest.jar ${pkgdir}/usr/share/java/${pkgname}/javatest.jar
  install -D -m 644 lib/jtlite.jar ${pkgdir}/usr/share/java/${pkgname}/jtlite.jar
  install -Dm644 legal/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir $pkgdir/usr/share/${pkgname}
  ln -sf /usr/share/java/${pkgname} $pkgdir/usr/share/${pkgname}/lib
}
