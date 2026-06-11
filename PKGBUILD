# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pclink
_app_id=xyz.bytedz.PCLink
pkgver=4.3.0
pkgrel=1
pkgdesc="Desktop app for secure remote PC control and management"
arch=('x86_64')
url="https://bytedz.com/products/pclink"
license=('AGPL-3.0-or-later AND LicenseRef-custom')
depends=(
  'gst-libav'
  'gst-plugin-pipewire'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gtk3'
  'libayatana-appindicator'
  'libnice'
  'libnotify'
  'playerctl'
  'python-click'
  'python-cryptography'
  'python-distro'
  'python-fastapi'
  'python-getmac'
  'python-gobject'
  'python-jinja'
  'python-keyboard'
  'python-mss'
  'python-multipart'
  'python-packaging'
  'python-pefile'
  'python-pillow'
  'python-psutil'
  'python-pyautogui'
  'python-pydantic'
  'python-qrcode'
  'python-requests'
  'python-websockets'
  'python-wsproto'
  'python-yaml'
  'sudo'
  'systemd'
  'uvicorn'
  'xdg-desktop-portal'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'setconf'
)
optdepends=(
  'grim: Screenshot support for wlroots-based compositors'
  'power-profiles-daemon: Required for Energy Pulse Pro Extension'
  'python-aiofiles: Improves upload performance with async file I/O'
  'python-pynput: Fallback for input control, required for Media Master Pro Extension'
  'python-evdev: Input control on Wayland'
  'python-pyperclip: Fallback for clipboard support'
  'python-pystray: Fallback for system tray'
  'spectacle: Screenshot support on KDE Plasma'
  'wl-clipboard: Clipboard support on Wayland'
)
_commit=0e99b02e33a51f411e8e2f444f365ab1b51868a9
source=("PCLink-$pkgver.tar.gz::https://github.com/BYTEDz/PCLink/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/BYTEDz/FerrumCast.git#commit=${_commit}")
sha256sums=('3b1ff6b238a03cc36a732c62d96848ced206826f39fd978bebaf1c80df9295b5'
            '72343ed67edb6ecc9cee8b71a6e0a812b135a7322c90f2ce62700d604b0fc0ee')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path=FerrumCast/Cargo.toml --locked --target host-tuple

  cd "PCLink-$pkgver"

  # Replace placeholders in service file
  setconf "scripts/linux/$pkgname.service.template" ExecStart "/usr/bin/$pkgname"
  setconf "scripts/linux/$pkgname.service.template" WorkingDirectory "%h"
  setconf "scripts/linux/$pkgname.service.template" ProtectHome "false"

  # Remove User/Group from service file as they are invalid
  sed -i '/User/,/Group/d' "scripts/linux/$pkgname.service.template"
}

build() {
  pushd FerrumCast
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  popd

  cd "PCLink-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "PCLink-$pkgver"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "PCLink-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm755 "$srcdir/FerrumCast/target/release/ferrumcast" -t \
    "${pkgdir}${site_packages}/$pkgname/assets/bin/"

  install -Dm755 "scripts/linux/$pkgname-power-wrapper" -t "$pkgdir/usr/bin/"
  install -Dm755 scripts/linux/test-power-permissions -t "$pkgdir/usr/bin/"
  install -dm750 "$pkgdir/etc/sudoers.d/"
  install -m440 "scripts/linux/$pkgname-sudoers" "$pkgdir/etc/sudoers.d/$pkgname"
  install -Dm644 "scripts/linux/$pkgname.service.template" \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 scripts/linux/99-uinput.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "assets/${pkgname}_icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "scripts/linux/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
