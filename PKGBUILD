# Maintainer: Trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
pkgname=nubertctl-git
_pkgname=nubertctl
pkgver=r6.9af23fe
pkgrel=1
pkgdesc="Unofficial CLI and system volume sync for Nubert X/XS/A series speakers via BLE"
arch=('any')
url="https://codeberg.org/trougnouf/nubertctl"
license=('GPL3')
depends=('python-bleak' 'libpulse' 'socat')
makedepends=('git') # Corrected `Holders` to `makedepends`
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
  
  # 1. Install the main python script, making it executable
  install -Dm755 nubertctl.py "${pkgdir}/usr/bin/nubertctl"
  
  # 2. Install the PulseAudio/PipeWire sync script, making it executable
  install -Dm755 nubert_pulseaudio_sync.sh "${pkgdir}/usr/bin/nubert_pulseaudio_sync"
  
  # 3. Install systemd user service: DAEMON
  # We assume nubert-daemon@.service is in the source root
  install -Dm644 nubert-daemon@.service "${pkgdir}/usr/lib/systemd/user/nubert-daemon@.service"

  # 4. Install systemd user service: SYNC
  # We assume nubert-sync@.service is in the source root
  install -Dm644 nubert-sync@.service "${pkgdir}/usr/lib/systemd/user/nubert-sync@.service"

  # 5. Install documentation & license
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  fi
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  fi
}
