pkgname=moomoo-opend-bin
pkgver=10.10.7008
pkgrel=1
pkgdesc="Moomoo OpenD command-line daemon and GUI"
arch=('x86_64')
url='https://openapi.moomoo.com/'
license=('custom:proprietary')
depends=('fuse2' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
provides=('moomoo-opend' 'futu-opend')
conflicts=('moomoo-opend' 'futu-opend')
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://softwaredownload.futustatic.com/moomoo_OpenD_${pkgver}_Ubuntu18.04.tar.gz")
sha256sums=('72eaa6e47b5cb8905306427b5e3679d591408243492e3e7acbc3a7d46f09a0aa')

prepare() {
  local base="moomoo_OpenD_${pkgver}_Ubuntu18.04"
  local gui_src="$srcdir/$base/moomoo_OpenD-GUI_${pkgver}_Ubuntu18.04/moomoo_OpenD-GUI_${pkgver}_Ubuntu18.04.AppImage"

  rm -rf "$srcdir/squashfs-root"
  (
    cd "$srcdir"
    "$gui_src" --appimage-extract moomoo_OpenD.png >/dev/null
  )
}

package() {
  local base="moomoo_OpenD_${pkgver}_Ubuntu18.04"
  local install_dir="$pkgdir/opt/moomoo-opend"
  local opend_src="$srcdir/$base/$base"
  local gui_src="$srcdir/$base/moomoo_OpenD-GUI_${pkgver}_Ubuntu18.04/moomoo_OpenD-GUI_${pkgver}_Ubuntu18.04.AppImage"

  install -dm755 "$install_dir" "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons/hicolor/256x256/apps" \
    "$pkgdir/usr/share/doc/$pkgname"

  cp -a "$opend_src" "$install_dir/opend"
  install -Dm755 "$gui_src" "$install_dir/moomoo-opend-gui.AppImage"
  install -Dm644 "$srcdir/$base/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm644 "$opend_src/OpenD.xml" "$pkgdir/usr/share/doc/$pkgname/OpenD.xml.example"

  cat > "$pkgdir/usr/bin/moomoo-opend" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

install_dir=/opt/moomoo-opend/opend
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/moomoo-opend"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/moomoo-opend"
config_file="$config_dir/OpenD.xml"

mkdir -p "$config_dir" "$state_dir/logs"
if [[ ! -f "$config_file" ]]; then
  cp "$install_dir/OpenD.xml" "$config_file"
  chmod 600 "$config_file"
fi

cd "$install_dir"
exec ./OpenD -cfg_file="$config_file" -log_path="$state_dir/logs" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/moomoo-opend"

  cat > "$pkgdir/usr/bin/moomoo-opend-gui" <<'EOF'
#!/usr/bin/env bash
exec /opt/moomoo-opend/moomoo-opend-gui.AppImage "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/moomoo-opend-gui"

  cat > "$pkgdir/usr/share/applications/moomoo-opend.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Moomoo OpenD
Comment=OpenAPI gateway for Moomoo
Exec=moomoo-opend-gui
Icon=moomoo-opend
Terminal=false
Categories=Office;Finance;
EOF

  install -Dm644 "$srcdir/squashfs-root/moomoo_OpenD.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/moomoo-opend.png"
}
