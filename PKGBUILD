# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sng <sng at hellug dot gr>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pyradio-git
pkgver=0.8.9.4.r0.ga74d60b
pkgrel=1
pkgdesc="Internet radio player for the command line"
arch=('any')
url="http://www.coderholic.com/pyradio/"
license=('MIT')
depends=('python-dnspython' 'python-requests')
optdepends=('mplayer: as backend' 'mpv: as backend' 'vlc: as backend')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/coderholic/pyradio.git)
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  _descr="$(git describe --long --tags)"
  sed -i "s/git_description = ''/git_description = '$_descr'/" pyradio/radio.py
  sed -i 's/distro = None/distro = Arch Linux/' pyradio/config
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname

  #install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/pyradio"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 README.{html,md} build.{html,md} -t "$pkgdir/usr/share/doc/pyradio"
  install -Dm644 pyradio.1 -t "$pkgdir/usr/share/man/man1"

  python setup.py install --root="$pkgdir" --optimize=1
}

