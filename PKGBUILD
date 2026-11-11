# Maintainer: Junyi Xu <junyixu0@gmail.com>
#
# NOTE for AUR helper users (yay, paru, ...): optional dependencies are easy to
# miss in the build output, so please read this before installing.
# kdotool is recommended for window management; python-rapidocr and
# python-onnxruntime are only needed if you prefer local OCR over cloud
# (add python-openvino to run it on OpenVINO, at under half the CPU time).
#
# This is the binary package: it installs the wheel built by the upstream CI.
# linux-recall-git builds from source if you want to track the latest commit.

pkgname=linux-recall-bin
_pkgname=linux-recall
pkgver=0.2.0
pkgrel=1
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
makedepends=('python-installer')
optdepends=(
  'python-rapidocr: local OCR when the PaddleOCR cloud is unreachable'
  'python-onnxruntime: local OCR when the PaddleOCR cloud is unreachable'
  'python-openvino: run local OCR on OpenVINO instead (same text, under half the CPU time)'
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
conflicts=('linux-recall' 'linux-recall-git')
source=(
  "$url/releases/download/v$pkgver/linux_recall-$pkgver-py3-none-any.whl"
  # the wheel has the Python package only; these repo files are installed too,
  # pinned to the same tag so the two cannot drift.  not "$url#tag=...": the
  # fragment is part of the filename to makepkg and would collide with the
  # "$_pkgname" the wheel unpacks into
  "$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('b30bbfdbb875451a2e1c129b4de1b11be3efc649cc055c71042f853f13e1e22e'
            '6c5578601d7b434db78c36eeb1b219660346f00406e027673ac674806bc60f8f')

package() {
  # both sources unpack into $srcdir: the wheel as $_pkgname/ and
  # $_pkgname-$pkgver.dist-info/, the tarball as $_pkgname-$pkgver/
  cd "linux_recall-$pkgver"
  python -m installer --destdir="$pkgdir" \
    "$srcdir/linux_recall-$pkgver-py3-none-any.whl"

  install -Dm644 systemd/linux-recall.service "$pkgdir/usr/lib/systemd/user/linux-recall.service"
  install -Dm755 scripts/install-hotkey.sh "$pkgdir/usr/bin/linux-recall-install-hotkey"

  # lr.zsh aliases lrf from its own directory
  install -Dm755 scripts/lrf "$pkgdir/usr/share/$_pkgname/lrf"
  install -Dm644 scripts/lr.zsh "$pkgdir/usr/share/$_pkgname/lr.zsh"
  ln -s /usr/share/$_pkgname/lrf "$pkgdir/usr/bin/lrf"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md README.zh-CN.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
