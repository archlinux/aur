# Maintainer: 9M2PJU <9M2PJU@users.noreply.github.com>
# Tracks the native-packaging branch until the upstream PR merges;
# then point _gitbranch at main (or switch to the stable ats-mini-controller package).
pkgname=ats-mini-controller-git
_pkgbase=ats-mini-controller
pkgver=2.12.0.r27.g834e4c8
pkgrel=1
pkgdesc="RTL-SDR station browser, live signal scanner and automatic CW decoder (web UI)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/jsawyerdev/ats-mini-controller"
license=('MIT')
depends=('python' 'libusb' 'rtl-sdr')
makedepends=('git' 'python-virtualenv' 'python-pip')
provides=('ats-mini-controller')
conflicts=('ats-mini-controller')
install=ats-mini-controller-git.install
source=("git+https://github.com/9M2PJU/ats-mini-controller.git#branch=packaging/native-packages")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  _ver="$(grep -m1 -oP '^APP_VERSION = "\K[^"]+' app.py)"
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local src="$srcdir/$_pkgbase" appdir="$pkgdir/opt/ats-mini-controller"

  install -dm755 "$appdir"
  python -m venv "$appdir/venv"
  "$appdir/venv/bin/pip" install --no-cache-dir -r "$src/requirements.txt"

  install -m644 "$src"/app.py "$src"/radio_bridge.py "$src"/cw_decoder.py \
    "$src"/cw_monitor.py "$src"/audio_passthrough.py "$src"/stations_db.py "$appdir/"
  install -dm755 "$appdir/static" "$appdir/data/recordings"
  install -m644 "$src/static/index.html" "$appdir/static/"
  install -m644 "$src/data/stations.db" "$appdir/data/"

  install -Dm644 "$src/packaging/ats-mini-controller.service" \
    "$pkgdir/usr/lib/systemd/system/ats-mini-controller.service"
  install -Dm644 "$src/packaging/66-rtl-sdr.rules" \
    "$pkgdir/usr/lib/udev/rules.d/66-rtl-sdr.rules"
  install -Dm644 "$src/packaging/blacklist-rtlsdr.conf" \
    "$pkgdir/usr/lib/modprobe.d/blacklist-rtlsdr.conf"

  install -dm755 "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /opt/ats-mini-controller/venv/bin/python -m uvicorn app:app --host "${HOST:-0.0.0.0}" --port "${PORT:-8731}"\n' \
    > "$pkgdir/usr/bin/ats-mini-controller"
  chmod 755 "$pkgdir/usr/bin/ats-mini-controller"

  install -Dm644 "$src/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
