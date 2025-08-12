# Maintainer: Hamid Jamal <hamidjamal@hotmail.co.uk>
pkgname=ytify
pkgver=0.0.1  # There's no official releases but it does work
pkgrel=1
pkgdesc="Production build of ytify - lightweight YouTube player UI"
arch=('any')
url="https://github.com/n-ce/ytify"
license=('GPL-3.0')  
depends=('nodejs' 'python')  # nodejs needed to build, python for static server
makedepends=('git')
source=("git+https://github.com/n-ce/ytify.git")
sha256sums=('3202043b110dc4e014f6576f9d8da3e1d4dd9b1579542b4c3911d818a07d4f8d')

build() {
  cd "$srcdir/$pkgname"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r dist/* "$pkgdir/usr/share/$pkgname/"

  # Wrapper script to serve the static files via python3's simple HTTP server
  mkdir -p "$srcdir/pkgbin"
  cat > "$srcdir/pkgbin/ytify" <<EOF
#!/bin/sh
exec python3 -m http.server --directory /usr/share/$pkgname 3000
EOF

  install -Dm755 "$srcdir/pkgbin/ytify" "$pkgdir/usr/bin/ytify"
}
