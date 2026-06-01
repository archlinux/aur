# Maintainer: CookieSn1ffer <230327296+cookiesn1ffer@users.noreply.github.com>
pkgname=nexus-tracker
pkgver=2.0.0
pkgrel=1
pkgdesc="Minimal offline-first personal accountability tracker — streaks, XP, categories, dark/light theme"
arch=('x86_64')
url="https://github.com/cookiesn1ffer/nexus-tracker"
license=('MIT')
depends=('gtk3' 'libkeybinder3')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ba90b2aa83a00d831d9cf5cbb74bf2e537cac192fd34dc3db000a8cb4fb5b93')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PUB_CACHE="$srcdir/.pub-cache"
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install bundle
  install -d "$pkgdir/opt/$pkgname"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/$pkgname/"

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/nexus_tracker" "$pkgdir/usr/bin/nexus_tracker"

  # .desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Nexus Tracker
Comment=Personal accountability tracker with streaks and XP
Exec=/opt/$pkgname/nexus_tracker
Icon=$pkgname
Type=Application
Categories=Utility;
Keywords=productivity;habits;tracker;streak;
EOF

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
