pkgname=orbitopl-toolbox-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="OrbitOPL Toolbox - PS2 OPL game management GUI (Electron + Angular, git version)"
arch=('x86_64')
url="https://github.com/Luden02/OrbitOPL-Toolbox"
license=('custom:unknown')

depends=(
  'glibc'
  'gtk3'
  'nss'
  'libxss'
  'alsa-lib'
  'libnotify'
  'dbus'
)

makedepends=(
  'git'
  'nodejs'
  'npm'
)

provides=('orbitopl-toolbox')
conflicts=('orbitopl-toolbox' 'orbitopl-toolbox-bin')

source=("git+https://github.com/Luden02/OrbitOPL-Toolbox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/OrbitOPL-Toolbox"
  git describe --long --tags --always 2>/dev/null \
    | sed 's/^v//; s/-/.r/; s/-/./g' || \
  printf "0.0.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/OrbitOPL-Toolbox"
}

build() {
  cd "$srcdir/OrbitOPL-Toolbox"

  # Root dependencies
  npm install

  # Angular frontend build
  cd angular
  npm install
  npm run build
  cd ..

  # Electron packaging (your working command)
  npm run package:linux
}

package() {
  cd "$srcdir/OrbitOPL-Toolbox"

  # Find generated zip
  _zip=$(find build -maxdepth 1 -name "*.zip" | head -n 1)

  if [[ -z "$_zip" ]]; then
    echo "Build failed: no zip found in build/"
    exit 1
  fi

  # Extract packaged app
  install -dm755 "$pkgdir/opt/orbitopl-toolbox"
  bsdtar -xf "$_zip" -C "$pkgdir/opt/orbitopl-toolbox"

  # Fix permissions (Electron often ships non-executable binaries)
  chmod +x "$pkgdir/opt/orbitopl-toolbox/"* || true

  # Symlink launcher (adjust if binary name differs)
  install -dm755 "$pkgdir/usr/bin"

  # Try to locate binary
  _bin=$(find "$pkgdir/opt/orbitopl-toolbox" -maxdepth 2 -type f -executable | grep -i orbitopl | head -n 1)

  if [[ -n "$_bin" ]]; then
    ln -sf "$_bin" "$pkgdir/usr/bin/orbitopl-toolbox"
  fi
}
