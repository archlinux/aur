# Maintainer: willemw <willemw12@gmail.com>

pkgname=cpod-git
pkgver=1.28.0.r27.ga648efd
pkgrel=1
pkgdesc='A simple, beautiful podcast app'
arch=(x86_64)
url='https://github.com/z-------------/CPod'
license=(Apache)
depends=(alsa-lib gconf gtk3 libxss nss)
makedepends=(git gulp libxcrypt-compat nvm yarn)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# For the Node.js version used by CPod, see file .travis.yml ("dist:" and "node_js:")
# For a list of all Node.js versions, run in Bash: source /usr/share/nvm/init-nvm.sh ; nvm ls-remote
_nodejsver=8.17.0

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  # Avoid "Unresolved node modules" error
  export ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true

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

