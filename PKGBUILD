# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

# Its own AUR package rather than a split of `wdm-wayland`: WebKitGTK is the heaviest
# dependency in the project by a wide margin, and before the packaging was split
# every wdm user built against it whether or not they wanted this greeter. wdm
# depends on the virtual this provides, so pacman offers this as one of the
# choices when `wdm-wayland` is installed on its own.
pkgname=wdm-webkit-greeter
backup=('etc/wdm/webkit-greeter.toml')
pkgver=0.9.0
pkgrel=1
pkgdesc='WebKitGTK greeter for wdm, with themes written in HTML, CSS and JavaScript'
arch=('x86_64' 'aarch64')
url='https://github.com/quinnjr/wdm'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'webkitgtk-6.0')
makedepends=('cargo' 'libxkbcommon' 'gtk4' 'gtk4-layer-shell' 'webkitgtk-6.0')
provides=('wdm-greeter-implementation')
source=("wdm-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# See the note in the `wdm-wayland` package: this is the checksum of the tarball GitHub
# published, and all four wdm packages build from the same one.
sha256sums=('49e70b577665bf4fb7c78f5d9319febaf0a8268a80bdb8eb01ff95ed0db8b9f7')

# The tarball is the whole workspace whatever the pkgbase is, so the source
# directory is named for the project rather than for this package.
_src="wdm-$pkgver"

prepare() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # This crate only; see the GTK greeter's build() for why the scoping matters.
  cargo build --frozen --release -p wdm-webkit-greeter
}

check() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  # Includes the drift check that asserts the shipped theme and the docs still
  # name every field the injected JavaScript API exposes.
  cargo test --frozen --release -p wdm-webkit-greeter -p wdm-greeter-client
}

package() {
  cd "$_src"
  install -Dm755 target/release/wdm-webkit-greeter "$pkgdir/usr/lib/wdm/wdm-webkit-greeter"

  # Fully commented out, so the defaults are also the documentation. In
  # backup= so pacman delivers a changed default as a .pacnew instead of
  # clobbering an edited one.
  install -Dm644 packaging/webkit-greeter.toml.example "$pkgdir/etc/wdm/webkit-greeter.toml"

  # Themes are data, not documentation: the greeter refuses to start without the
  # one it was pointed at, and the default is the worked example of the
  # JavaScript API a theme author copies.
  local themes="$pkgdir/usr/share/wdm/webkit-greeter/themes"
  install -Dm644 -t "$themes/default" \
    crates/wdm-webkit-greeter/themes/default/index.html \
    crates/wdm-webkit-greeter/themes/default/style.css \
    crates/wdm-webkit-greeter/themes/default/theme.js

  # The arch theme brings its own Tailwind build and Font Awesome subset. They
  # are vendored because the greeter's content policy is `default-src file:
  # data:` and it runs before any network exists — a CDN <link> would not
  # degrade, it would render the login screen unstyled with every icon a
  # missing-glyph box.
  #
  # Named file by file rather than with a glob, and vendor/ listed separately,
  # because the theme is the one thing here whose failure has no log: a missing
  # stylesheet is a login screen that looks broken and says nothing.
  install -Dm644 -t "$themes/arch" \
    crates/wdm-webkit-greeter/themes/arch/index.html \
    crates/wdm-webkit-greeter/themes/arch/style.css \
    crates/wdm-webkit-greeter/themes/arch/theme.js

  # src/ and build.sh are not installed: they regenerate vendor/ and nothing
  # reads them at runtime. The licences are, and are not optional — Font
  # Awesome's icons are CC BY 4.0 and its fonts SIL OFL 1.1, both of which
  # require the licence to travel with the files.
  install -Dm644 -t "$themes/arch/vendor" \
    crates/wdm-webkit-greeter/themes/arch/vendor/*

  # The React theme, as its built artefacts only. src/, package.json and the
  # Vite config produce vendor/ and are read by nothing at runtime — and npm is
  # deliberately not a build dependency of this package, because a build chroot
  # has no network and vendor/ is checked into the tree for that reason.
  install -Dm644 -t "$themes/react" \
    crates/wdm-webkit-greeter/themes/react/index.html
  install -Dm644 -t "$themes/react/vendor" \
    crates/wdm-webkit-greeter/themes/react/vendor/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
