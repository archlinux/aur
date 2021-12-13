# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Deepjyoti <deep.barman30@gmail.com>


pkgname=playx-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf r%s.%s "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r419.9050f0c
pkgrel=5

pkgdesc='Search and play songs from Youtube, Soundcloud, Spotify and more from your terminal'
arch=('any')
url="https://github.com/NISH1001/$_name"
license=('MIT')

makedepends=('git' 'python-setuptools')
depends=('chromium' 'mpv' 'youtube-dl' 'python-selenium' 'python-requests' 'python-beautifulsoup4'
         'python-numpy' 'python-youtube-search')

provides=("$_name")
conflicts=("$_name")
replaces=("python-$pkgname")

source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  local x; for x in {16,48,72,96,256,512}; do
    install -Dm644 "logo/$x logo.svg" "$pkgdir/usr/share/icons/hicolor/${x}x$x/apps/$_name.svg"
  done
  for x in logo/*{logotype,bg}.svg; do
    install -Dm644 "$x" "$pkgdir/usr/share/pixmaps/${_name}_${x/ /-}"
  done
  install -Dm644 README.md example.playx playx.gif -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
