# Maintainer: dexterlb <dexterlb@qtrp.org>

_pkgname=roc
pkgname=${_pkgname}-git
pkgver=r930.778c329
pkgrel=1
pkgdesc="Real-time audio streaming over network"
arch=('x86_64' 'i686' 'armv6l' 'armv7l' 'aarch64')
conflicts=(roc)
provides=(roc)
url="https://roc-project.github.io/"
license=('Mozilla')
depends=('openfec' 'ragel' 'libuv' 'libunwind' 'sox')
makedepends=('scons' 'clang' 'llvm' 'gengetopt')
source=('git+https://github.com/roc-project/roc.git')
sha256sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_run_scons() {
  scons \
    --prefix="${pkgdir}"/usr \
    --disable-tests --disable-examples \
    --with-openfec-includes=/usr/include/openfec \
    --build-3rdparty=pulseaudio \
    --enable-pulseaudio-modules \
    "${@}"
}

build() {
  cd "${_pkgname}"
  _run_scons
}

package() {
  cd "${_pkgname}"
  _run_scons install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
