# Maintainer: arthurr0 <koeckiartur@gmail.com>
pkgname=mterminal-git
_pkgname=mterminal
pkgver=0.3.0.r0.gHEAD
pkgrel=1
pkgdesc="Custom terminal emulator with grouped tabs and warm dark UI"
arch=('x86_64')
url="https://github.com/arthurr0/mTerminal"
license=('MIT')
depends=(
  'gtk3'
  'nss'
  'libnotify'
  'libxss'
  'libxtst'
  'alsa-lib'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
  'python'
  'base-devel'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "mterminal-bin")
options=('!strip' '!debug' '!lto')
source=("$_pkgname::git+https://github.com/arthurr0/mTerminal.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(node -p "require('./package.json').version")" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  pnpm install --frozen-lockfile
  pnpm exec electron-rebuild -f -w node-pty
}

build() {
  cd "$_pkgname"
  pnpm package:linux
}

package() {
  cd "$_pkgname"

  local unpacked="release/linux-unpacked"
  if [[ ! -d "$unpacked" ]]; then
    echo "missing $unpacked — electron-builder did not produce unpacked dir" >&2
    return 1
  fi

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a "$unpacked"/. "$pkgdir/opt/$_pkgname/"

  chmod -R u=rwX,go=rX "$pkgdir/opt/$_pkgname"
  chmod 0755 "$pkgdir/opt/$_pkgname/$_pkgname"

  # Chromium sandbox helper requires SUID root.
  chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox"

  # Wrapper in PATH.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$_pkgname" <<'EOF'
#!/bin/sh
exec /opt/mterminal/mterminal "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "packaging/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 "build/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
