pkgname=termix-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Modern cross-platform SSH client built with Electron"
arch=('x86_64')
url="https://github.com/Termix-SSH/Termix"
license=('Apache-2.0')
depends=('glibc' 'gtk3' 'nss' 'libxss')

options=('!strip' '!debug')

source=(
  "termix-linux-x64.tar.gz::https://github.com/Termix-SSH/Termix/releases/download/release-$pkgver-tag/termix_linux_x64_portable.tar.gz"
)

sha256sums=('cbb1ac1ee67792b94a92e702ee09cfe8d3f61bb7b97d616fa4847395461b8c02')

package() {
  install -dm755 "$pkgdir/opt/termix"
  cp -r termix_linux_x64_portable/* "$pkgdir/opt/termix/"

  # Rename real binary
  mv "$pkgdir/opt/termix/termix" "$pkgdir/opt/termix/termix-bin"

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/termix" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/opt/termix:${LD_LIBRARY_PATH}"
exec /opt/termix/termix-bin "$@"
EOF

  # License
  if [[ -f "$pkgdir/opt/termix/LICENSE.electron.txt" ]]; then
    install -Dm644 \
      "$pkgdir/opt/termix/LICENSE.electron.txt" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

