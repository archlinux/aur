# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>


_gitname="gammu"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=1.42.0+301.r14406.20250131.204a3c6be
pkgrel=1
pkgdesc="GNU All Mobile Management Utilities. Latest git checkout."
arch=(
  'i686'
  'x86_64'
  'aarch64'
  'armv6h'
  'armv7h'
)
_githost='github.com'
_gituser='gammu'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("GPL-2.0-or-later")
depends=(
  'bash'
  'glib2'
  'glibc'
  'curl'
  'libdbi'
  'libbluetooth.so'
  'libgudev-1.0.so'
  'libmariadb.so'
  'libodbc.so'
  'libpq.so'
  'libusb-1.0.so'
)
makedepends=(
  'git'
  'bluez-libs'
  'cmake'
  'doxygen'
  'gettext'
  'mariadb-libs'
  'libgudev'
  'libusb'
  'postgresql-libs'
  'python>=3'
  'python-sphinx'
  'sed'
  'unixodbc'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "gammu-udev=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "gammu-udev"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DCOVERAGE=OFF \
    -DENABLE_COVERAGE=OFF \
    -DENABLE_GETOPT=ON \
    -DENABLE_PROTECTION=ON \
    -DINSTALL_BASH_COMPLETION=ON \
    -DINSTALL_DOC=ON \
    -DINSTALL_GNAPPLET=ON \
    -DINSTALL_LOC=ON \
    -DINSTALL_LSB_INIT=ON \
    -DINSTALL_MEDIA=ON \
    -DINSTALL_PHP_EXAMPLES=ON \
    -DINSTALL_S60=ON \
    -DINSTALL_UDEV_RULES=ON \
    -DLARGE_FILES=ON \
    -DLIB_SUFFIX="" \
    -DMYSQL_TESTING=OFF \
    -DODBC_TESTING=OFF \
    -DONLINE_TESTING=OFF \
    -DPIC=ON \
    -DPSQL_TESTING=OFF \
    -DUSE_WCHAR_T=ON \
    -DWITH_ALCABUS=ON \
    -DWITH_ALCATEL=ON \
    -DWITH_ALCATEL_SUPPORT=ON \
    -DWITH_AT=ON \
    -DWITH_ATGEN=ON \
    -DWITH_ATOBEX=ON \
    -DWITH_AT_SUPPORT=ON \
    -DWITH_BACKUP=ON \
    -DWITH_BLUEAT=ON \
    -DWITH_BLUEFBUS2=ON \
    -DWITH_BLUEGNAPBUS=ON \
    -DWITH_BLUEOBEX=ON \
    -DWITH_BLUEPHONET=ON \
    -DWITH_BLUETOOTH=ON \
    -DWITH_BLUETOOTH_RF_SEARCHING=ON \
    -DWITH_BashCompletion=ON \
    -DWITH_CELLBROADCAST=ON \
    -DWITH_CURL=ON \
    -DWITH_DCT4_CALENDAR_6210=OFF \
    -DWITH_DKU2AT=ON \
    -DWITH_DKU2PHONET=ON \
    -DWITH_DKU5FBUS2=ON \
    -DWITH_Doxygen=ON \
    -DWITH_FBUS2=ON \
    -DWITH_FBUS2BLUE=ON \
    -DWITH_FBUS2DLR3=ON \
    -DWITH_FBUS2PL2303=ON \
    -DWITH_GNAPGEN=ON \
    -DWITH_GNAPPLET_SUPPORT=ON \
    -DWITH_GObject=ON \
    -DWITH_Gettext=ON \
    -DWITH_Glib=ON \
    -DWITH_IRDA=ON \
    -DWITH_Iconv=ON \
    -DWITH_LibDBI=ON \
    -DWITH_Libintl=ON \
    -DWITH_MBUS2=ON \
    -DWITH_MySQL=ON \
    -DWITH_NOKIA3320=ON \
    -DWITH_NOKIA3650=ON \
    -DWITH_NOKIA6110=ON \
    -DWITH_NOKIA650=ON \
    -DWITH_NOKIA6510=ON \
    -DWITH_NOKIA7110=ON \
    -DWITH_NOKIA9210=ON \
    -DWITH_NOKIA_SUPPORT=ON \
    -DWITH_OBEXGEN=ON \
    -DWITH_OBEX_SUPPORT=ON \
    -DWITH_ODBC=ON \
    -DWITH_PHONETBLUE=ON \
    -DWITH_Postgres=ON \
    -DWITH_S60=ON \
    -DWITH_S60_SUPPORT=ON \
    -DWITH_SystemD=OFF \
    -DWITH_Threads=ON \
    -DWITH_USB=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  make -C build
}

check() {
  cd "${srcdir}"

  make -C build test
}

package() {
  cd "${srcdir}"

  make DESTDIR="${pkgdir}" -C build install


  cd "${srcdir}/${_pkgname}"

  _docfiles=(
    "${srcdir}/git.log"
    description-pak
    ChangeLog
    INSTALL
    README.en_GB
    README.de
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    COPYING
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    #ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

