# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=macos-sequoia-cursor-theme
pkgver=15.8.3
pkgrel=1
pkgdesc='macOS Sequoia cursor theme for KDE Plasma and other XCursor desktops (cursors extracted from Apple at build time)'
arch=('any')
url='https://support.apple.com/en-us/100100'
license=('LicenseRef-Apple')
makedepends=('python' 'python-pillow' 'poppler')
optdepends=('breeze-cursors: fallback for the few cursors macOS has no equivalent for')
install="${pkgname}.install"
# The cursor files are range-read from Apple's OTA image in build(), because a source=()
# entry would mean downloading the whole 15 GB ZIP. Each file is pinned by SHA-256 in
# extract_cursors.py.
source=('extract_cursors.py' 'index.theme' 'NOTICE.txt')
sha256sums=('3e2d536349ff227a1b283f66bfcfcd5170ec09d2c3f8aee166e9260dbe626059'
            '29fe18dc5edeb03fcf8cadee9325fe381449148f3fa372313a7e0fef61a658d9'
            '31a9dd8d0c8a616cd22eada1b52cf4eda6aaf0473d89a4eae1d4d5f24519f763')

build() {
  python -B "$srcdir/extract_cursors.py" "$srcdir/originals" "$srcdir/stage"
}

package() {
  local theme="$pkgdir/usr/share/icons/macos-sequoia"
  install -d "$theme"
  cp -a --no-preserve=ownership "$srcdir/stage/cursors" "$theme/"
  chmod -R u=rwX,go=rX "$theme"
  install -m644 "$srcdir/index.theme" "$theme/index.theme"
  install -Dm644 "$srcdir/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"
}
