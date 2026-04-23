# Maintainer: Retrowave Hyena <retrowavehyena@gmail.com>
pkgname=recon-git
pkgver=r308.0f10293
pkgrel=1
pkgdesc="A Resonite contacts app built with Flutter"
arch=('x86_64')
url="https://github.com/RetrowaveHyena/ReCon"
license=('GPL3')
depends=('gtk3' 'mpv' 'libepoxy' 'xdg-user-dirs')
makedepends=('flutter-bin' 'clang' 'cmake' 'ninja' 'pkg-config' 'git')
provides=('recon')
conflicts=('recon')
source=("$pkgname::git+https://github.com/RetrowaveHyena/ReCon.git")
sha256sums=('SKIP')
keywords=('resonite' 'contacts' 'vr' 'chat' 'flutter' 'messaging')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export GIT_CONFIG_GLOBAL="$srcdir/.gitconfig"
  git config --global --add safe.directory '*'
  flutter config --no-analytics
  flutter pub get
}

build() {
  cd "$pkgname"

  flutter build linux --release
}

package() {
  cd "$pkgname"

  # Install the bundle
  install -dm755 "$pkgdir/opt/recon"
  cp -r build/linux/x64/release/bundle/. "$pkgdir/opt/recon/"

  # Wrapper script so the binary is on PATH
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/recon" <<EOF
#!/bin/sh
exec /opt/recon/recon "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/recon"

  # Desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/recon.desktop" <<EOF
[Desktop Entry]
Name=ReCon
Comment=A Resonite contacts app
Exec=recon
Icon=recon
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF

  # Icon
  install -Dm644 "assets/images/logo512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/recon.png"
}
