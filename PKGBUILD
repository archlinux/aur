# Maintainer: Miguel Santos <miguelandrelealsantos.business@gmail.com>
pkgname=omarchy-calculator-git
pkgver=r31.b770e2a
pkgrel=1
pkgdesc="A minimal calculator app built with the Omarchy theme for Flutter (git version)"
arch=('x86_64')
url="https://github.com/cakePhone/omarchy_calculator"
license=('MIT')
depends=('gtk3' 'glibc')
makedepends=('flutter' 'git')
provides=('omarchy-calculator')
conflicts=('omarchy-calculator')
source=("$pkgname::git+https://github.com/cakePhone/omarchy_calculator.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  # Get Flutter dependencies
  flutter pub get
}

build() {
  cd "$srcdir/$pkgname"
  # Build the Flutter Linux application
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install the main executable and libraries
  install -Dm755 "build/linux/x64/release/bundle/omarchy_calculator" \
    "$pkgdir/usr/share/omarchy-calculator/omarchy_calculator"
  
  # Install Flutter libraries
  cp -r "build/linux/x64/release/bundle/lib" \
    "$pkgdir/usr/share/omarchy-calculator/"
  
  # Install Flutter data
  cp -r "build/linux/x64/release/bundle/data" \
    "$pkgdir/usr/share/omarchy-calculator/"
  
  # Install desktop file
  install -Dm644 "omarchy-calculator.desktop" \
    "$pkgdir/usr/share/applications/omarchy-calculator.desktop"
  
  # Install icon
  install -Dm644 "omarchy-calculator.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/omarchy-calculator.svg"
  
  # Create wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omarchy-calculator" << 'EOF'
#!/bin/bash
cd /usr/share/omarchy-calculator
exec ./omarchy_calculator "$@"
EOF
  
  # Install license
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
