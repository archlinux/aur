# Maintainer: Dae Euhwa <daedaevibin@naver.com>
pkgname=meshiji
pkgver=1.2.2
pkgrel=1
pkgdesc="A modern, flutter-based file explorer"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/meshiji"
license=('OSL-3.0')
depends=('gtk3' 'libx11' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxtst' 'xz')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'clang' 'fvm')
source=("git+https://github.com/Veridian-Zenith/meshiji.git#tag=v${pkgver}-beta")
sha256sums=('0a3e67cb7b5a346412f354ffb139db5fb9295e1d039393b86439d194e34eea4c')

prepare() {
  cd "$srcdir/meshiji"

  # Install FVM and set up Flutter
  fvm install stable
  fvm global stable

  # Install Flutter dependencies
  fvm flutter pub get
}

build() {
  cd "$srcdir/meshiji"

  # Build release bundle
  fvm flutter build linux --release
}

package() {
  cd "$srcdir/meshiji"

  # Install directory
  mkdir -p "$pkgdir/usr/local/meshiji"

  # Copy binary and make executable
  cp "build/linux/x64/release/bundle/meshiji" "$pkgdir/usr/local/meshiji/meshiji"
  chmod +x "$pkgdir/usr/local/meshiji/meshiji"

  # Copy libraries
  cp -r "build/linux/x64/release/bundle/lib" "$pkgdir/usr/local/meshiji/"

  # Copy data
  cp -r "build/linux/x64/release/bundle/data" "$pkgdir/usr/local/meshiji/"

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/meshiji.desktop" <<EOF
[Desktop Entry]
Name=Meshiji
Comment=A modern, flutter-based file explorer
Exec=/usr/local/meshiji/meshiji
Icon=firefox
Terminal=false
Type=Application
Categories=Utility;FileManager;
StartupNotify=true
EOF

  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/meshiji/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/meshiji/LICENSE"

  # PATH helper for bash/zsh
  mkdir -p "$pkgdir/etc/profile.d"
  cat > "$pkgdir/etc/profile.d/meshiji.sh" <<'EOL'
# Add Meshiji to PATH
export PATH="/usr/local/meshiji:$PATH"
EOL

  # PATH helper for fish
  mkdir -p "$pkgdir/usr/share/fish/vendor_conf.d"
  cat > "$pkgdir/usr/share/fish/vendor_conf.d/meshiji.fish" <<'EOL'
# Add Meshiji to PATH for Fish shell
fish_add_path /usr/local/meshiji
EOL
}
