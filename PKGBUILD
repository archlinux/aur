# Maintainer: Sieve Lau <sievelau@gmail.com>

pkgname=danmakufactory-git
pkgver=r123.4bb8774
pkgrel=1
pkgdesc='A tool for converting XML danmaku to ass subtitles.'
url="https://github.com/hihkm/DanmakuFactory"
arch=(x86_64)
makedepends=('xmake')
provides=(danmakufactory)
conflicts=(danmakufactory)
license=(MIT)
source=(
  "${pkgname%-git}::git+https://github.com/hihkm/DanmakuFactory.git"
  "c11-fix.patch"
)
md5sums=(
  'SKIP'
  '2f63a9b01ec24d6406e2e6a59fee5b07'
)

pkgver() {
  cd $srcdir/${pkgname%-git}
  (
    set -o pipefail
    git describe --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -Np1 -i "$srcdir/c11-fix.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  xmake -y -v
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 DanmakuFactory $pkgdir/usr/bin/DanmakuFactory
}
