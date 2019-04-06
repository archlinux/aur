# Maintainer: willemw <willemw12@gmail.com>

_pkgname=cpod
pkgname=$_pkgname-git
pkgver=1.27.0.r42.g98c1a1b
pkgrel=1
pkgdesc="A simple, beautiful podcast app"
arch=('x86_64')
url="https://github.com/z-------------/cumulonimbus"
license=('Apache')
depends=('gconf' 'gtk-update-icon-cache')
makedepends=('git' 'gulp' 'nvm' 'python2' 'yarn')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=('cumulonimbus')
source=($pkgname::git+https://github.com/z-------------/cumulonimbus.git)
sha256sums=('SKIP')

# Latest of a supported major version
_nodejsver=9.11.2

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

  #yarn config set python /usr/bin/python2
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

