# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>
# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/electrum/-/blob/6d9acc129748edcd352f41f33e98c0cee8637fc5/PKGBUILD by Santiago Torres-Arias <santiago@archlinux.org>

pkgname=electrum-git
pkgver=4.6.0.r48.gda18c975a
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
url="https://github.com/spesmilo/electrum"
license=('MIT')
depends=(
         'hicolor-icon-theme'
         'libsecp256k1'
         'python'
         'python-ecdsa'
         'python-qrcode'
         'python-protobuf'
         'python-dnspython'
         'python-qdarkstyle'
         'python-aiorpcx'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-certifi'
         'python-bitstring'
         'python-attrs'
         'python-jsonpatch'
         'python-cryptography'
         'python-requests'
         'python-six'
         'protobuf'
         'python-protobuf'
         'python-pyaes'
         'qt6-base'
         'python-electrum_ecc'
         'python-electrum_aionostr'
         'python-websockets'
)
checkdepends=(
         'python-pycryptodomex'
         'python-pyqt6'
         'python-pytest'
         'qt6-declarative'
)
makedepends=(
         'git'
         'python-build'
         'python-installer'
         'python-setuptools'
         'python-wheel'
)
optdepends=(
         'desktop-file-utils: update desktop icon'
         'gtk-update-icon-cache: update desktop icon'

         #Trezor hardware wallet
         'trezor-udev: Trezor harware wallet support'
         'python-trezor: Trezor hardware wallet support'

         #Keepkey hardware wallet
         'keepkey-udev: Keepkey hardware wallet support'
         'python-mnemonic: Keepkey hardware wallet support'
         'python-hidapi: Keepkey hardware wallet support'
         'python-libusb1: Keepkey hardware wallet support'

         #Ledger hardware wallet
         'ledger-udev: Ledger hardware wallet support'
         'python-hidapi: Ledger hardware wallet support'
         'python-ledger-bitcoin: Ledger hardware wallet support'

         #Coldcard hardware wallet
         'python-ckcc-protocol: Coldcard wallet hardware support'

         #Bitbox01/Digital Bitbox hardware wallet
         'bitbox-udev: Bitbox01/Digital Bitbox hardware wallet support'
         'python-hidapi: Bitbox01/Digital Bitbox hardware wallet support'

         #Bitbox02 Hardware wallet
         'bitbox-udev: Bitbox02 hardware wallet support'
         'python-bitbox02: BitBox02 hardware wallet support'
         'python-hidapi: Bitbox02 hardware wallet support'

         #Jade Hardware wallet
         'python-cbor2: Blockstream Jade hardware wallet communication'
         'python-pyserial: Blockstream Jade hardware wallet serial port extension'

         'python-matplotlib: plot transaction history in graphical mode'
         'python-rpyc: send commands to Electrum Python console from an external script'
         'xdg-utils: update desktop icon'
         'zbar: QR code reading support'
)
source=(
         git+https://github.com/spesmilo/electrum.git
         git+https://github.com/spesmilo/electrum-locale.git
         git+https://github.com/spesmilo/electrum-http.git
         git+https://github.com/spesmilo/electrum-keepkeylib.git
)
sha256sums=(
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
)
provides=('electrum')
conflicts=('electrum')
install=electrum.install
options=(!debug)

pkgver() {
  cd ${pkgname%-git}
  _tag=$(git tag --list --sort=taggerdate | tail -n1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  printf $_tag;
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^.\{5\}//'
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule.electrum/locale.url "$srcdir/electrum-locale"
  git config submodule.electrum/plugins/payserver/www.url "$srcdir/electrum-http"
  git config submodule.electrum/plugins/keepkey/keepkeylib.url "$srcdir/electrum-keepkeylib"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname%-git}
  pytest
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vdm755 "$pkgdir/$site_packages/electrum"
  ./contrib/locale/build_locale.sh "$srcdir/electrum/electrum/locale/locale" "$pkgdir/$site_packages/electrum/locale/locale"

  install -Dm644 AUTHORS README.md RELEASE-NOTES -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
