# Maintainer: Ilyas Turki <turki.ilyass@gmail.com>
pkgbase=universe-git
pkgname=(universe-git universe-desktop-git)
pkgver=0.0.6.r160.g030024d
pkgrel=1
pkgdesc='Gamepad-first game launcher: a Rust core, a PySide6 UI, games inside gamescope (latest commit)'
arch=('x86_64')
url='https://github.com/ilyasturki/universe'
license=('MIT')
makedepends=(
  'blueprint-compiler'
  'cargo'
  'git'
  'glib2-devel'
  'gtk4'
  'libadwaita'
  'maturin'
  'python-build'
  'python-installer'
  'python-setuptools'
  'scdoc'
)
checkdepends=('tzdata')
# makepkg's -flto C objects (ring's) are GCC bitcode that rust-lld cannot link; Cargo.toml strips, so a debug package would be empty
options=('!lto' '!debug')
# the stub is the flake's galaxyServiceStub
source=(
  "universe::git+$url.git"
  'GalaxyCommunication-comet-0.3.2.exe::https://github.com/imLinguin/comet/releases/download/v0.3.2/GalaxyCommunication-dummy.exe'
)
sha256sums=('SKIP'
            'c7695267da363a861af99db95cafe68b732ae743e5830b4feea1bc7ee745f99d')

pkgver() {
  cd universe
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd universe
  export RUSTUP_TOOLCHAIN=stable
  # maturin's cargo metadata resolves every platform's crates, not only the host's
  cargo fetch --locked
}

build() {
  cd universe
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p universe -p universe-desktop
  maturin build --frozen --release --compatibility linux -m crates/universe-py/Cargo.toml -o dist
  python -m build --wheel --no-isolation --outdir dist ui
  target/release/universe __generate gen
  scdoc < ui/universe-ui.1.scd > gen/man/universe-ui.1
  scdoc < crates/universe-desktop/universe-desktop.1.scd > gen/universe-desktop.1
}

check() {
  cd universe
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # the journal tests expect Paris local time, as the flake's check does
  TZ=Europe/Paris cargo test --frozen -p universe -p universe-desktop
}

package_universe-git() {
  depends=(
    'libgcc'
    'glibc'
    'hicolor-icon-theme'
    'python'
    'pyside6>=6.11'
    'python-pysdl2'
    'python-qrcode'
    'python-xkbcommon'
    'qt6-5compat'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-multimedia'
    'qt6-svg'
    'qt6-wayland'
    'sdl2'
    'systemd'
  )
  optdepends=(
    'gamescope: games run inside it'
    'mangohud: the frame rate limit and the in-game HUD'
    "lib32-mangohud: the HUD in 32-bit games, Proton's included"
    'umu-launcher: Proton launches; fetched on first use when missing'
    'heroic-gogdl: the GOG source; fetched on first use when missing'
    'legendary: the Epic Games source; fetched on first use when missing'
    'butler: the itch.io source; fetched on first use when missing'
    'steam: the Steam source'
    "gpu-screen-recorder: the capture module's recordings"
    "ffmpeg: the capture module's thumbnails and cuts"
    'trash-cli: recordings deleted to the trash'
    "game-devices-udev: /dev/uinput for the controller's key macros"
    'grim: screenshots on sway, hyprland and niri'
    'spectacle: screenshots on KDE Plasma'
    'universe-desktop-git: the library in a GTK app for mouse and keyboard'
  )
  provides=("universe=$pkgver")
  conflicts=('universe')
  cd universe
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 target/release/universe -t "$pkgdir/usr/bin"
  for kind in modules sources; do
    install -d "$pkgdir/usr/share/universe/$kind"
    cp -r "$kind/." "$pkgdir/usr/share/universe/$kind"
    rm -rf "$pkgdir/usr/share/universe/$kind"/*/tests
  done
  install -Dm644 "$srcdir/GalaxyCommunication-comet-0.3.2.exe" "$pkgdir/usr/share/universe/sources/gog/GalaxyCommunication.exe"
  install -Dm644 extension/metadata.json extension/extension.js -t "$pkgdir/usr/share/gnome-shell/extensions/universe@ilyasturki.github.io"
  install -Dm644 gen/man/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 gen/universe.fish "$pkgdir/usr/share/fish/vendor_completions.d/universe.fish"
  install -Dm644 gen/universe.bash "$pkgdir/usr/share/bash-completion/completions/universe"
  install -Dm644 gen/_universe "$pkgdir/usr/share/zsh/site-functions/_universe"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 ui/universe-ui.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 ui/icons/hicolor/scalable/apps/universe-ui.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 ui/icons/hicolor/symbolic/apps/universe-ui-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
}

package_universe-desktop-git() {
  pkgdesc='The Universe game library for mouse and keyboard: a GTK 4 and libadwaita app (latest commit)'
  depends=(
    'libgcc'
    'glibc'
    'gst-plugins-base'
    'gst-plugins-good'
    'gtk4>=1:4.22'
    'hicolor-icon-theme'
    'libadwaita>=1:1.9'
    "universe=$pkgver"
  )
  optdepends=(
    'gst-libav: recordings played in the app (H.264, HEVC)'
    'gst-plugins-bad: recordings played in the app (AV1, VA-API)'
  )
  provides=("universe-desktop=$pkgver")
  conflicts=('universe-desktop')
  cd universe
  install -Dm755 target/release/universe-desktop -t "$pkgdir/usr/bin"
  local data=crates/universe-desktop/data id=io.github.ilyasturki.UniverseDesktop
  install -Dm644 "$data/$id.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$data/$id.service" -t "$pkgdir/usr/share/dbus-1/services"
  sed -i 's|^Exec=universe-desktop|Exec=/usr/bin/universe-desktop|' "$pkgdir/usr/share/dbus-1/services/$id.service"
  install -Dm644 "$data/$id.search-provider.ini" -t "$pkgdir/usr/share/gnome-shell/search-providers"
  install -Dm644 "$data/$id.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm644 "$data/icons/apps/$id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "$data/icons/apps/$id-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dm644 gen/universe-desktop.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
