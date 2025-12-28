# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=brief
pkgver=0.2.0
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
  'python-requests'
  'python-urllib3'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Brief-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "tldr-${_tldr_ver}.zip::https://github.com/tldr-pages/tldr/releases/download/v${_tldr_ver}/tldr.zip")
noextract=("tldr-${_tldr_ver}.zip")
sha256sums=('623cda3863bea15bd0f50ba539069eaf0e0cb2c670e9e989132dab6c59f873ec'
            '6263285113373ef6d3bee60f1edf940f02f581d3d73d872c7756c86c66927c99')

prepare() {
  mkdir -p "tldr-${_tldr_ver}"
  bsdtar xf "tldr-${_tldr_ver}.zip" -C "tldr-${_tldr_ver}"

  cd "Brief-$pkgver"

  # Set tldr pages directory
  sed -i "s|app/share/tldr|usr/share/$pkgname/tldr|g" src/tldr.py
}

build() {
  arch-meson "Brief-$pkgver" build
  meson compile -C build

  cp -f "Brief-$pkgver/generate_commands_index.py" "tldr-${_tldr_ver}/"
  cd "tldr-${_tldr_ver}"
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
