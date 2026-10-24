# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=scribe-git
_pkgname=scribe
pkgver=0.3.20.r0.g8fa7390
pkgrel=1
pkgdesc='A native GNOME Markdown editor that renders your document as you type (development version)'
arch=('x86_64')
url='https://github.com/gnacho/scribe'
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'enchant'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk4>=4.14'
  'gtksourceview5>=5.10'
  'hicolor-icon-theme'
  'libadwaita>=1.5'
  'libgcc'
  'pango'
)
makedepends=('cargo' 'gettext' 'git' 'pkgconf')
provides=("scribe=$pkgver")
conflicts=('scribe' 'scribe-bin')

source=("${_pkgname}::git+https://github.com/gnacho/scribe.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --match 'v[0-9]*' |
    sed -E 's/^v//; s/-([0-9]+)-g([0-9a-f]+)$/.r\1.g\2/'
}

prepare() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --frozen

  local po lang
  for po in po/*.po; do
    lang=${po##*/}
    lang=${lang%.po}
    install -dm755 "$srcdir/locale/$lang/LC_MESSAGES"
    msgfmt --check "$po" -o "$srcdir/locale/$lang/LC_MESSAGES/scribe.mo"
  done
}

package() {
  cd "$srcdir/$_pkgname"
  local icon po lang

  install -Dm755 "$srcdir/target/release/scribe" "$pkgdir/usr/bin/scribe"
  install -Dm644 data/io.github.gnacho.Scribe.desktop \
    "$pkgdir/usr/share/applications/io.github.gnacho.Scribe.desktop"
  install -Dm644 data/io.github.gnacho.Scribe.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.gnacho.Scribe.metainfo.xml"
  install -Dm644 data/io.github.gnacho.Scribe.gschema.xml \
    "$pkgdir/usr/share/glib-2.0/schemas/io.github.gnacho.Scribe.gschema.xml"

  # Include the application and action icons, including symbolic/apps.
  # Never install a private hicolor index.theme over the system theme.
  for icon in data/icons/hicolor/*/*/*.svg; do
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/${icon#data/icons/hicolor/}"
  done

  for po in po/*.po; do
    lang=${po##*/}
    lang=${lang%.po}
    install -Dm644 "$srcdir/locale/$lang/LC_MESSAGES/scribe.mo" \
      "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/scribe.mo"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
