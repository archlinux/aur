# Maintainer: dreieck

_pkgname=vtrunkd
pkgname="${_pkgname}-git"
_pkgver="latest"
pkgver=0.1601_10_g82e93_dirty
pkgrel=6
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
# backup=('etc/vtrunkd.conf' 'etc/vtrunkd_client.conf')
backup=()
options=('!emptydirs')
source=(
  "${_pkgname}::git+http://github.com/VrayoSystems/${_pkgname}"
  "0001-Fix-multiple-linker-symbols.patch"
  'howtos.url'
  'website.url'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  cat version.h | sed -n -E 's|^[[:space:]]*#define[[:space:]]+VERSION[[:space:]]+([^[[:space:]]]*)|\1|p' | tr -d \"\' | tr '-' '_' | sed 's|^v||'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../0001-Fix-multiple-linker-symbols.patch 
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

  # Remove pre-installed config file -- we install it as an .example config under the documentation directory.
  rm -f "${pkgdir}/etc/vtrunkd.conf" "${pkgdir}/etc/vtrunkd_client.conf"

  # make install installs a symlink to itself -- so remove it, and we install it later manually.
  rm -f "${pkgdir}/usr/share/man/man8/vtrunkd.8"

  for _docfile in Credits INSTALL README.md version.h; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/${_pkgname}/vtrunkd.8" "${pkgdir}/usr/share/man/man8/vtrunkd.8"
  gzip -9 "${pkgdir}/usr/share/man/man8/vtrunkd.8"

  install -D -v -m644 "${srcdir}/${_pkgname}/vtrunkd.conf" "${pkgdir}/usr/share/doc/${_pkgname}/vtrunkd.conf.example"
  install -D -v -m644 "${srcdir}/${_pkgname}/vtrunkd_client.conf" "${pkgdir}/usr/share/doc/${_pkgname}/vtrunkd_client.conf.example"

  install -D -v -m644 "${srcdir}/howtos.url" "${pkgdir}/usr/share/doc/${_pkgname}/howtos.url"
  install -D -v -m644 "${srcdir}/website.url" "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
}
