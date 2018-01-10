# Maintainer: dreieck

_pkgname=vtrunkd
pkgname="${_pkgname}-git"
_pkgver="latest"
pkgver=0.1601_10_g82e93_dirty
pkgrel=2
pkgdesc='Universal network link bonding and multichannel VPN.'
url='http://github.com/VrayoSystems/vtrunkd'
license=('GPL2')
arch=('arm' 'arm64' 'i686' 'x86_64')
depends=(
  'libbsd'
  'lzo'
  'openssl'
  'zlib'
)
makedepends=(
  'bison'
  'flex'
)
checkdepends=(
)
provides=("${_pkgname}=${pkgver}")
# replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=(
  "${_pkgname}::git+http://github.com/VrayoSystems/${_pkgname}"
  'howtos.url'
  'website.url'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  cat version.h | sed -n -E 's|^[[:space:]]*#define[[:space:]]+VERSION[[:space:]]+([^[[:space:]]]*)|\1|p' | tr -d \"\' | tr '-' '_' | sed 's|^v||'
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  # --sbindir=/usr/bin needed due to arch linux directory standards; otherwise a conflict over existing files would be issued at installation.
  # Some options are disabled since they would lead to build errors (--enable-seld-testing and --enable-debugg would fail to build).
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --enable-o3 \
    --enable-sum-send \
    --enable-mark \
    --enable-syslog \
    --disable-low-mem \
    --disable-json \
    --disable-debugg \
    --disable-self-testing \
    --disable-client-only
  
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  make DESTDIR="${pkgdir}" install

  for _docfile in Credits INSTALL README.md version.h; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  
  install -D -v -m644 "${srcdir}/howtos.url" "${pkgdir}/usr/share/doc/${_pkgname}/howtos.url"
  install -D -v -m644 "${srcdir}/website.url" "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
}
