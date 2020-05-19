# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buck
pkgver=2020.05.14.01
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, \
	   reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('python2')
makedepends=('java-environment=11' 'ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('cd08466024b84fb450d8eabc836c2ceca89297160fce2e363580820910513adcd9b8b4aea551188ea5a81c5f993005a278a1a2971463d8beae937368bf3a0bb3')

prepare() {
  sed -i 's+executable="python"+executable="python2"+g' ${pkgname}-${pkgver}/build.xml
}

build() {
  cd "${pkgname}-${pkgver}"
  ant
  ./bin/buck build buck
}

package() {
  cd "${pkgname}-${pkgver}"
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}"/usr/bin/buck
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ./bin/buck kill

  # Remove package srcdir from watchman watch list.
  if command -v watchman > /dev/null
  then
    watchman --no-spawn --no-local watch-del "${srcdir}/${pkgname}-${pkgver}" > /dev/null 2>&1 || true
  fi
}
