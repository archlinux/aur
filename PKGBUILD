# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=icu
pkgname=$_target-$_pkgname
pkgver=65.1
pkgrel=1
pkgdesc='International Components for Unicode library'
arch=(x86_64)
url='http://site.icu-project.org/home'
license=(custom:icu)
depends=($_target-glibc)
makedepends=()
options=(!buildflags)
source=(
  https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${_pkgname}4c-${pkgver//./_}-src.tgz{,.asc}
)
sha256sums=(
  '53e37466b3d6d6d01ead029e3567d873a43a5d1c668ed2278e253b683136d948'
  'SKIP'
)
validpgpkeys=(
  'BA90283A60D67BA0DD910A893932080F4FB419E3' #  "Steven R. Loomis (filfla-signing) <srloomis@us.ibm.com>"
  '9731166CD8E23A83BEE7C6D3ACA5DBE1FD8FABF1' #  "Steven R. Loomis (ICU Project) <srl@icu-project.org>"
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
