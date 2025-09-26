# Maintainer: envolution
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# shellcheck shell=bash disable=SC2034,SC2154
# ci|forcedep=python-libpulse-git|
pkgname="pa-dlna"
pkgver=1.1
pkgrel=1
pkgdesc="Forwards audio to DLNA devices via PulseAudio or PipeWire (via 'python-libpulse')"
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

depends=(
  'libpulse' # For `parec` executable
  'python'
  'python-psutil'
  'python-libpulse>=0.7'
  'python-systemd'
)

makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

checkdepends=(
  'python-pytest'
)

optdepends=(
  'ffmpeg: multiple formats support'
  'flac: flac transcoding support'
  'lame: mp3 transcoding support'
  'pulse-native-provider: To be used by a local pulseaudio implementation'
  'pipewire-pulse: To be used by a local pipewire implementation'
  'pulseaudio-dlna: Service file for pa-dlna in systemd format'
)

source=(
  "git+${url}.git#tag=${pkgver}"
)

sha256sums=('eb9fb7443dc98562979982c3654f2e34b685850702ed20f5cfff63b403b3fa2b')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
