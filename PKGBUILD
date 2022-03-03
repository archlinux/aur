# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buck
pkgver=2021.01.12.01
pkgrel=2
pkgdesc="A fast build system that encourages the creation of small,`
  ` reusable modules over a variety of platforms and languages."
arch=('any')
depends=('jre8-openjdk-headless' 'python')
makedepends=('jdk11-openjdk' 'ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
    'buck.shim'
    'github-pr-2680.patch'
    'pex-collections.patch'
)
sha512sums=(
    '8fb9a8caf52be9c62bdca8f22c2236c924d8f0b4400e350032179f2029eba6b603ea6bf13d6d5dfd87a423b9e7f78fdf6d471cddc9777af3d7de8f65e8667ccc'
    '74913c1a7c70a38ba937e07fab6f94027d1f67acaceeee53d5536d8f3f94b1b1fd95798938022b30478681cebe7feec7b1d259db2c5958109904c632cf8c8c0b'
    'c01ba400eb4891f6f132cba35719c93637b125f02489bf8e602e19c439863bd8d22c8518a40e7c3f98251d718f399783c90f4f6f10285194bd9e728c111d35e7'
    'cd8eba0dcaec2a2a4ad7a92fe4eb8b50aa091bcdddca298f8e8d11ce08fb1ce22f4d2c94dac033d1e90e0488f950c14eaece1c9f5158289ed491fd628c4a6c3e'
)

prepare() {
  # Apply patch of PR-in-progress to work around a Python 3.10
  # incompatibility.
  # For details, see: https://github.com/facebook/buck/issues/2678
  patch -p1 -d "${pkgname}-${pkgver}" < "${srcdir}/github-pr-2680.patch"

  # Work around an issue in vendored pex.
  # For details, see: https://github.com/facebook/buck/issues/2678#issuecomment-1034635921
  patch -p1 -d "${pkgname}-${pkgver}" < "${srcdir}/pex-collections.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
  ant
  ./bin/buck build buck
}

package() {
  cd "${pkgname}-${pkgver}"
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}/usr/share/java/${pkgname}/bin/buck"
  install -Dm 755 "${srcdir}/buck.shim" "${pkgdir}/usr/bin/buck"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ./bin/buck kill

  # Remove package srcdir from watchman watch list.
  if command -v watchman > /dev/null
  then
    watchman --no-spawn --no-local watch-del "${srcdir}/${pkgname}-${pkgver}" > /dev/null 2>&1 || true
  fi
}
