# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: AV Morning Star from a tagged release's source, running on
# the system's Python, PyQt5 and yt-dlp (no bundled copies). The tag-release
# workflow writes the published copy (version and checksum filled in, plus
# .SRCINFO) into its `aur` artifact.

pkgname=av-morning-star
_reponame=AV-Morning-Star
pkgver=0.4.5
pkgrel=1
pkgdesc='Video and audio downloader for YouTube, Odysee and 1000+ sites (a yt-dlp front end)'
arch=('any')
url='https://github.com/asafelobotomy/AV-Morning-Star'
license=('MIT')
depends=('python' 'python-pyqt5' 'yt-dlp' 'python-mutagen' 'ffmpeg')
optdepends=('deno: YouTube proof-of-origin tokens (recommended by yt-dlp)'
            'nodejs: YouTube proof-of-origin tokens, if deno is not installed'
            'python-syncedlyrics: more lyrics sources when LRCLIB has none')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afae5a4046dec10d75d87c45a65075d63c31703a102510fa9122bfe82a67e875')

_appdir=/usr/share/av-morning-star

check() {
  cd "$_reponame-$pkgver"
  [ "$(cat VERSION)" = "$pkgver" ]
  # The tests that need no display.
  QT_QPA_PLATFORM=offscreen PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -p 'test_*.py'
}

package() {
  cd "$_reponame-$pkgver"
  local f
  for f in main.py browser_utils.py dialogs.py settings.py single_instance.py threads.py ui_widgets.py av-morning-star.png; do
    install -Dm644 "$f" "$pkgdir$_appdir/$f"
  done
  for f in app_mixins/*.py constants/*.py extractors/*.py lyrics/*.py themes/*.py themes/*.qss; do
    install -Dm644 "$f" "$pkgdir$_appdir/$f"
  done
  python -m compileall -q -d "$_appdir" "$pkgdir$_appdir"
  python -O -m compileall -q -d "$_appdir" "$pkgdir$_appdir"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/av-morning-star" <<SH
#!/bin/sh
exec /usr/bin/python $_appdir/main.py "\$@"
SH
  sed 's/^Exec=.*/Exec=av-morning-star/' packaging/com.github.asafelobotomy.avmorningstar.desktop |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.github.asafelobotomy.avmorningstar.desktop"
  install -Dm644 packaging/com.github.asafelobotomy.avmorningstar.appdata.xml \
    "$pkgdir/usr/share/metainfo/com.github.asafelobotomy.avmorningstar.appdata.xml"
  # Not square, so not a hicolor theme icon.
  install -Dm644 av-morning-star.png "$pkgdir/usr/share/pixmaps/av-morning-star.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}
