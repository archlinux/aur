# Maintainer: Olivier Magnier <tarpediem@gmail.com>
pkgname=zenvision-studio
pkgver=0.2.1
pkgrel=1
pkgdesc="Drive the ASUS ZenVision lid OLED with live applets, audio-reactive visualisers and a web UI"
arch=('any')
url="https://github.com/tarpediem/zenvision-studio"
license=('MIT')
depends=('python' 'python-pyusb' 'python-pillow' 'python-fastapi' 'python-uvicorn'
         'python-multipart' 'python-psutil' 'python-dbus-next')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=('python-numpy: audio spectrum + visualisers'
            'python-imageio: video/GIF playback in the media applet'
            'ffmpeg: video decoding backend for imageio'
            'libpulse: parec audio capture for the VU-meter / visualisers'
            'python-pystray: system-tray icon (zvstudio tray)'
            'python-gobject: AppIndicator backend for the tray'
            'libayatana-appindicator: KDE/SNI tray backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('870dd2082bf565a309f11231b992ee39c8f3e3a6dcde6f6c496afe8a5425423f')

prepare() {
  # v0.2.0's pyproject force-includes zvstudio/web a second time (it is already
  # shipped via packages=["zvstudio"]), which makes `installer` choke on dup files.
  # Drop the redundant block; no-op on newer releases that already removed it.
  sed -i '/\[tool.hatch.build.targets.wheel.force-include\]/,+1d' "$pkgname-$pkgver/pyproject.toml"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # udev rule (uaccess; the 70- prefix must sort before 73-seat-late.rules)
  install -Dm644 udev/70-zenvision.rules "$pkgdir/usr/lib/udev/rules.d/70-zenvision.rules"

  # systemd *user* service — point ExecStart at the packaged binary
  install -dm755 "$pkgdir/usr/lib/systemd/user"
  sed 's|%h/.local/bin/zvstudio|/usr/bin/zvstudio|' systemd/zvstudio.service \
      > "$pkgdir/usr/lib/systemd/user/zvstudio.service"

  # tray launcher (menu entry; copy to ~/.config/autostart to start at login)
  install -Dm644 systemd/zvstudio-tray.desktop \
      "$pkgdir/usr/share/applications/zenvision-studio-tray.desktop"
  install -Dm644 zvstudio/web/logo.png \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/zvstudio.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
