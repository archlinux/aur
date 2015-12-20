# Maintainer: Py64 <py64.wolflinux@gmail.com>

pkgname=httpjs-git
pkgver=r42.4acce7f
pkgrel=1
pkgdesc='Lightweight web server'
arch=('i686' 'x86_64')
url='https://httpjs.wolflinux.org'
license=('custom')
depends=('nodejs' 'zlib' 'openssl' 'linux>2.6.24')
makedepends=('git' 'npm' 'sudo' 'gcc' 'make')
optdepends=("letsencrypt: get Let's Encrypt certificates")
backup=('etc/httpjs/GoFile')
conflicts=('httpjs')
replaces=('httpjs')
provides=('httpjs')
install=httpjs.install
source=("git+https://github.com/HTTPjs/HTTPjs.git" 'httpjs.sh')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/HTTPjs"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/HTTPjs"
  mkdir "$pkgdir/usr" "$pkgdir/usr/bin" "$pkgdir/srv" \
	"$pkgdir/var" "$pkgdir/var/log" "$pkgdir/var/log/httpjs" \
	"$pkgdir/srv/http" "$pkgdir/usr/share" "$pkgdir/usr/share/httpjs" \
	"$pkgdir/usr/share/httpjs/errors" "$pkgdir/etc" "$pkgdir/etc/httpjs" \
        "$pkgdir/var/lib" "$pkgdir/var/lib/httpjs" \
        "$pkgdir/var/lib/httpjs/js" \
        "$pkgdir/var/lib/httpjs/js/node_modules"
  cp lib/*.js "$pkgdir/var/lib/httpjs/js/"
  cp http.js "$pkgdir/var/lib/httpjs/httpjs"
  cp "$srcdir/httpjs.sh" "$pkgdir/usr/bin/httpjs"
  chmod +x "$pkgdir/usr/bin/httpjs"
  cp GoFile.example "$pkgdir/etc/httpjs"
  cp GoFile.example "$pkgdir/etc/httpjs/GoFile"
  cp public/index.html "$pkgdir/srv/http"
  cp error-pages/*.html "$pkgdir/usr/share/httpjs/errors"

  echo "Fixing https://github.com/HTTPjs/HTTPjs/issues/37"
  sudo setcap 'cap_net_bind_service=+ep' "$pkgdir/var/lib/httpjs/httpjs"
  sudo setcap 'cap_net_bind_service=+ep' "$pkgdir/usr/bin/httpjs"

  echo "Installing dependencies..."
  npm install --prefix "$pkgdir/var/lib/httpjs/js/" stream-buffers@3.0.0 \
              fastcgi-parser@0.1.x \
              mmmagic@0.4.1 \
              spdy@3.0.0 \
              js-yaml@3.4.6 \
              streamifier@0.1.1
}
