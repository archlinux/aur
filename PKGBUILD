# Maintainer: Trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
pkgname=nubertctl-git
_pkgname=nubertctl
pkgver=r4.7176136
pkgrel=1
pkgdesc="Unofficial CLI and system volume sync for Nubert X/XS/A series speakers via BLE"
arch=('any')
url="https://codeberg.org/trougnouf/nubertctl"
license=('GPL3')
# python-bleak for the main script, libpulse for the pactl sync script
depends=('python-bleak' 'libpulse')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  
  # 1. Install the main python script
  install -Dm755 nubertctl.py "${pkgdir}/usr/bin/nubertctl"
  
  # 2. Install the PulseAudio/PipeWire sync script as 'nubert-sync'
  install -Dm755 nubert_pulseaudio_sync.sh "${pkgdir}/usr/bin/nubert-sync"
  
  # 3. Install documentation
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  fi
  
  # 4. Install license
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  fi
}
