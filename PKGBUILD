# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=brief
pkgver=0.3.2
pkgrel=1
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
  'git'
  'meson'
)
options=('!strip')
source=("git+https://github.com/shonebinu/Brief.git#tag=v$pkgver"
        'git+https://github.com/tldr-pages/tldr.git')
sha256sums=('5d7f349a76d0a324a5f7abf0ee8131b275951f06ca1527a566f6719302ba2356'
            'SKIP')

prepare() {
  rm -rf tldr-data
  mkdir -p tldr-data
  cp -rf tldr/pages* tldr-data/

  cd Brief
  cp -f generate_commands_index.py "$srcdir/tldr-data/"

  # Set tldr pages directory
  sed -i "s|app/share/io.github.shonebinu.Brief/tldr-data|usr/share/$pkgname/tldr|g" \
    src/tldr.py
}

build() {
  arch-meson Brief build
  meson compile -C build

  cd tldr-data
  rm -r pages.en
  mv pages pages.en
  python generate_commands_index.py
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd tldr-data
  install -Dm644 commands.json -t "$pkgdir/usr/share/$pkgname/tldr/"
  cp -r pages.* "$pkgdir/usr/share/$pkgname/tldr/"
}
