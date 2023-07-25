# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Bet4 (https://aur.archlinux.org/account/bet4it)

pkgname=libipt-git
epoch=1
pkgver=2.0+190.r929.20221010.85ee54e
pkgrel=1
pkgdesc='An Intel(R) Processor Trace decoder library'
arch=(
  'i686'
  'x86_64'
)
url='https://github.com/intel/libipt'
license=('BSD')
depends=(
  'glibc'
  'intelxed' # Required for ptxed.
)
makedepends=(
  'cmake'
  'git'
  'pandoc'   # Required for building the manpage.
)
provides=("libipt=${pkgver}")
conflicts=("libipt")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${pkgname}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DDEVBUILD=OFF \
    -DFEATURE_THREADS=ON \
    -DCOV=OFF \
    -DMAN=ON \
    -DPTDUMP=ON \
    -DPTSEG=ON \
    -DPTTC=ON \
    -DPTUNIT=ON \
    -DPTXED=ON \
    -DXED_INCLUDE=/usr/include/xed \
    -DXED_LIBDIR=/usr/lib \
    -DSIDEBAND=ON \
    .

  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -D -v -m644 README "${pkgdir}/usr/share/doc/libipt/README"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
