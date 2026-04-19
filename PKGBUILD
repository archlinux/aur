# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=brief
pkgver=0.3.1
pkgrel=1
_tldr_ver=2.3
pkgdesc="A GTK4 application for browsing tldr-pages (community-maintained command line help pages)."
arch=('any')
url="https://github.com/shonebinu/Brief"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-certifi'
  'python-charset-normalizer'
  'python-gobject'
  'python-idna'
  'python-langcodes'
  'python-language-data'
  'python-marisa-trie'
  'python-rapidfuzz'
  'python-requests'
  'python-urllib3'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
options=('!strip')
source=("Brief-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "tldr-${_tldr_ver}.zip::https://github.com/tldr-pages/tldr/releases/download/v${_tldr_ver}/tldr.zip")
noextract=("tldr-${_tldr_ver}.zip")
sha256sums=('a134e5ba83ae1f2372963d12784be477fe577012833e96114811d545d6d1efd3'
            '46f8eb9f8d0df15862f9258a9ef1550c061a99f157cd0d0b612caf5a7df6fcc3')

prepare() {
  mkdir -p "tldr-${_tldr_ver}"
  bsdtar xf "tldr-${_tldr_ver}.zip" -C "tldr-${_tldr_ver}"

  cd "Brief-$pkgver"
  cp -f generate_commands_index.py "$srcdir/tldr-${_tldr_ver}/"

  # Set tldr pages directory
  sed -i "s|app/share/io.github.shonebinu.Brief/tldr-data|usr/share/$pkgname/tldr|g" \
    src/tldr.py
}

build() {
  arch-meson "Brief-$pkgver" build
  meson compile -C build

  cd "tldr-${_tldr_ver}"
  rm -r pages.en
  mv pages pages.en
  python generate_commands_index.py
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "tldr-${_tldr_ver}"
  install -Dm644 commands.json -t "$pkgdir/usr/share/$pkgname/tldr/"
  cp -r pages.* "$pkgdir/usr/share/$pkgname/tldr/"
}
