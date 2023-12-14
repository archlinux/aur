# Maintainer: Stephan Koglin-Fischer <stephan dot koglin-fischer at funzt dot dev>
pkgname=dashlane-cli-git
pkgver=v1.15.1.r0.g8368d87
pkgrel=1
pkgdesc="Dashlane CLI GitHub repository verion, build with local installed Node.js version"
arch=('x86_64')
url="https://github.com/Dashlane/dashlane-cli"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'asdf-vm')
source=("$pkgname::git+$url.git" '.tool-versions')
install=".INSTALL"
b2sums=('SKIP'
        'e3879ac7cd875b85d5ffd78c999e26bb47f26e56f6b69bddb6742b51308254ea70eb26013fd245cb4248dde8a9c760b5390a5599cbe1d8171af9c42ed1326138')

# option strip is important for dcli to work properly and avoid
# 'Pkg: Error reading from file.' error in production
options=(!strip)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  asdf install
  cd "$srcdir/$pkgname"
  yarn install
}

build() {
  cd "$srcdir/$pkgname"
  yarn run build
}

package() {
  cd "$srcdir/$pkgname"
  # Custom build command to use the local installed node version
  yarn exec pkg . -t latest-linux-x64 -o bundle/dcli-linux
  install -Dm755 "$srcdir/$pkgname/bundle/dcli-linux" "$pkgdir/usr/bin/dcli"
}
