# Maintainer: onbjerg <hi@notbjerg.me>
pkgname=frame-eth
pkgver="0.4.4"
pkgrel=2
pkgdesc="System-wide Web3"
arch=('x86_64')
url='https://frame.sh'
license=('GPL3')
depends=('gtk3' 'nss' 'libxss')
_node_ver=14
makedepends=('npm' 'nvm' 'libusb' 'python3' 'git' 'node-gyp')
provides=('frame')
install=$pkgname.install
source=("git+https://github.com/floating/frame.git#tag=v$pkgver"
        "$pkgname.desktop")
sha256sums=('SKIP' 'SKIP')

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
  nvm install 14
}

build() {
  _ensure_local_nvm
  cd frame
  npm install --cache "${srcdir}/npm-cache"
  npm run build -- --linux dir
}

package() {
  cd frame
  install -d "$pkgdir/opt/$pkgname"
  cp -r --preserve=mode dist/linux-unpacked/* "$pkgdir/opt/$pkgname/"
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "asset/png/FrameAppIcon.png" "$pkgdir/usr/share/pixmaps/frame.png"
  printf "#!/bin/sh\n\n/opt/$pkgname/frame \"\$@\"\n" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/frame"
}
