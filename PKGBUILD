# Maintainer: Bartłomiej Kamiński <bartlomiej.kaminski@maidsafe.net>
pkgname=safe-mail-tutorial
pkgver=0.4.0
pkgrel=1
pkgdesc="A tutorial app showcasing how to use the low level API from safe_app_nodejs library to build a simple email application."
arch=('i686' 'x86_64')
url="https://github.com/maidsafe/safe_examples"
license=('GPL3')
groups=('maidsafe')
depends=('safe-browser')
makedepends=('nvm')
optdepends=()
install=
changelog=
source=('https://github.com/maidsafe/safe_examples/archive/alpha-2.tar.gz')
md5sums=('9f2fd11606650443355a3641e8ba8cd6')

build() {
  # use nvm
  . /usr/share/nvm/nvm.sh

  # prepare nvm dir
  mkdir -p $HOME/.nvm-tmp
  export NVM_DIR=$HOME/.nvm-tmp
  nvm install 7.10.0

  # load dependencies for safe-browser
  cd "safe_examples-alpha-2/email_app"
  npm install
  npm run package

  nvm unload
  rm -rf $HOME/.nvm-tmp
}

package() {
  cd "safe_examples-alpha-2/email_app/out"
  mkdir -p "$pkgdir/opt/maidsafe"
  mkdir -p "$pkgdir/usr/bin"
  case $CARCH in
    "i686")
      mv safe-mail-tutorial-linux-x86 "$pkgdir/opt/maidsafe/$pkgname-$pkgver"
      ;;
    "x86_64")
      mv safe-mail-tutorial-linux-x64 "$pkgdir/opt/maidsafe/$pkgname-$pkgver"
      ;;
  esac
  ln -s "/opt/maidsafe/$pkgname-$pkgver/safe-mail-tutorial" "$pkgdir/usr/bin/safe-mail-tutorial"
}
