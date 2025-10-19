# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: pika02 (https://aur.archlinux.org/account/pika02, <pikakolendo02 ät gmail döt com>)
# Contributor: Cygn
# Contributor: masmu

_pkgname=pa-dlna
pkgname="${_pkgname}-git"
pkgver=1.1+3.r448.20251004.b401cdf
pkgrel=1
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
  "pa-dlna-doc=${pkgver}"
  "pa-dlna-doc-git=${pkgver}"
  "python-pa_dlna=${pkgver}"
  "python-pa_dlna-git=${pkgver}"
  "PULSEAUDIO-DLNA-SINK"
)
conflicts=(
  "pa-dlna"
  "upnp-cmd"
  "python-pa_dlna"
  "pa-dlna-doc"
)
depends=(
  'libpulse' # For `parec` executable
  'python>=3.8'
  'python-psutil'
  'python-libpulse'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  # 'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
  'texinfo'
)
optdepends=(
  'ffmpeg: multiple formats support'
  'flac: flac transcoding support'
  'lame: mp3 transcoding support'
  'pipewire-pulse: To be used by a local pipewire implementation'
  'pulse-native-provider: To be used by a local pulseaudio implementation'
  'python-systemd: For systemd support.'
)
source=(
  "${_pkgname}::git+${url}.git"
  "pa-dlna-${pkgver}.pdf::https://pa-dlna.readthedocs.io/_/downloads/en/latest/pdf/"
  "systemd-add-startup-delay.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'bc5a81514fea014b6179e2819f6fe9caed3f3983d910e34675ed41ea9a52f268'
)

prepare() {
  cd "${srcdir}"

  if [ -e "pa-dlna.pdf" ]; then
    rm "pa-dlna.pdf"
  fi
  ln -s "pa-dlna-${pkgver}.pdf" "pa-dlna.pdf"

  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/systemd-add-startup-delay.patch; do
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
  for _target in man info text html; do # qthelp # latexpdf (do not build here since it needs a lot of dependencies; we download prebuilt PDF from upstream instead.)
    make -j1 "${_target}"
  done
  gzip -9 build/man/*
  gzip -9 build/texinfo/*.info
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/user/" systemd/pa-dlna.service

  _docfiles=(
    README.rst
    git.log
    "${srcdir}/pa-dlna.pdf"
    # docs/build/latex/pa-dlna.pdf
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

