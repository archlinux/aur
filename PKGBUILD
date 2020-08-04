# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=aws-cli-v2-bin
pkgver=2.0.36
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services version 2'
arch=('i686' 'x86_64')
url='https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html'
license=('Apache')
provides=('aws-cli' 'aws-cli-v2')
conflicts=('aws-cli' 'aws-cli-v2')
makedepends=('unzip')
depends=('less')
source=(
    "$pkgname-$pkgver.zip::https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
    "$pkgname-$pkgver.txt::https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig"
    "key.txt"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "08234975191be290020728ad89423176430767dbd407421d02853f6fdd5ca50a"
)

prepare() {
    # Check the sig but don't import the key
    # This is required because AWS haven't yet published their key to a keyserver
    # Please add your +1 to this issue https://github.com/aws/aws-cli/issues/4942

    gpg --dearmor key.txt
    gpg --no-default-keyring --keyring key.txt.gpg --homedir ./ --verify "$pkgname-$pkgver.txt" "$pkgname-$pkgver.zip"
}

pkgver() {
    ./aws/dist/aws --version | cut -d ' ' -f 1 | cut -d '/' -f 2
}

package() {
  $srcdir/aws/install -i "$pkgdir/usr/share/aws-cli" -b "$pkgdir/usr/bin" >/dev/null

  # Fix symlinks
  BIN_DIR="/usr/share/aws-cli/v2/current/bin"
  for i in $pkgdir/$BIN_DIR/*; do
    ln -sf "$BIN_DIR/$(basename $i)" "$pkgdir/usr/bin/"
  done

  # Fix symlink for current version
  rm "$pkgdir/usr/share/aws-cli/v2/current"
  ln -s "/usr/share/aws-cli/v2/$pkgver" "$pkgdir/usr/share/aws-cli/v2/current"
}
