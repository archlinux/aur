# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=buck
pkgver="2016.04.18.01"
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
    '53650306787f5eebf53595f1cc65a2a025694194d3813ede9474e1c1bd7acafc'
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
