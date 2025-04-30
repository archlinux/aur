# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=ezra-bible-app
pkgver=1.16.3
pkgrel=1
pkgdesc="A modern and user-friendly Bible app for desktops, tablets and mobiles focussing on topical study"
arch=('x86_64')
url="https://ezrabibleapp.net"
license=('GPL-2.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nodejs'
  'nss'
)
makedepends=(
  'cmake'
  'git'
  'npm'
  'python-setuptools'
  'subversion'
  'unzip'
)
conflicts=('ezra-project')
options=('!lto')
source=("git+https://github.com/ezra-bible-app/ezra-bible-app.git#tag=$pkgver"
        'git+https://github.com/ezra-project/apidocs.ezrabibleapp.net.git')
sha256sums=('6c5e6c29c0736ac61540ff1c6c11b8c7070a4f54c09e6025067946087677acb9'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.docs.url "$srcdir/apidocs.ezrabibleapp.net"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  npm run build-linux
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/opt/$pkgname"
  cp -r "release/$pkgname-linux-x64"/* "$pkgdir/opt/$pkgname"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 icons/ezra.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"
}
