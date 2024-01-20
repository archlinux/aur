# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=ezra-bible-app
pkgver=1.13.0
pkgrel=1
pkgdesc="A user-friendly Bible study tool focussing on topical study based on keywords/tags"
arch=('x86_64')
url="https://github.com/ezra-bible-app/ezra-bible-app"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gtk3' 'nodejs' 'nss')
conflicts=('ezra-project')
replaces=('ezra-project')
makedepends=('cmake' 'git' 'npm' 'subversion' 'unzip')
_commit=48357d117fc0648f60b87efa6f4b1913118e4501  # tags/1.13.0^0
source=("git+https://github.com/ezra-bible-app/ezra-bible-app.git#commit=$_commit"
        'git+https://github.com/ezra-project/apidocs.ezrabibleapp.net.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.docs.url "$srcdir/apidocs.ezrabibleapp.net"
  git -c protocol.file.allow=always submodule update

  # Use latest version of Electron
  sed -i "s/17.1.0/28.1.4/g" package.json
}

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run compile-pug
  npm run commit-info
  npm run install-node-prune
  npm i node-pre-gyp rebuild
  npm run rebuild
  npm run prune-node-modules
  rm -rf /tmp/electron-packager &> /dev/null
  npm run purge-build-artifacts
  npm run package-linux
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
