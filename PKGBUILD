pkgname=frame-eth-canary-git
_pkgname=frame-eth-canary
pkgver=0.6.7.canary.1.r0.g92b0c47e
pkgrel=1
pkgdesc="System-wide Web3"
arch=('x86_64' 'aarch64')
url='https://frame.sh'
license=('GPL3')
depends=('gtk3' 'nss' 'libxss')
_node_ver=18
makedepends=('npm' 'nvm' 'libusb' 'python3' 'git' 'node-gyp')
provides=('frame')
conflicts=('frame-eth-dev' 'frame-eth')
install=$_pkgname.install
source=("git+https://github.com/frame-labs/frame-canary.git"
        "$_pkgname.desktop")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd frame-canary
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_ensure_local_nvm() {
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  nvm install "$_node_ver"
}

build() {
  _ensure_local_nvm
  cd frame-canary
  npm run setup
  npm install --cache "${srcdir}/npm-cache"
  # npm run bundle
  npm run build -- --linux dir
}

package() {
  cd frame-canary
  install -d "$pkgdir/opt/$_pkgname"
  cp -r --preserve=mode dist/linux-unpacked/* "$pkgdir/opt/$_pkgname/"
  install -Dm644 "../$_pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "asset/png/FrameAppIcon.png" "$pkgdir/usr/share/pixmaps/frame.png"
  printf "#!/bin/sh\n\n/opt/$_pkgname/frame-canary \"\$@\"\n" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/frame"
}
