# Maintainer: Ragu Manjegowda <raghavendrahm0410@gmail.com>
_name=android-tv-remote
pkgname=$_name-git
pkgver=r24.gf6f71ee
pkgrel=2
pkgdesc='Qt desktop remote for Android TV with a native NVIDIA Shield trackpad'
arch=(any)
url="https://github.com/ragu-manjegowda/$_name"
license=(MIT)
depends=(python python-aiofiles 'python-androidtvremote2>=0.3.3' python-async-timeout
         python-cryptography python-protobuf python-pyqt6 python-qasync python-zeroconf systemd)
makedepends=(git python-build python-installer 'python-setuptools>=77.0.3')
checkdepends=(ttf-dejavu xorg-server-xvfb xorg-xauth)
optdepends=('qt-solarized: use the system Solarized stylesheets instead of the bundled copies'
            'android-tools: ADB mouse control for TVs without the Shield trackpad service')
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_name"
  python -I -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_name"
  local testhome="$srcdir/test-home"
  local testenv="$srcdir/test-venv"
  mkdir -p "$testhome"
  python -Im venv --clear --without-pip --system-site-packages "$testenv"
  "$testenv/bin/python" -Im installer dist/*.whl
  HOME="$testhome" QT_QPA_PLATFORM=xcb QT_QPA_PLATFORMTHEME=generic \
    xvfb-run -a -s '-screen 0 1920x1080x24 -nolisten tcp' \
    "$testenv/bin/python" -IB -m unittest discover -s tests -t .
}

package() {
  cd "$srcdir/$_name"
  python -I -m installer --destdir="$pkgdir" --prefix=/usr \
    --compile-bytecode=0 --compile-bytecode=1 --compile-bytecode=2 dist/*.whl
  install -Dm644 "packaging/linux/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/ui/themes/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.qt-solarized"
}
