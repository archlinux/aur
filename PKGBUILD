# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="iksemel"
_gitname="${_pyname}"
_pkgname="lib${_pyname}"
pkgname="${_pkgname}-git"
pkgver=1.6.2.r177.20240917.5abdbce
pkgrel=2
pkgdesc="XML parser library mainly designed for Jabber applications. It provides SAX, DOM, and special Jabber stream APIs."
arch=(
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'aarch64'
)
_githost='github.com'
_gituser='Zaryob'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("LGPL-2.1-or-later")
depends=(
  'glibc'
  'openssl>=1.1'
  'python>=3.3'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "libiksemel.so"
  "libiksemel_openssl.so"
  "libjabber.so"
  "python-${_pkgname}=${pkgver}"
  "python-${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "libiksemel.so"
  "libiksemel_openssl.so"
  "libjabber.so"
  "python-${_pkgname}"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_pyname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > "git.log"
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

  CFLAGS+=" -Wimplicit-function-declaration"
  CXXFLAGS+=" -Wimplicit-function-declaration"
  export CFLAGS
  export CXXFLAGS

  printf '%s\n' " --> building ..."

  meson setup \
    --prefix=/usr \
    --includedir=/usr/include/iksemel \
    --buildtype=release \
    -Dopenssl=enabled \
    -Dgnutls=disabled \
    -Dwith_tools=true \
    -Dwith_python=true \
    -Dtests=true \
    "${_pkgname}" build

  meson compile -C build
}

check() {
  cd "${srcdir}"

  meson test -C build
}

package() {
  cd "${srcdir}"
  printf '%s\n' " --> installing ..."

  meson install -C build --destdir="${pkgdir}"

  _docfiles=(
    "git.log"
    README.md
    AUTHORS
    HACKING
    ChangeLog
    NEWS
    TODO
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    COPYING
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${srcdir}/${_pkgname}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${srcdir}/${_pkgname}/${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${srcdir}/${_pkgname}/${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${srcdir}/${_pkgname}/${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${srcdir}/${_pkgname}/${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

