# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=icu
pkgname=$_target-$_pkgname
pkgver=66.1
pkgrel=2
pkgdesc='International Components for Unicode library (ARM64)'
arch=(x86_64)
url='http://site.icu-project.org/home'
license=(custom:icu)
depends=($_target-glibc)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${_pkgname}4c-${pkgver//./_}-src.tgz{,.asc}
)
sha256sums=(
  '52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e'
  'SKIP'
)
validpgpkeys=(
  'BA90283A60D67BA0DD910A893932080F4FB419E3' # "Steven R. Loomis (filfla-signing) <srloomis@us.ibm.com>"
  '9731166CD8E23A83BEE7C6D3ACA5DBE1FD8FABF1' # "Steven R. Loomis (ICU Project) <srl@icu-project.org>"
  '4569BBC09DA846FC91CBD21CE1BBA44593CF2AE0' # "Steven R. Loomis (codesign-qormi) <srloomis@us.ibm.com>"
  'FFA9129A180D765B7A5BEA1C9B432B27D1BA20D7' # "Fredrik Roubert <fredrik@roubert.name>"
  'E4098B78AFC94394F3F49AA903996C7C83F12F11' # "keybase.io/srl295 <srl295@keybase.io>"
)

_srcdir=$_pkgname/source

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p nativebuild && pushd nativebuild
  CC=gcc CXX=g++ ../configure --enable-static --disable-shared
  make
  popd

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure \
    --with-cross-build=${PWD}/../nativebuild \
    --disable-rpath \
    --disable-tests
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="${pkgdir}" install
  popd

  # Install license
  install -Dm644 "${srcdir}"/icu/LICENSE "${pkgdir}"/usr/$_target/share/licenses/icu/LICENSE
}
