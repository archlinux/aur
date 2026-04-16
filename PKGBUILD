# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=volt-gui
pkgver=1.4.0
pkgrel=1
pkgdesc="A graphical user interface for configuring GPU related environment variables and more for Linux gaming."
arch=('any')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'mesa-utils'
  'polkit'
  'pyside6'
  'python'
  'python-requests'
  'vulkan-mesa-layers'
  'vulkan-tools'
)
optdepends=(
  'gamescope: Gamescope support'
  'lsfg-vk: LSFG support'
  'mangohud: MangoHud support'
#  'scx-scheds: make use of the CPU Pluggable Schedulers'  # Support temporarily removed
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('8c8aa79a47d3fe0473ec0fef461bd36caac5865457956477ce968fa335b1fe8f'
            '1581606e978f09077743a7b3001498f99b4e141ca0eb229e8bac4d63ddf6692b'
            '9852a7ff299da58c8b8be0439d8560350a812f8a004eab44481433cec7fa398a')

prepare() {
  cd "$pkgname-$pkgver"
  find src -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 src/*.py -t "$pkgdir/opt/$pkgname/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
