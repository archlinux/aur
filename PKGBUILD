# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=volt-gui
pkgver=1.3.0
pkgrel=1
pkgdesc="A graphical user interface for configuring GPU related environment variables and more for Linux gaming."
arch=('any')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'polkit'
  'pyside6'
  'python'
  'python-requests'
)
optdepends=(
  'mangohud: make use of the Render Pipeline Settings'
  'mesa-utils: required to use the OpenGL Render Selector'
  'scx-scheds: make use of the CPU Pluggable Schedulers'
  'vulkan-mesa-layers: required to use the Vulkan Render Selector'
  'vulkan-tools: required to use the Vulkan Render Selector'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('5ba9884ccec129d62bd7407469572d6e4652660f1eda8537a555182af6b4be8a'
            '3143aedef236dd69767c362e385ab9762844a8d63523f7629a55d90db0886332'
            '9852a7ff299da58c8b8be0439d8560350a812f8a004eab44481433cec7fa398a')

prepare() {
  cd "$pkgname-$pkgver"
  find scripts src -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 src/*.py -t "$pkgdir/opt/$pkgname/"
  install -Dm755 scripts/volt-helper -t "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
