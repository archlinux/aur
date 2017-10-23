# Maintainer: Bartłomiej Kamiński <bartlomiej.kaminski@maidsafe.net>
pkgname=safe-browser
pkgver=0.6.0
pkgrel=1
pkgdesc="A browser designed to open safe:// websites on the SAFE Network."
arch=('i686' 'x86_64')
url="https://github.com/maidsafe/safe_browser"
license=('custom:BeakerLicense')
groups=('maidsafe')
depends=('gtk2' 'gconf' 'alsa-lib' 'libxtst' 'libxss')
makedepends=('nvm' 'yarn' 'unzip')
optdepends=()
install=
changelog=
source=('https://github.com/maidsafe/safe_browser/archive/alpha-2.tar.gz')
md5sums=('ae9b06d2548a9ec30429b95195e993cf')

build() {
  # use nvm
  . /usr/share/nvm/nvm.sh

  # prepare nvm dir
  mkdir -p $HOME/.nvm-tmp
  export NVM_DIR=$HOME/.nvm-tmp
  nvm install 6.5.0

  # load dependencies for safe-browser
  cd "safe_browser-alpha-2"
  yarn
  yarn run build
  yarn run package

  nvm unload
  rm -rf $HOME/.nvm-tmp

  cd dist
  unzip -d safe-browser safe-browser-0.6.0.zip
}

package() {
  cd "safe_browser-alpha-2"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "BEAKER_LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "dist"
  mkdir -p "$pkgdir/opt/maidsafe"
  mkdir -p "$pkgdir/usr/bin"
  mv safe-browser "$pkgdir/opt/maidsafe/$pkgname-$pkgver"
  ln -s "$pkgdir/opt/maidsafe/$pkgname-$pkgver/safe-browser" "$pkgdir/usr/bin/safe-browser"
}
