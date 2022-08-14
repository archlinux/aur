# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buck
pkgver=2022.05.05.01
pkgrel=1
pkgdesc="A fast build system that encourages the creation of small,`
  ` reusable modules over a variety of platforms and languages."
arch=('any')
depends=('jdk8-openjdk' 'python')
makedepends=('jdk11-openjdk' 'ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
  'buck.shim'
)
sha512sums=(
  'b6b9c778756418025eafaa3b130fc2edf7d7455b17590af86e2b41d4d66568c235c03715f72de46523c7463fdcf04e4125c3c4df2a5718148c43880e92ef8592'
  '59655cf08e9b4c823893dc1b5eaa9f5e6c10c3f423ff814ea70e83af23f357c75c849c9648345d0c8fe3ed16f4ccf77867ddf62d134a618e745dfaeb9b7f571b'
)

prepare() {
  # Make sure the build version is set correctly for `buck --version`
  echo "v${pkgver}" > "${srcdir}/${pkgname}-${pkgver}/.buckrelease"
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
