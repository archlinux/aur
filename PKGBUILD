# Maintainer: Enzo Fuke <projects@milesonerd.aleeas.com>

pkgname=camofox-browser-git
pkgver=r213.c9ea6f8
pkgrel=1
pkgdesc="Stealth browser for AI agents with advanced fingerprint spoofing (git version)"
arch=('x86_64')
url="https://github.com/jo-inc/camofox-browser"
license=('MIT')
depends=('nodejs' 'gtk3' 'alsa-lib' 'nss' 'nspr' 'libxtst' 'libxcomposite' 'libxfixes' 'libxrandr' 'libxrender' 'libxcursor' 'libxi')
makedepends=('git' 'npm')
provides=('camofox-browser')
conflicts=('camofox-browser')

source=("git+https://github.com/jo-inc/camofox-browser.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/camofox-browser"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/camofox-browser"
  export npm_config_cache="$srcdir/npm_cache"
  npm ci --omit=dev
}

package() {
  cd "$srcdir/camofox-browser"

  install -dm755 "$pkgdir/usr/lib/camofox-browser"
  cp -r * "$pkgdir/usr/lib/camofox-browser"
  
  rm -rf "$pkgdir/usr/lib/camofox-browser/.git" \
		 "$pkgdir/usr/lib/camofox-browser/node_modules/.cache"
		 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/camofox-browser"
#!/bin/bash
cd /usr/lib/camofox-browser
exec npm start "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/camofox-browser"
}
