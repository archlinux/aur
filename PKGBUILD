# Maintainer: Miguel Rincon <miguelaezak at gmail dot com>
pkgname=slipmat-git
_pkgname=slipmat
pkgver=0.5.0.r4.gc7bfd67
pkgrel=1
pkgdesc="A native GNOME client for Apple Music (latest commit)"
arch=('x86_64')          # Widevine on Linux is x86_64 only
url="https://github.com/SoftARV/Slipmat"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'librsvg' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm' 'git' 'pkgconf')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!debug' '!lto')

# The last **tag**, then commits-since-tag and the short hash: `0.4.0.r5.gabc1234`.
#
# Deliberately *not* Cargo.toml's version, which is what this used to read.
# Between releases `main` carries the *next* version as a pre-release —
# `0.5.0-dev` — so that scheme produced `0.5.0.dev.rN.gHASH`, and pacman ranks
# the extra `.dev` segment as *later* than plain `0.5.0`. A -git build made
# before 0.5.0 therefore claimed to be newer than the 0.5.0 release, which made
# moving to the `slipmat` package look like a downgrade and let
# `provides=slipmat=0.5.0.dev…` satisfy a `slipmat>=0.5.0` it could not honour.
#
#   vercmp 0.5.0.dev.r285.gabc 0.5.0  ->  1   (wrong: -git "newer")
#   vercmp 0.4.0.r5.gabc       0.5.0  -> -1   (right)
#   vercmp 0.4.0.r5.gabc       0.4.0  ->  1   (right)
#
# Needs tags in the clone, which `makepkg` fetches by default.
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  # sidecar/.npmrc carries `allow-git=root`; npm 12 refuses git dependencies
  # without it and castLabs Electron ships only as a GitHub release.
  cd sidecar
  npm install --no-audit --no-fund
  # castLabs ships no postinstall hook — the ~200 MB Chromium is fetched by an
  # explicit step. Skip it and node_modules is 14 MB with no Electron in it.
  node node_modules/electron/install.js
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release --frozen
}

package() {
  cd "$srcdir/$_pkgname"
  local appid=dev.miguelrincon.Slipmat

  install -Dm755 target/release/slipmat "$pkgdir/usr/bin/slipmat"

  # Found via XDG_DATA_DIRS by `sidecar::locate`. Read-only: Chromium fetches
  # the Widevine CDM per-user into ~/.config/Slipmat at first run, so nothing
  # needs to write inside this directory.
  install -d "$pkgdir/usr/share/slipmat/sidecar"
  cp -r sidecar/package.json sidecar/main.js sidecar/preload.js \
        sidecar/node_modules "$pkgdir/usr/share/slipmat/sidecar/"

  # Prebuilt binaries for architectures this package is not for — 7 MB of
  # arm64, ia32, darwin and win32 shipped inside one npm dependency. They also
  # make `strip` complain during packaging, which is how they were noticed.
  find "$pkgdir/usr/share/slipmat/sidecar" -name '*.node' \
    ! -name '*linux-x64-gnu*' -delete

  install -Dm644 "data/$appid.desktop" \
    "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "data/icons/hicolor/scalable/apps/$appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  install -Dm644 "data/icons/hicolor/symbolic/apps/$appid-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$appid-symbolic.svg"

  for sz in 16 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    rsvg-convert -w "$sz" -h "$sz" "data/icons/hicolor/scalable/apps/$appid.svg" \
      -o "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$appid.png"
  done

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
