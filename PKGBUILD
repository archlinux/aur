# Maintainer: dreieck

_pkgname=gosmore
pkgname="${_pkgname}-svn"
# _pkgver=2.9i
epoch=1
pkgver=latest_date20140317+svn33033
pkgrel=2
pkgdesc="A router and viewer of OpenStreetMap XML data such as the whole planet.osm or other osm files from Geofabrik."
arch=('i686' 'x86_64' 'arm' 'arm64')
url="http://wiki.openstreetmap.org/wiki/Gosmore"
license=('custom:Public Domain')
depends=(
  'gpsd>=2.9'
  'gtk2'
  'libcurl-gnutls'
  'libxml2'
)
makedepends=(
  'make'
  'subversion'
)

provides=(
  "${_pkgname}=${pkgver}"
)
replaces=(
  "${_pkgname}<=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

backup=(
)

_svnurl="http://svn.openstreetmap.org/applications/rendering/gosmore"

source=(
  "${_pkgname}::svn+${_svnurl}"
  "gosmore.gpsd_version_2.9_and_newer.patch"
)

sha256sums=(
            'SKIP'                                                             # Main source, SVN
            'b1aa8bae4927d7b06005e11f6b7b56b839c1523164d572d5f3083498e349b00c' # Patch for gpsd-versions >= 2.9
)

_pgmver() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  _ver="latest_date$(svn info | grep '^Last Changed Date' | cut -d' ' -f4 | tr -d '-')"
  
  echo "${_ver}"
  
  if [ -z "${_ver}" ]; then
    return 1
  fi
}

_svnrelease() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  _rev="$(svn info "${_unpackeddir}" | grep '^Revision' | cut -d' ' -f2)"
  
  echo "${_rev}"
  
  if [ -z "${_rev}" ]; then
    return 1
  fi
}

pkgver() {
  _unpackeddir="${srcdir}/${_pkgname}"
  
  _ver="$(_pgmver)"
  _rev="$(_svnrelease)"
  
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    echo "Aborting." > /dev/stderr
    false
    return 1
  fi
  
  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine SVN revision." > /dev/stderr
    echo "Aborting." > /dev/stderr
    false
    return 1
  fi
  
  echo "${_ver}+svn${_rev}"
}

prepare() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  find "${srcdir}"/*.patch -xtype f 2>/dev/null | while read _patch; do
    msg "Applying patch '${_patch}' ..."
    patch -p1 < "${_patch}" || exit "$?"
  done
}

build() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  # ### Generate the configure script.man gosmo
  # autoconf -o configure -v configure.in
  
  ### Configure the Makefile.
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --infodir=/usr/share/info \
    --localedir=/usr/share/locale \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc/${_pkgname}
  
  ### Build the software.
  make || return 1
}

package() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"

  ### Install the software.
  make DESTDIR="${pkgdir}" install

  ### Move documentation into the place we want it.
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m 644 "${_unpackeddir}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  
  ### Install license information.
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${_unpackeddir}/README" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
