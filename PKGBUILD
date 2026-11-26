# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=macos-sequoia-sound-theme
pkgver=15.8.3
pkgrel=1
pkgdesc='macOS Sequoia system sounds as a KDE Plasma / freedesktop sound theme (extracted from Apple at build time)'
arch=('any')
url='https://support.apple.com/en-us/100100'
license=('LicenseRef-Apple')
# ocean is required, not optional: index.theme inherits it, and libcanberra drops the whole
# theme (silently falling back to freedesktop) if an inherited theme is not installed.
depends=('ocean-sound-theme')
makedepends=('python' 'ffmpeg')
optdepends=('libcanberra: playback (used by Plasma notifications)')
install="${pkgname}.install"
# The sounds themselves are range-read from Apple's OTA image in build(), because a
# source=() entry would mean downloading the whole 15 GB ZIP. Each file is pinned by
# SHA-256 in extract_sounds.py.
source=('extract_sounds.py' 'index.theme' 'NOTICE.txt')
sha256sums=('f6e6776a0093b5d88abedcb096e4875defbe7325d68671acee63ec9e942073e8'
            '6050fd9ded5f96c853c176bc424a11149122baef061ca9bead0e936b8e36f343'
            '62ba6d58d369d6951ce008a24b47a9c5e884862c85085bddd750422a5df14996')

build() {
  python -B "$srcdir/extract_sounds.py" "$srcdir/originals" "$srcdir/stage"
}

package() {
  local theme="$pkgdir/usr/share/sounds/macos-sequoia"
  install -d "$theme/stereo" "$theme/alerts"
  install -m644 "$srcdir/index.theme" "$theme/index.theme"
  install -m644 "$srcdir"/stage/stereo/*.oga "$theme/stereo/"
  install -m644 "$srcdir"/stage/alerts/*.oga "$theme/alerts/"
  install -Dm644 "$srcdir/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"
}
