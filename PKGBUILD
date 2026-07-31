# Maintainer: ember-ana <aur.public at following domain> (https://thei.rs)
_pkgname="sable"
pkgname="${_pkgname}-git"
pkgver=1.20.0.r1044.gc160f50
pkgrel=1
pkgdesc="An almost stable Matrix client."
arch=("x86_64")
url="https://github.com/SableClient/Sable"
license=("AGPL-3.0-only")
depends=(
  # https://gitlab.archlinux.org/archlinux/packaging/packages/cinny-desktop/-/blob/7c248e0fff3f5883564236f56382630215a76855/PKGBUILD
  "openssl"
  # https://github.com/SableClient/Sable/blob/25434c2874adb130f80ce00b399a901149924740/scripts/cef/package.sh
  "libayatana-appindicator" "libpulse"
  # namcap
  "nss" "nspr"
  # https://v2.tauri.app/distribute/aur/#publishing-to-the-arch-user-repository
  "cairo" "desktop-file-utils" "gdk-pixbuf2" "glib2" "gtk3"
  "hicolor-icon-theme" "libsoup3" "pango" "webkit2gtk-4.1"
)
makedepends=(
  # vcs
  "git"
  # tauri + frontend
  "nodejs" "pnpm" "rust"
  # https://v2.tauri.app/start/prerequisites/#linux
  # https://github.com/SableClient/Sable/blob/25434c2874adb130f80ce00b399a901149924740/mise.tauri.toml#L42
  "librsvg" "xdotool" "curl" "wget"
)
optdepends=(
  "libnotify: Notifications"
  "xdg-utils: Open links, files, etc"
)
source=(
  "${_pkgname}::git+https://github.com/SableClient/Sable.git"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)
b2sums=(
  "SKIP"
  "62eb6cad8ba4c101daa953dd5726ccc605def65cb725c26ae8288955261b59badbeae344c325e11072b13ee966b8fe56f5de96244593465bbab0d2b17281317c"
  "206810829d415a052f9a71c987154b1ff32830f148ff7661c25f4a457b06e7b57360eb4b2991dfee50daf6c59efb503976606090d4010c0160270ce462d3d68c"
)

provides=("sable")
conflicts=("sable")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --abbrev=7 --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install --frozen-lockfile
  pnpm run tauri:cef build --no-updater
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -Dm755 "src-tauri/target/release/sable" "$pkgdir/usr/lib/$_pkgname/$_pkgname"
  scripts/cef/copy-libs.sh release "$pkgdir/usr/lib/$_pkgname"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "public/res/svg/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  for size in 32x32 64x64 128x128; do
  install -Dm644 "src-tauri/icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/$_pkgname.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  cd "$srcdir"
  install -Dm644 "sable.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 "sable.sh" "$pkgdir/usr/bin/$_pkgname"
}
