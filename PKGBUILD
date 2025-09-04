# Maintainer: David Wang <cryptic.triangles AT gmail DOT com>

_gitauth='wfr'
_pkgname='unshieldv3'
pkgname="${_pkgname}-git"
pkgver=0.2.1.r9.g4e5700f
pkgrel=1
pkgdesc="Extract Installshield V3 (Z) archives (GIT version)"
arch=('x86_64')
url="https://github.com/${_gitauth}/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
source=("$pkgname::git+${url}.git")
makedepends=('make' 'cmake')
sha256sums=('SKIP')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  makedepends+=('git')
  provides+=("${_pkgname}=${pkgver%%.g*}")
  conflicts+=("${_pkgname}")
fi

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$pkgname/build"

  # https://stackoverflow.com/a/6242041 - DCMAKE_INSTALL_PREFIX
  # https://stackoverflow.com/a/6077474 - DCMAKE_*_LINKER_FLAGS
  cmake \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
  -DCMAKE_MODULE_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
  -DCMAKE_STATIC_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
  ..

  # Copy LICENSE
  cp ../LICENSE "$PWD"
}

build() {
  cd "$pkgname/build"

  make LDFLAGS+='-Wl,-z,relro,-z,now'
}

package() {
  cd "$pkgname/build"
  depends=('glibc' 'gcc-libs')

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
