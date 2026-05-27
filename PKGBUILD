# Maintainer: CookieSn1ffer <230327296+cookiesn1ffer@users.noreply.github.com>
pkgname=nexus-tracker
pkgver=1.1.0
pkgrel=1
pkgdesc="Personal Accountability App"
arch=('x86_64')
url="https://github.com/cookiesn1ffer/nexus-tracker"
license=('MIT')
depends=('gtk3' 'libkeybinder3')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc9446aab9aba1b3846f3c845c7c77db770e9ce187b9984e608e63ff718b90a7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  flutter pub get
  flutter build linux --release || true
  
  if [ ! -f "build/linux/x64/release/bundle/nexus_tracker" ]; then
    cd build/linux/x64/release
    ninja
    cmake --install .
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/opt/$pkgname"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/nexus_tracker" "$pkgdir/usr/bin/nexus_tracker"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Nexus Tracker
Exec=/opt/$pkgname/nexus_tracker
Icon=$pkgname
Type=Application
Categories=Utility;
EOF
}
