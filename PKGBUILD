pkgname=playfin
pkgver=r94.526a53c
pkgrel=1
pkgdesc="Terminal-based Jellyfin player with MPV integration"
arch=('any')
url="https://github.com/AlexJonker/playfin"
license=('MIT')
depends=('mpv' 'python' 'python-requests' 'python-dotenv')
makedepends=('git')
checkdepends=(python-pytest)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/playfin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}



prepare() {
  # Clean out old wheels etc.
  git -C "$srcdir/playfin" clean -dfx
}

build() {
  cd "$srcdir/playfin"
  make pypi-files
  python devscripts/make_lazy_extractors.py
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/playfin"
  pytest -v -m "not download" -k 'not Websockets' # revert when extra/python-websockets updates to 13
}

package() {
  cd "$srcdir/playfin"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/playfin/mpv_config"
  cp -r mpv_config/* "$pkgdir/usr/share/playfin/mpv_config/"
}

