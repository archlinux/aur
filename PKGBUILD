# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=buck
pkgver="2016.09.02.01"
pkgrel=1
pkgdesc="A fast build system that encourages the creation of small, reusable modules over a variety of platforms and languages."
arch=('i686' 'x86_64')
depends=('java-runtime-headless>=7' 'python2')
makedepends=('java-environment>=7' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url="https://buckbuild.com"
license=('Apache')
source=(
    "https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
    'python-test-output.patch'
)
sha256sums=(
    'ec718c514e94dd38de4fe4ebd90d5c0d6ef262d6c43d5b633faeedb39f7b1555'
    '45f128aeb4912aa417a774fac6d27805b92193231b418dc0a1f12afc923d5402'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 <"${srcdir}/../python-test-output.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ant
  ./bin/buck build buck
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}/usr/bin/buck"
}
