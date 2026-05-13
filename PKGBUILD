# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cli-torrent-dl
pkgver=1.14
pkgrel=1
pkgdesc="CLI utility to search and download torrents from major torrent sites"
arch=('any')
url="https://github.com/X0R0X/cli-torrent-dl"
license=('WTFPL')
depends=(
  'python'
  'python-aiohttp'
  'python-beautifulsoup4'
  'python-pyperclip'
  'python-pyxdg'
  'python-uvloop'
)
optdepends=(
  'qbittorrent: default torrent client command'
  'xclip: X11 clipboard support'
  'xsel: X11 clipboard support'
  'wl-clipboard: Wayland clipboard support'
)
provides=('tordl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46c16569467c73387fa9ca7abacc669edb93cc53e0086f87911c26025b1ee448')

package() {
  cd "$pkgname-$pkgver"
  local _site_packages
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

  install -d "$pkgdir/$_site_packages"
  cp -a tordl "$pkgdir/$_site_packages/"
  install -Dm755 tordl.py "$pkgdir/usr/lib/$pkgname/tordl.py"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tordl" <<'EOF'
#!/usr/bin/python
import runpy
runpy.run_path("/usr/lib/cli-torrent-dl/tordl.py", run_name="__main__")
EOF

  python -m compileall -q -f -d "$_site_packages/tordl" "$pkgdir/$_site_packages/tordl"
  python -O -m compileall -q -f -d "$_site_packages/tordl" "$pkgdir/$_site_packages/tordl"
}
