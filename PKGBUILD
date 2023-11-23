
# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sng <sng at hellug dot gr>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pyradio-git
pkgver=0.9.2.20
pkgrel=1
pkgdesc="Internet radio player for the command line"
arch=('any')
url="http://www.coderholic.com/pyradio/"
license=('MIT')
depends=('python-dnspython' 'python-requests' 'python-psutil' 'python-netifaces' 'python-rich' 'python-dateutil')
optdepends=('mplayer: as backend' 'mpv: as backend' 'vlc: as backend' 'mkvtoolnix-cli: fix mplayer recordings, add chapters to recordings')
makedepends=('git' 'python-pip' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/coderholic/pyradio.git)
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  _descr="$(git describe --long --tags)"
  sed -i "s/git_description = ''/git_description = '$_descr'/" pyradio/config.py
  sed -i 's/distro = None/distro = Arch Linux (AUR)/' pyradio/config
  git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
     python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 ./docs/*{html,md} -t "$pkgdir/usr/share/doc/pyradio"
  install -Dm644 ./docs/pyradio{,_rb,_server,_rec}.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 devel/pyradio.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 devel/pyradio.png -t "$pkgdir/usr/share/icons"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

