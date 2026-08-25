# Maintainer: Miguel Rincon <miguelaezak at gmail dot com>

# **A split package, because the engine is not the interface.**
#
# The daemon owns the Chromium sidecar, and the Chromium profile lock means
# exactly one process may — so a machine has one daemon and as many front-ends
# as it likes. Shipping the daemon inside each front-end would put the same
# ~220 MB Electron at the same paths in two packages, which pacman refuses and
# which would be wrong even if it did not: they are one installation.
#
# So: one build, three packages. Either front-end pulls the daemon in on its
# own, and both can be installed together sharing one copy of it.
pkgbase=slipmat-git
pkgname=('slipmat-daemon-git' 'slipmat-git' 'climat-git')
_pkgname=slipmat
pkgver=0.10.0.r57.g1488b4c
pkgrel=1
arch=('x86_64')          # Widevine on Linux is x86_64 only
url="https://github.com/SoftARV/Slipmat"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'nodejs' 'npm' 'git' 'pkgconf' 'librsvg'
             'gtk4' 'libadwaita')
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

package_slipmat-daemon-git() {
  pkgdesc="Slipmat's playback daemon and the hidden Chromium it drives (latest commit)"
  # Measured with `ldd` against the bundled Chromium rather than guessed. **gtk3
  # is the surprising one** — the sidecar needs it even though the app is GTK4,
  # and nothing else here pulls it in. It was never declared and worked only
  # because most desktops happen to have it.
  depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libxkbcommon' 'mesa' 'libdrm'
           'libseccomp')
  provides=("slipmat-daemon=$pkgver")
  # **Not `slipmat`, however much it looks like it should be.** The release
  # package does own these same sidecar paths — but `slipmat-git` *provides*
  # `slipmat`, so a conflict on that name matches this package's own front-end
  # and pacman refuses the pair outright:
  #
  #   slipmat-daemon-git and slipmat-git are in conflict
  #
  # The front-ends carry that conflict instead: neither can be installed beside
  # the release package, so the daemon never arrives next to it either.
  conflicts=('slipmat-daemon')

  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/slipmatd "$pkgdir/usr/bin/slipmatd"

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

  # **Optional, and deliberately not enabled.** The first client to start finds
  # no daemon and starts one, so nobody has to run `systemctl` to play music.
  # The unit is here only for someone who wants playback to survive closing
  # every window.
  install -Dm644 packaging/systemd/slipmatd.service \
    "$pkgdir/usr/lib/systemd/user/slipmatd.service"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_slipmat-git() {
  pkgdesc="A native GNOME client for Apple Music (latest commit)"
  depends=("slipmat-daemon-git=$pkgver-$pkgrel"
           'gtk4' 'libadwaita' 'librsvg' 'hicolor-icon-theme')
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")

  cd "$srcdir/$_pkgname"
  local appid=dev.miguelrincon.Slipmat

  install -Dm755 target/release/slipmat "$pkgdir/usr/bin/slipmat"

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

package_climat-git() {
  pkgdesc="Winamp-style Apple Music in a terminal; needs a graphical session (latest commit)"
  # No toolkit: it draws itself. The daemon behind it still needs a display
  # server for Chromium, which is why this cannot run over plain SSH — see the
  # README it installs.
  depends=("slipmat-daemon-git=$pkgver-$pkgrel")
  provides=("climat=$pkgver")
  # **Only `climat`.** The release `slipmat` package owns the same sidecar paths
  # the daemon does, so it would be tempting to name it here — but `slipmat-git`
  # *provides* `slipmat`, and a conflict on a name another package in this very
  # split provides means the two cannot be installed together. That is the same
  # mistake that made the daemon conflict with its own front-end, one package
  # over. Someone holding the release package and installing this gets a file
  # conflict from pacman instead, which is uglier and correct; it goes away when
  # the release package is split too.
  conflicts=('climat')

  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/climat "$pkgdir/usr/bin/climat"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 crates/climat/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
