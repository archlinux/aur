# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: pika02 (https://aur.archlinux.org/account/pika02, <pikakolendo02 ät gmail döt com>)
# Contributor: Cygn
# Contributor: masmu

_pkgname=pulseaudio-dlna-cygn
pkgname="${_pkgname}-git"
pkgver=0.6.6+1+4.r839.20221229.8fa3215
pkgrel=4
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio, Cygn edition. Latest git checkout.'
arch=(
  'any'
)
url="https://github.com/Cygn/pulseaudio-dlna"
# url="https://github.com/tnoms/pulseaudio-dlna"
license=('GPL-3.0-or-later')
provides=(
  "pulseaudio-dlna=${pkgver}"
  "pulseaudio-dlna-git=${pkgver}"
  "pulseaudio-dlna-cygn=${pkgver}"
  "python-pulseaudio_dlna=${pkgver}"
  "python-pulseaudio_dlna-git=${pkgver}"
  "PULSEAUDIO-DLNA-SINK"
)
conflicts=(
  "pulseaudio-dlna"
  "pulseaudio-dlna-git"
  "pulseaudio-dlna-cygn"
  "python-pulseaudio_dlna"
  "python-pulseaudio_dlna-git"
)
depends=(
  'glib2'
  'gtk3'
  'librsvg'
  'python>=3'
  'python-cairo'
  'python-chardet'
  'python-dbus'
  'python-docopt'
  'python-gobject'
  'python-ifaddr'
  'python-lxml'
  'python-netaddr'
  'python-netifaces'
  'python-notify2'
  'python-psutil'
  'python-pychromecast>=10'
  'python-pyroute2'
  'python-requests'
  'python-setproctitle'
  # 'python-protobuf'
  # 'python-zeroconf'
  # 'python-urllib3'
)
makedepends=(
  'git'
  'help2man'
  'python-build'
  'python-setuptools'
  'python-installer'
  # 'python-virtualenv'
  'python-wheel'
)
optdepends=(
  'faac: AAC transcoding support'
  'ffmpeg: multiple formats support'
  'flac: flac transcoding support'
  'lame: mp3 transcoding support'
  'opus-tools: opus transcoding support'
  "pulseaudio: To be used by a local pulseaudio implementation (it needs native pulseaudio, not 'pipewire-pulse')."
  'sox: wav transcoding support'
  'vorbis-tools: ogg transcoding support'
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed -E -e 's|^pulseaudio-dlna-||' -e 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  ### Remove file that gets ill-installed
  #rm -v "${pkgdir}/usr/LICENSE.txt"

  install -D -m644 -v -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md git.log
  install -D -m644 -v -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}

