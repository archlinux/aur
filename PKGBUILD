# Maintainer: smiley <smiley@aur.archlinux.org>
# Contributor: aa2013 <https://github.com/aa2013>

pkgname=clipshare
pkgver=1.4.4
pkgrel=1
pkgdesc="A cross-platform clipboard history and synchronization software (Linux desktop build)"
arch=('x86_64')
url="https://github.com/aa2013/ClipShare"
license=('GPL3')
depends=(
  'gtk3'
  'libkeybinder3'
  'libayatana-appindicator'
  'libayatana-indicator'
  'ayatana-ido'
  'libdbusmenu-glib'
  'libdbusmenu-gtk3'
  'libxtst'
  'wayland'
  'wayland-protocols'
)
makedepends=(
  'flutter'
  'clang'
  'cmake'
  'ninja'
  'pkgconf'
  'git'
  'unzip'
  'xz'
  'zip'
)
source=("$pkgname::git+https://github.com/aa2013/ClipShare.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname"

  local bundle_dir="build/linux/x64/release/bundle"
  local pkgdir_lib="$pkgdir/usr/lib/$pkgname"

  install -dm755 "$pkgdir_lib"
  install -dm755 "$pkgdir/usr/bin"

  cp -a "$bundle_dir/lib" "$pkgdir_lib/"
  cp -a "$bundle_dir/clipshare" "$pkgdir_lib/"

  if [[ -d "$bundle_dir/data" ]]; then
    cp -a "$bundle_dir/data" "$pkgdir_lib/"
  fi

  ln -sf "/usr/lib/$pkgname/clipshare" "$pkgdir/usr/bin/clipshare"

  install -Dm644 assets/images/logo/logo.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=ClipShare
Comment=Cross-platform clipboard history and synchronization
Exec=/usr/lib/$pkgname/clipshare
Icon=$pkgname
Type=Application
Categories=Utility;
Terminal=false
StartupNotify=true
EOF
}
