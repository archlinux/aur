# Maintainer: Master Kim <your-email@example.com>
pkgname=kira
_pkgname=kira
pkgver=0.1.0.r20.ge9bfb8b
pkgrel=3
pkgdesc="kira: a specialized expert in Arch Linux and Hyprland"
arch=('any')
url="https://github.com/eliakimrosil/kira"
license=('MIT')
depends=('python' 'python-pyaudio' 'python-dotenv' 'python-google-genai')
optdepends=('grim: for screenshot support'
            'hyprland: for window management integration'
            'mpv: for music playback')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_pkgname-repo::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname-repo"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname-repo"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-repo"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install the .env.example as a reference
  install -Dm644 .env.example "$pkgdir/usr/share/$_pkgname/.env.example"

  # Install the License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
