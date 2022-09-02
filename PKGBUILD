# Maintainer: ramen
# Maintainer: dreieck
# Contributor: ramen <hendrikschick (at) hndrkk (dot) sh>
# Contributor: sputnick <gilles *dot* quenot *at* gmail *dot* com>
# Contributor: Maurício CA <mauricio *dot* antunes *at* gmail *dot* com>

_pkgname=xkbset
pkgname="${_pkgname}-git"
pkgver=0.8.r12.20220626.774fcef
pkgrel=4
pkgdesc="Tool to help manage many of XKB features of X window."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/stephenmontgomerysmith/xkbset"
license=('custom:BSD')
groups=()
depends=(
  'libx11'
)
makedepends=(
  'git'
)
optdepends=(
  "perl-tk: For graphical tool 'xkbset-gui'."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "${_pkgname}::git+${url}.git"
)
noextract=()
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Fixing 'Makefile' ..."
  sed -r \
      -e 's|^(X11PREFIX=/usr).*|\1|' \
      -e 's|^(X11BASE=/usr).*|\1|' \
      -e 's|^INC_PATH=.*|&/X11|' \
      -e 's|^(INSTALL_MAN1=.*)(/.*/.*)|\1/share\2|' \
      -i "Makefile"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||')"
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
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  install -d -v -m755 "${pkgdir}/usr/bin"
  install -d -v -m755 "${pkgdir}/usr/share/man/man1"

  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  for _docfile in README TODO VERSIONS; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
