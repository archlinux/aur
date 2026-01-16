# Maintainer : SinfulBobcat<bobcatsinful+aur@gmail.com>
pkgname=ez-tree
pkgver=1.0.2
pkgrel=1
pkgdesc="EZ Tree – Procedural Tree Generator"
arch=('x86_64')
url="https://github.com/sinfulbobcat/ez-tree"
license=('MIT')

depends=(
  'gtk3'
  'libnotify'
  'libxss'
  'nss'
)

makedepends=(
  'npm'
  'git'
)

source=(
  "git+https://github.com/sinfulbobcat/ez-tree.git#tag=v${pkgver}"
  "ez-tree.desktop"
  "ez-tree.png"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd "$srcdir/ez-tree"
  npm ci
  npm run build:linux
}

package() {
  cd "$srcdir/ez-tree"

  # Install the prebuilt Electron app
  install -d "$pkgdir/usr/lib/ez-tree"
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/ez-tree"

  # Launcher (THIS IS THE CRITICAL FIX)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/ez-tree" <<'EOF'
#!/bin/sh
exec /usr/lib/ez-tree/ez-tree "$@"
EOF

  # Desktop + icon
  install -Dm644 "$srcdir/ez-tree.desktop" \
    "$pkgdir/usr/share/applications/ez-tree.desktop"

  install -Dm644 "$srcdir/ez-tree.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/ez-tree.png"
}
