# Maintainer: David Jetelina <sour.soap5197@jtl.email>
# namcap: ignore deps
pkgname=tofuref-bin
pkgver=1.6.0
pkgrel=4
pkgdesc="TUI for the OpenTofu provider registry (prebuilt pipx binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/djetelina/tofuref"
license=('MIT')
depends=('python')
makedepends=('python-pipx')
source=("tofuref-$pkgver.tar.gz::https://github.com/djetelina/tofuref/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('982af35a44bf104494eccc083a8caec992cbe23655d979352873dc26957488e9')

package() {
  cd "tofuref-$pkgver"

  install -d "$pkgdir/usr/lib/tofuref" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"

  export PIPX_HOME="$pkgdir/usr/lib/tofuref"
  export PIPX_BIN_DIR="$pkgdir/usr/lib/tofuref/bin"

  pipx install . --python python3 >/dev/null 2>&1
  
  find "$pkgdir/usr/lib/tofuref/venvs/tofuref/bin" -type f -exec sed -i \
      "1s|^#!.*python$|#!/usr/lib/tofuref/venvs/tofuref/bin/python|" {} +

  rm -f "$pkgdir/usr/lib/tofuref/bin/tofuref"
  ln -sf "/usr/lib/tofuref/venvs/tofuref/bin/tofuref" "$pkgdir/usr/lib/tofuref/bin/tofuref"
  ln -sf "/usr/lib/tofuref/bin/tofuref" "$pkgdir/usr/bin/tofuref"

  install -Dm644 "$srcdir/tofuref-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find "$pkgdir/usr/lib/tofuref" -type f \( -name '*.log' -o -name 'direct_url.json' -o -name 'pipx_metadata.json' \) -delete
  find "$pkgdir/usr/lib/tofuref" -type d -empty -delete
  find "$pkgdir/usr/lib/tofuref" -name '*.pyc' -delete
  find "$pkgdir/usr/lib/tofuref/venvs/tofuref/lib" -type d -name 'tests' -exec rm -rf {} +
}

