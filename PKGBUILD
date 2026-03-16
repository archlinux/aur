# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_origname=asap
_pyname="${_origname}"
_nodename="${_origname}"
_pkgname="${_origname}-chiptunes-player"
pkgname="${_pkgname}-git"
pkgver=8.0.0+12.r1749.20260316.32cba42
pkgrel=3
pkgdesc="Player of Atari 8-bit chiptunes for modern computers. With plugins for MOC, XMMS2 and VLC."
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
license=("GPL-2.0-or-later")
depends=(
  'glibc'
)
makedepends=(
  'fut'
  'gcc-libs'
  'git'
  'mads'
  'moc>=2.4'
  'opencl-icd-loader'
  'opencl-headers'
  'python>=3'
  'sdl'
  'vlc'
  'xasm'
  'xmms2'
)
checkdepends=()
optdepends=(
  "python=>3:          For the 'asap2wav' python executable."
  "nodejs:             For the 'asap2wav.js' executable."
  "sdl:                For the 'asap-sdl' executable."
  "opencl-icd-loader:  For the 'asapcl' executable."
  "gcc-libs:           For the 'asapcl' executable."
  "moc>=2.4:           For the moc plugin."
  "xmms2:              For the XMMS2 plugin."
  "vlc:                For the VLC plugin."
)
provides=(
  "${_origname}=${pkgver}"
  "${_pkgname}=${pkgver}"
  "asapconv=${pkgver}"
  "asap2wav=${pkgver}"
  "asap-sdl=${pkgver}"
  "asapscan=${pkgver}"
  "asapcl=${pkgver}"
  "asapweb=${pkgver}"
  "python-${_pyname}=${pkgver}"
  "vlc-${_origname}=${pkgver}"
  "xmms2-${_origname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "asapconv"
  "asap2wav"
  "asap-sdl"
  "asapscan"
  "asapcl"
  "asapweb"
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
  'SKIP'                                                              # main upstream source
  '3e13b4e98debe50daf77472839826b6917982a764a0c1e46180da8585c3d1a6b'  # cflags_ldflags_append.patch
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
  printf '%s\n' '     `-> make ...'
  make
  printf '%s\n' '     `-> make lib ...'
  make lib
  printf '%s\n' '     `-> make asapscan ...'
  make asapscan
  printf '%s\n' '     `-> make asapconv ...'
  make asapconv
  printf '%s\n' '     `-> make asap-sdl ...'
  make asap-sdl
  printf '%s\n' '     `-> make asap-xmms2 ...'
  make asap-xmms2
  printf '%s\n' '     `-> make asap-moc ...'
  make MOC_INCLUDE=/usr/include/moc asap-moc
  printf '%s\n' '     `-> make asap-vlc ...'
  make asap-vlc
  printf '%s\n' '     `-> make opencl ...'
  make opencl
  printf '%s\n' '     `-> make python ...'
  make python
  ## No shabeng line is generated. Add one.
  if ! head -n1 python/asap2wav.py | grep -E '^#!/usr/bin/env python\>'; then
    sed -i '1s|^|#!/usr/bin/env python\n|' python/asap2wav.py
  fi
  printf '%s\n' '     `-> make javascript ...'
  make javascript
  ## No shabeng line is generated. Add one.
  if ! head -n1 javascript/asap2wav.js | grep -E '^#!/usr/bin/env node\>'; then
    sed -i '1s|^|#!/usr/bin/env node\n|' javascript/asap2wav.js
  fi
  if ! head -n1 javascript/asapweb.js | grep -E '^#!/usr/bin/env node\>'; then
    sed -i '1s|^|#!/usr/bin/env node\n|' javascript/asapweb.js
  fi
}

check() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> testing ..."
  printf '%s\n' '    `-> make test ...'
  make test
  printf '%s\n' '    `-> make check ...'
  make check
}

package() {
  cd "${srcdir}/${_pkgname}"
  _pysitepackagesdir="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

  printf '%s\n' " --> installing ..."
  printf '%s\n' '    `-> make install ...'
  make DESTDIR="${pkgdir}" prefix="/usr" install
  printf '%s\n' '    `-> make install-lib ...'
  make DESTDIR="${pkgdir}" prefix="/usr" install-lib
  printf '%s\n' '    `-> make install-asapconv ...'
  make DESTDIR="${pkgdir}" prefix="/usr" install-asapconv
  printf '%s\n' '    `-> make install-sdl2 ...'
  make DESTDIR="${pkgdir}" prefix="/usr" install-sdl
  printf '%s\n' '    `-> make install-xmms2 ...'
  make DESTDIR="${pkgdir}" prefix="/usr" install-xmms2
  printf '%s\n' '    `-> make install-moc ...'
  make DESTDIR="${pkgdir}" prefix="/usr" MOC_PLUGIN_DIR=/usr/lib/moc/decoder_plugins install-moc
  printf '%s\n' '    `-> make install-vlc ...'
  make DESTDIR="${pkgdir}" prefix="/usr" install-vlc

  printf '%s\n' '    `-> install asapscan, opencl/asapcl ...'
  install -D -v -m755 -t "${pkgdir}/usr/bin"  asapscan opencl/asapcl

  printf '%s\n' '    `-> install Python library ...'
  install -D -v -m644 "python/${_pyname}.py" "${pkgdir}/${_pysitepackagesdir}/${_pyname}/__init__.py"
  printf '%s\n' '    `-> install asap2wav ...'
  install -D -v -m755 "python/asap2wav.py"   "${pkgdir}/usr/bin/asap2wav"

  printf '%s\n' '    `-> install JavaScript library ...'
  install -D -v -m644 -t "${pkgdir}/usr/lib/node-modules/${_nodename}"  "javascript"/{asap.js,asapweb.js}
  install -D -v -m755 -t "${pkgdir}/usr/lib/node-modules/${_nodename}"  "javascript"/asap2wav.js
  printf '%s\n' '    `-> install asap2wav.js ...'
  ln -svr "${pkgdir}/usr/lib/node-modules/${_nodename}/asap2wav.js"  "${pkgdir}/usr/bin/asap2wav.js"

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
