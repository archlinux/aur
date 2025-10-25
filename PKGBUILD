# Maintainer: ezberlin <ezberlin at proton dot me>
pkgname=lichess-mobile-git
pkgver=0.1.3
pkgrel=3
pkgdesc="The official Lichess mobile application v2 (Linux desktop build)"
arch=('x86_64')
url="https://github.com/lichess-org/mobile"
license=('GPL-3.0-only')
depends=('rsync' 'glibc' 'gtk3')
makedepends=('fvm' 'base-devel' 'git' 'unzip' 'pkg-config' 'cmake' 'ninja' 'clang' 'java-environment-common')
source=("https://github.com/lichess-org/mobile/archive/refs/heads/main.zip")
sha256sums=('SKIP')

prepare() {
	  cd "$srcdir"
  unzip -q "main.zip" -d "${pkgname}-src"
  cd "${pkgname}-src"/*

  if [[ -f "lib/src/constants.dart" ]]; then
    cp lib/src/constants.dart lib/src/constants.dart.orig
    sed -i 's/lichess.dev/lichess1.org/g' lib/src/constants.dart
  fi

  if [[ -f ".fvm/fvm_config.json" ]]; then
    fvm install || true
  fi
}

build() {
  cd "$srcdir/${pkgname}-src"/*

  fvm use stable

  fvm flutter --version >/dev/null 2>&1 || return 1
  fvm flutter pub get || return 1

  # Run code generation once (no watch)
  fvm dart run build_runner build --delete-conflicting-outputs || return 1

  # Build Linux desktop release
  fvm flutter build linux --release || return 1
}

package() {
  cd "$srcdir/${pkgname}-src"/*

  install -d "$pkgdir"/usr/share/"$pkgname"
  install -d "$pkgdir"/usr/share/licenses/"$pkgname"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  install -d "$pkgdir"/usr/share/applications

  # Copy Linux desktop bundle
  if [[ -d "build/linux/x64/release/bundle" ]]; then
    rsync -a build/linux/x64/release/bundle/ "$pkgdir"/usr/share/"$pkgname"/
    # Assume binary name matches package directory; attempt to find executable
    exe="$(find build/linux -type f -perm -111 -maxdepth 3 -name '*' | head -n1)"
    exe_name="lichess_mobile"

    cat > "$pkgdir"/usr/bin/"$pkgname" <<EOF
#!/bin/sh
exec /usr/share/$pkgname/$exe_name "\$@"
EOF
    chmod +x "$pkgdir"/usr/bin/"$pkgname"

  cat > "$pkgdir"/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Name=Lichess Mobile
GenericName=Chess
Comment=Official Lichess mobile application (desktop build)
Exec=/usr/bin/$pkgname %U
Icon=lichess-mobile
Terminal=false
Type=Application
Categories=Game;BoardGame;
StartupWMClass=$exe_name
EOF

    # try to install a 256x256 icon if present in bundle (common paths)
    if [[ -f "assets/images/logo-white.png" ]]; then
      install -m644 assets/images/logo-white.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/lichess-mobile.png
    fi

  else
    echo "build/linux/x64/release/bundle not found" >&2
    return 1
  fi

  # Install license if present
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  fi
}

