# Maintainer: Olivier Magnier <tarpediem@gmail.com>
pkgname=zenvision-studio-git
_pkgname=zenvision-studio
pkgver=0.2.0.r0.g0000000
pkgrel=1
pkgdesc="Drive the ASUS ZenVision lid OLED with live applets and a web UI (git/main)"
arch=('any')
url="https://github.com/tarpediem/zenvision-studio"
license=('MIT')
depends=('python' 'python-pyusb' 'python-pillow' 'python-fastapi' 'python-uvicorn'
         'python-multipart' 'python-psutil' 'python-dbus-next')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=('python-numpy: audio spectrum + visualisers'
            'python-imageio: video/GIF playback in the media applet'
            'ffmpeg: video decoding backend for imageio'
            'libpulse: parec audio capture for the VU-meter / visualisers'
            'python-pystray: system-tray icon (zvstudio tray)'
            'python-gobject: AppIndicator backend for the tray'
            'libayatana-appindicator: KDE/SNI tray backend')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # no-op once main drops it; kept so the package builds on older checkouts too
  sed -i '/\[tool.hatch.build.targets.wheel.force-include\]/,+1d' "$_pkgname/pyproject.toml"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 udev/70-zenvision.rules "$pkgdir/usr/lib/udev/rules.d/70-zenvision.rules"

  install -dm755 "$pkgdir/usr/lib/systemd/user"
  sed 's|%h/.local/bin/zvstudio|/usr/bin/zvstudio|' systemd/zvstudio.service \
      > "$pkgdir/usr/lib/systemd/user/zvstudio.service"

  install -Dm644 systemd/zvstudio-tray.desktop \
      "$pkgdir/usr/share/applications/zenvision-studio-tray.desktop"
  install -Dm644 zvstudio/web/logo.png \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/zvstudio.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
