# Maintainer: sng <sng at hellug dot gr>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pyradio
pkgver=0.9.3.11.19
pkgrel=1
pkgdesc="Internet radio player for the command line"
arch=('any')
url="https://github.com/coderholic/pyradio"
license=('MIT')
depends=('python-dnspython' 'python-requests' 'python-psutil' 'python-netifaces' 'python-rich' 'python-dateutil' 'python-charset-normalizer')
optdepends=('mplayer: as backend' 'mpv: as backend' 'vlc: as backend' 'mkvtoolnix-cli: fix mplayer recordings, add chapters to recordings')
makedepends=('python-pip' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/coderholic/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5a6f16314dd86f009baae74428be9a5b18a9e38c21d3660dc385202164dde923')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's/distro = None/distro = Arch Linux (AUR)/' \
      -e 's/xdg_compliant = False/xdg_compliant = True/' \
      $pkgname/config
}

build() {
  cd $pkgname-$pkgver
  [ -d pyradio/__pycache__ ] && rm -rf pyradio/__pycache__
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 ./docs/*{html,md} -t "$pkgdir/usr/share/doc/pyradio"
  install -Dm644 ./docs/pyradio{,_rb,_server,_rec,_buf}.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 devel/pyradio.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 devel/pyradio.png -t "$pkgdir/usr/share/icons"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

