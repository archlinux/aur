# Maintainer: envolution
# Contributor: buckket <buckket@cock.li>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=liberation-circuit
pkgver=1.3+r19e33635477
pkgrel=2
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://github.com/linleyh/liberation-circuit"
depends=('allegro' 'git')
_tag="19e3363547793e931fd9419b61ebc2cd8e257714"
source=("git+https://github.com/linleyh/liberation-circuit.git#tag=$_tag")
sha256sums=('b54f52e10dcc30d551dc7c4ee98b776c3acb4f6eca5275c60b2b9942a78c80e9')
prepare() {
  cat >"$pkgname/bin/launcher.sh" <<'EOF'
#!/bin/sh
# Resolve the full path of the script
SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

# Change to the script's directory
cd "$SCRIPT_DIR" || exit 1

# Execute the target program
./libcirc "$@"
EOF
  chmod +x "$pkgname/bin/launcher.sh" # Make the script executable
}

build() {
  cd $pkgname
  make
  #  redo
}

package() {
  cd $pkgname
  install -Dm644 "linux-packaging/liberation-circuit.appdata.xml" \
    "$pkgdir/usr/share/metainfo/liberation-circuit.appdata.xml"
  install -Dm644 "linux-packaging/liberation-circuit.desktop" \
    "$pkgdir/usr/share/applications/liberation-circuit.desktop"
  install -Dm644 "linux-packaging/icon-16px.png" \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/liberation-circuit.png"
  install -Dm644 "linux-packaging/icon-32px.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/liberation-circuit.png"
  install -Dm644 "linux-packaging/icon-256px.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/liberation-circuit.png"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r bin/* "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/launcher.sh" "$pkgdir/usr/bin/liberation-circuit"
}
# vim:set ts=2 sw=2 et:
