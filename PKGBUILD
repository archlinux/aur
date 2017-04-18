# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=buck
pkgver="2017.03.29.01"
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
    'force-python2.patch'
)
sha256sums=(
    'ed457db92e9298f14abca7b946b28e2e842c0b352683d6164b913a425fbdaf69'
    'dd5edf5b6e9be0ac218e1f0f7c5129d871748a6efd119491c8ec69b74ff6bfcf'
    '3a8fdece1ec9b6f75c32d574843fedc2387c11935a2ee0ec613997837e3d6ee6'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <"${srcdir}/python-test-output.patch"
  patch -p1 <"${srcdir}/force-python2.patch"
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
