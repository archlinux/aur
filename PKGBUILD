# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: pika02 (https://aur.archlinux.org/account/pika02, <pikakolendo02 ät gmail döt com>)
# Contributor: Cygn
# Contributor: masmu

_pkgname=pa-dlna
pkgname="${_pkgname}-git"
pkgver=0.14.r389.20241103.6c16282
pkgrel=7
pkgdesc="Forwards audio streams to DLNA devices. For PulseAudio or PipeWira (via 'python-libpulse'). Latest git checkout."
arch=(
  'any'
)
url="https://gitlab.com/xdegaye/pa-dlna"
license=('MIT')
provides=(
  "pa-dlna=${pkgver}"
  "upnp-cmd=${pkgver}"
  "upnp-cmd-git=${pkgver}"
  "python-pa_dlna=${pkgver}"
  "python-pa_dlna-git=${pkgver}"
  "PULSEAUDIO-DLNA-SINK"
)
conflicts=(
  "pa-dlna"
  "upnp-cmd"
  "python-pa_dlna"
  "python-pa_dlna-git"
)
depends=(
  'libpulse' # For `parec` executable
  'python>=3.8'
  'python-psutil'
  'python-libpulse'
)
makedepends=(
  'git'
  'imagemagick'  # For 'make latexpdf'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
  'texlive-basic'
  'texlive-bin'
  'texlive-binextra'
  'texinfo'
)
optdepends=(
  'ffmpeg: multiple formats support'
  'flac: flac transcoding support'
  'lame: mp3 transcoding support'
  'pulse-native-provider: To be used by a local pulseaudio implementation'
  'pipewire-pulse: To be used by a local pipewire implementation'
)
source=(
  "${_pkgname}::git+${url}.git"
  "fix_latexbuild_sphinx-imagemagick.patch"  # Fixes https://gitlab.com/xdegaye/pa-dlna/-/issues/31
)
sha256sums=(
  'SKIP'
  '4dec52f94fa7d6f5fc9ac8b83b9247484263adea6b62673388eee79a14528aa8'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/fix_latexbuild_sphinx-imagemagick.patch; do
    plain "Applying patch '$(basename "${_patch}" ...)'"
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed -E -e 's|^pa-dlna-||' -e 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation

  cd docs
  for _target in man info text html latexpdf; do # qthelp
    make -j1 "${_target}"
  done
  gzip -9 build/man/*
  gzip -9 build/texinfo/*.info
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  _docfiles=(
    README.rst
    git.log
    docs/build/latex/pa-dlna.pdf
  )
  _docdirs=(
    docs/build/html
    # docs/build/qthelp
    docs/build/text
  )
  _manfiles=(
    docs/build/man/*.gz
  )
  _infofiles=(
    docs/build/texinfo/*.info.gz
  )
  _licensefiles=(
    LICENSE
  )
  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  for _docfile in "${_docfiles[@]}"; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_docfile}"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}"/
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -Dvm644 -t "${pkgdir}/usr/share/man/man${_section}" "${_manfile}"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -Dvm644 -t "${pkgdir}/usr/share/info" "${_infofile}"
  done
  for _licensefile in "${_licensefiles[@]}"; do
    install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}"/
  done
}

