# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=wordbook
pkgver=1.0.0
pkgrel=2
_wordnet_ver=2025
pkgdesc="A dictionary application built for GNOME."
arch=('any')
url="https://apps.gnome.org/Wordbook"
license=('GPL-3.0-or-later')
depends=(
  'espeak-ng'
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-pydantic'
  'python-rapidfuzz'
  'python-wn'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Wordbook-$pkgver.tar.gz::https://github.com/mufeedali/Wordbook/archive/refs/tags/$pkgver.tar.gz"
        "https://github.com/globalwordnet/english-wordnet/releases/download/${_wordnet_ver}-edition/english-wordnet-${_wordnet_ver}-plus.xml.gz"
        'subproject.patch')
noextract=("english-wordnet-${_wordnet_ver}-plus.xml.gz")
sha256sums=('529065472166c2992afa289280849a0190c2506dee3fc5ed6646db277aa20a69'
            '31f4af16c54b532fd5484d4cc33aee588a31bb5b70683ae8197842fde5b586bc'
            '71ee389e54a5b2f7ea2d1511bfaa6eb50efc0615ef50a4b45190044e17e5aa9f')

prepare() {
  cd "Wordbook-$pkgver"

  # Generate offline Wordnet database
  python scripts/generate-wn-db.py \
    --source-file "$srcdir/english-wordnet-${_wordnet_ver}-plus.xml.gz" \
    --output wn.db.zst

  # Don't install empty subproject folder
  patch -Np1 -i ../subproject.patch
}

build() {
  arch-meson "Wordbook-$pkgver" build -Dinstall_wn_db=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "Wordbook-$pkgver"
  install -Dm644 wn.db.zst -t "$pkgdir/usr/share/$pkgname/"
}
