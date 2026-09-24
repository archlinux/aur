# Maintainer: Junyi Xu <junyixu0@gmail.com>

pkgname=linux-recall-git
_pkgname=linux_recall
pkgver=r27.4cfddc2
pkgrel=2
pkgdesc='Windows Recall-style screen memory for KDE Plasma 6 on Wayland'
arch=('any')
url='https://github.com/junyixu/linux_recall'
license=('MIT')
depends=(
  'python'
  'python-jeepney'
  'python-pillow'
  'python-requests'
  'spectacle'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
)
optdepends=(
  'python-rapidocr: local OCR when the PaddleOCR cloud is unreachable'
  'python-onnxruntime: local OCR when the PaddleOCR cloud is unreachable'
  'plasma-browser-integration: record the URL of the active browser tab'
  'fzf: lrf search picker'
  'jq: lrf and lr-search'
  'imagemagick: highlight matches on screenshots'
  'kitty: image previews in lrf'
  'python-numpy: Click to Do (linux-recall-click)'
  'firefox: Click to Do opens its page in Firefox'
  'kdotool: lrf ctrl-o raises Neovide and Anki Browse windows'
  'libnotify: notify-send messages from lrf'
  'xdg-utils: lrf opens screenshots and links with xdg-open'
)
provides=('linux-recall')
conflicts=('linux-recall')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 systemd/linux-recall.service "$pkgdir/usr/lib/systemd/user/linux-recall.service"
  install -Dm755 scripts/install-hotkey.sh "$pkgdir/usr/bin/linux-recall-install-hotkey"

  # lr.zsh aliases lrf from its own directory
  install -Dm755 scripts/lrf "$pkgdir/usr/share/$_pkgname/lrf"
  install -Dm644 scripts/lr.zsh "$pkgdir/usr/share/$_pkgname/lr.zsh"
  ln -s /usr/share/$_pkgname/lrf "$pkgdir/usr/bin/lrf"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md README.zh-CN.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
