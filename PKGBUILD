# Maintainer: willemw <willemw12@gmail.com>

_pkgname=cpod
pkgname=$_pkgname-git
pkgver=1.27.1.r56.g581cd25
pkgrel=1
pkgdesc="A simple, beautiful podcast app"
arch=('x86_64')
url="https://github.com/z-------------/CPod"
license=('Apache')
depends=('gconf')
makedepends=('git' 'gulp' 'nvm' 'yarn')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=('cumulonimbus')
source=($pkgname::git+https://github.com/z-------------/CPod.git)
sha256sums=('SKIP')

# For the Node.js version used by CPod, see: .travis.yml (dist: and node_js:)
# For a list of all Node.js versions, run: source /usr/share/nvm/init-nvm.sh ; nvm ls-remote
#_nodejsver=0.10.25
_nodejsver=8.16.0

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  # Keep all Node.js files inside the package build folder
  export HOME="$srcdir/$pkgname"

  # Use a specific Node.js version
  export NVM_DIR="$srcdir/$pkgname/.nvm"
  source /usr/share/nvm/nvm.sh
  nvm install $_nodejsver
  nvm use $_nodejsver

  yarn

  gulp
}

package() {
  cd $pkgname
  rm -rf dist
  yarn dist --linux deb   # --x64

  cd dist
  bsdtar xf CPod_*.deb data.tar.xz
  bsdtar xf data.tar.xz --directory "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/CPod/cpod "$pkgdir/usr/bin/cpod"
}

