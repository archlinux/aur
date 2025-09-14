# Maintainer: XielQ <offical.gamerboytr@yandex.com>
pkgname=bombkurdistan-git
pkgver=1.2.3
pkgrel=1
pkgdesc='A simple game where you can bomb kurdistan'
arch=('x86_64')
url='https://github.com/XielQs/BombKurdistan'
license=('MIT')
makedepends=('git' 'make' 'gcc' 'cmake')
conflicts=('bombkurdistan' 'bombkurdistan-bin')
replaces=('bombkurdistan-bin')
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive --progress --verbose
}

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//' | sed 's/-/+/g'
}

build() {
  cd "$srcdir/$pkgname"
  chmod +x ./build.sh
  ./build.sh
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/$pkgname"
  install -Dm755 bombkurdistan "$pkgdir/usr/lib/$pkgname/bombkurdistan"
  cp -r assets "$pkgdir/usr/lib/$pkgname/assets"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/bombkurdistan.desktop" <<EOF
[Desktop Entry]
Name=BombKurdistan
Comment=A simple game where you bomb kurdistan
Exec=/usr/bin/bombkurdistan
Icon=bombkurdistan
Terminal=false
Type=Application
Categories=Game;
EOF

  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/bombkurdistan.png"

  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/bombkurdistan" <<EOF
#!/bin/bash
cd /usr/lib/$pkgname
./bombkurdistan
EOF
  chmod +x "$pkgdir/usr/bin/bombkurdistan"
}
