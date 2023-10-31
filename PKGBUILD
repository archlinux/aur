# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_origname=asap
_pyname="${_origname}"
_pkgname="${_origname}-chiptunes-player"
pkgname="${_pkgname}-git"
pkgver=6.0.0+10.r1567.20231027.29a61df
pkgrel=1
pkgdesc="Player of Atari 8-bit chiptunes for modern computers. With plugins for vlc, "
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)

_gitprotocol='git+git'
_githost='git.code.sf.net'
_giturl="${_githost}/p/${_origname}/code"
url="http://asap.sourceforge.net"
license=("GPL2")
depends=(
  'glibc'
  # 'opencl-icd-loader'
)
makedepends=(
  'cito'
  'git'
  'mads'
  'python>=3'
  'vlc'
  'xasm'
)
checkdepends=()
optdepends=(
  "python=>3: For the 'asap2wav' python executable."
  'vlc: For the VLC plugin.'
)
provides=(
  "${_origname}=${pkgver}"
  "${_pkgname}=${pkgver}"
  "asap2wav=${pkgver}"
  "python-${_pyname}=${pkgver}"
  "vlc-${_origname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "asap2wav"
  "python-${_pyname}"
  "vlc-${_origname}"
)
replaces=(
  "${_origname}<=5.3.0" # This package was previously named `asap`. There is also a completely different package called `asap` in the `bioarchlinux` repository.
)

source=(
  "${_pkgname}::${_gitprotocol}://${_giturl}"
  "cflags_ldflags_append.patch"
)
sha256sums=(
  'SKIP'
  '3e13b4e98debe50daf77472839826b6917982a764a0c1e46180da8585c3d1a6b'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
  patch -Np1 --follow-symlinks -i "${srcdir}/cflags_ldflags_append.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _majorver="$(grep -E '^[[:space:]]*#define ASAPInfo_VERSION_MAJOR' asap.h | awk '{print $3}')"
  _minorver="$(grep -E '^[[:space:]]*#define ASAPInfo_VERSION_MINOR' asap.h | awk '{print $3}')"
  _microver="$(grep -E '^[[:space:]]*#define ASAPInfo_VERSION_MICRO' asap.h | awk '{print $3}')"
  _plusver="$(git describe --tags | sed -E -e 's|-g[^-]*$||' -e 's|^[^-]*-||')"
  _ver="${_majorver}.${_minorver}.${_microver}+${_plusver}"
  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_majorver}" ]; then
  # if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> building ..."
  make
  make asapscan
  make asap-vlc
  make opencl
  make python
  ## No shabeng line is generated. Add one.
  if ! head -n1 python/asap2wav.py | grep -E '^#!/usr/bin/env python\>'; then
    sed -i '1s|^|#!/usr/bin/env python\n|' python/asap2wav.py
  fi
  #make javascript
}

check() {
  cd "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _pysitepackagesdir="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

  printf '%s\n' " --> installing ..."
  make DESTDIR="${pkgdir}" prefix="/usr" install
  make DESTDIR="${pkgdir}" prefix="/usr" install-vlc

  # install -D -v -m755 "opencl/asapcl" "${pkgdir}/usr/bin/asapcl"
  install -D -v -m755 "asapscan" "${pkgdir}/usr/bin/asapscan"

  install -D -v -m644 "python/${_pyname}.py" "${pkgdir}/${_pysitepackagesdir}/${_pyname}/__init__.py"
  install -D -v -m755 "python/asap2wav.py" "${pkgdir}/usr/bin/asap2wav"

  _docfiles=(
    "${srcdir}/git.log"
    INSTALL
    PORTS.xml
    README
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
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
