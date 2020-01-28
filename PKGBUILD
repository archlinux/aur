# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
# Contributor: arcnmx <arcnmx@gmail.com>

pkgname=passff-host
pkgver=1.2.1
pkgrel=1
epoch=1
pkgdesc="PassFF native messaging host application for Firefox, Chromium, Chrome, Vivaldi"
url=https://github.com/passff/passff-host
license=(GPL2)
depends=(python)
arch=(i686 x86_64)
source=(
  passff-$pkgver.py::https://github.com/passff/passff-host/releases/download/$pkgver/passff.py
  passff-$pkgver.json::https://github.com/passff/passff-host/releases/download/$pkgver/passff.json
  )
sha256sums=('6db5c9c435bfe8efc0f626e38144eff4c045d90d8508a295c990abbae411ac6c'
            'cd871bcf29d71e53f986fb74b7f2b1867151ba2b2a27318044c7bfaa38827282')

_native_messaging=(
  /etc/chromium/native-messaging-hosts
  /etc/opt/chrome/native-messaging-hosts
  /usr/lib/mozilla/native-messaging-hosts
  /etc/vivaldi/native-messaging-hosts
  )

_bindir="/usr/lib/passff"

build() {
  sed -i -e "s-PLACEHOLDER-$_bindir/passff.py-" "$srcdir/passff-$pkgver.json"
}

package() {
  install -d "$pkgdir$_bindir"
  install -m 0755 "$srcdir/passff-$pkgver.py" "$pkgdir$_bindir/passff.py"

  for d in "${_native_messaging[@]}"; do
    install -d "$pkgdir$d"
    install -m 0644 "$srcdir/passff-$pkgver.json" "$pkgdir$d/passff.json"
  done
}
