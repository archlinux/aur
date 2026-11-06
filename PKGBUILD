# Maintainer: ember-ana <aur.public at following domain> (https://thei.rs)
_pkgname="sable"
pkgname="${_pkgname}-git"
pkgver=2.3.5.r53.g143577e
pkgrel=1
pkgdesc="An almost stable Matrix client."
arch=("x86_64")
url="https://git.sable.moe/SableClient/sable-next"
license=("AGPL-3.0-only")
depends=(
  # https://gitlab.archlinux.org/archlinux/packaging/packages/cinny-desktop/-/blob/7c248e0fff3f5883564236f56382630215a76855/PKGBUILD
  "openssl"
  # https://github.com/SableClient/Sable/blob/25434c2874adb130f80ce00b399a901149924740/scripts/cef/package.sh
  "libayatana-appindicator" "libpulse"
  # namcap
  "nss" "nspr" "libpipewire"
  # https://v2.tauri.app/distribute/aur/#publishing-to-the-arch-user-repository
  "cairo" "desktop-file-utils" "gdk-pixbuf2" "glib2" "gtk3"
  "hicolor-icon-theme" "libsoup3" "pango" "webkit2gtk-4.1"
)
makedepends=(
  # vcs
  "git"
  # tauri + frontend
  "nodejs>=24.0.0" "pnpm" "rust"
  # https://v2.tauri.app/start/prerequisites/#linux
  # https://github.com/SableClient/Sable/blob/25434c2874adb130f80ce00b399a901149924740/mise.tauri.toml#L42
  "librsvg" "xdotool" "curl" "wget"
  # calls wasm-opt during build
  "binaryen"
)
optdepends=(
  "libnotify: Notifications"
  "xdg-utils: Open links, files, etc"
)
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)
b2sums=(
  "SKIP"
  "62eb6cad8ba4c101daa953dd5726ccc605def65cb725c26ae8288955261b59badbeae344c325e11072b13ee966b8fe56f5de96244593465bbab0d2b17281317c"
  "0eb2b542eb31cc6d944173344032aef75d2b68272f6b45d2a8008a4fcbfa12548d31ca3c794ccc761768034971681acb89b8f431ec0f90491170d9667029e97e"
)
options=('!lto' '!strip')

provides=("sable")
conflicts=("sable")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --abbrev=7 --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install --frozen-lockfile
  cargo install wasm-bindgen-cli --version $(grep -zoP 'name = "wasm-bindgen"\nversion = "\K[^"]+' Cargo.lock) --root "$srcdir/$_pkgname"
  mv "$srcdir/$_pkgname/bin"/* "$srcdir/$_pkgname/node_modules/.bin/"
  pnpm run build
  pnpm --dir electron package --linux --dir
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -a electron/release/linux-unpacked/* "$pkgdir/usr/lib/$_pkgname/"
  find "$pkgdir/usr/lib/$_pkgname" -type d -exec chmod 755 {} +
  chmod 4755 "$pkgdir/usr/lib/$_pkgname/chrome-sandbox"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "static/icons/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  for size in 32x32 64x64 128x128; do
  install -Dm644 "src-tauri/icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/$_pkgname.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  cd "$srcdir"
  install -Dm644 "sable.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 "sable.sh" "$pkgdir/usr/bin/$_pkgname"
}
