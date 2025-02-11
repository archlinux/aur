###
 # Every line of code is my tear
 # Every tear is you
### 
# Maintainer: Javs <admin@fxs.life>
# Description: A versatile port-based automation engine designed for red team operations, optimized for network exploration and internal automation tasks.

pkgname=gogo-git
_gitname=gogo
pkgver=0.1281
pkgrel=1
pkgdesc="A versatile port-based automation engine for red team operations, capable of scanning and extracting key information in complex network environments."
arch=('i686' 'x86_64')
url="https://github.com/chainreactors/gogo.git"
license=('GPL')
depends=('go' 'git')
makedepends=('go' 'git')
source=('git+https://github.com/chainreactors/gogo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  # Initialize submodules and update
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_gitname/v2"

  # Sync dependencies
  go mod tidy
  
  # Generate necessary Go code
  go generate
  
  # Build the project
  go build -o gogo .
}

package() {
  cd "$srcdir/$_gitname/v2"
  
  # Install the compiled binary to the package directory
  install -Dm755 gogo "$pkgdir/usr/bin/gogo"
}
