# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=macos-sequoia-fonts
pkgver=15.8.1
pkgrel=1
pkgdesc='Apple macOS Sequoia fonts from system directories, website-selected Font7, and official Apple Fonts'
arch=('any')
url='https://support.apple.com/en-eg/120414'
license=('custom:Apple')
makedepends=('gcc' 'zlib' '7zip' 'libarchive' 'python-fonttools' 'git')
depends=('fontconfig')
install=macos_sequoia_fonts.install

_libneoaa_commit='c1bdecd059e4b57347f859fc7b3e7be94a4e405e'
_lzfse_commit='e634ca58b4821d9f3d560cdc6df5dec02ffc93fd'
_libzbitmap_commit='574abeae25b25c3319b9b6a9225cc7464e08ae88'

source=(
  'build_fonts.py'
  'extract_font_files.c'
  'NOTICE.txt'
  'SF-Pro.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg'
  'SF-Compact.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg'
  'SF-Mono.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg'
  'SF-Arabic.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg'
  'SF-Armenian.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Armenian.dmg'
  'SF-Georgian.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg'
  'SF-Hebrew.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg'
  'NY.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg'
  "libneoaa::git+https://github.com/0xilis/libNeoAppleArchive.git#commit=${_libneoaa_commit}"
  "lzfse::git+https://github.com/lzfse/lzfse.git#commit=${_lzfse_commit}"
  "libzbitmap::git+https://github.com/eafer/libzbitmap.git#commit=${_libzbitmap_commit}"
)
noextract=('SF-Pro.dmg' 'SF-Compact.dmg' 'SF-Mono.dmg' 'SF-Arabic.dmg' 'SF-Armenian.dmg' 'SF-Georgian.dmg' 'SF-Hebrew.dmg' 'NY.dmg')
# Apple may replace the public font downloads at these stable URLs.
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  python "$srcdir/build_fonts.py" build "$srcdir"
}

package() {
  local install_root="$pkgdir/usr/share/fonts/macos-sequoia"
  install -d "$install_root" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  cp -a "$srcdir/stage/." "$install_root/"
  python "$srcdir/build_fonts.py" fontconfig "$install_root" \
    "$pkgdir/etc/fonts/conf.d/90-macos-sequoia-internal.conf" "$srcdir/font7-dedup.tsv"
  cp -a "$srcdir/apple-font-licenses/." "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 0644 "$srcdir/metadata/installed-downloadable-fonts.txt" "$srcdir/metadata/document-fonts.txt" \
    "$pkgdir/usr/share/doc/$pkgname/"
  install -m 0644 "$srcdir/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"
  find "$install_root" -type d -exec chmod 0755 {} +
  find "$install_root" -type f -exec chmod 0644 {} +
}
