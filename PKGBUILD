# Maintainer: redfish <redfish at galactica dot pw>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: digital mystik <dgtl_mystik at protonmail dot ch>

_name=trezor-agent
pkgname=python-trezor-agent
pkgver=0.14.8
pkgrel=1
pkgdesc="Using hardware wallets as SSH/GPG agent"
arch=('any')
url="https://github.com/romanz/trezor-agent"
license=('LGPL3')
depends=(
     'libusb'
     'python'
     'python-bech32'
     'python-configargparse'
     'python-construct-classes'
     'python-cryptography'
     'python-daemon'
     'python-docutils'
     'python-ecdsa'
     'python-hidapi'
     'python-mnemonic'
     'python-pymsgbox'
     'python-pynacl'
     'python-semver'
     'python-simple-rlp'
     'python-trezor>=0.13'
     'python-unidecode'
     'python-wheel'
     'trezor-udev'
     )
optdepends=('gnupg>=2.1.11: encrypt and sign with Trezor')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "setup-drop-shutil-backport-dep.patch")
sha256sums=('1216a567b528267f2089280484adc17d9c51cbc63b3bf2a0b33c2c4f622873d9'
            '5d5478d92d666066a6aa4e43c51109150841b9d10075ba622b2e0c1ccbb8b29c')

prepare() {
    cd $_name-$pkgver
    patch -p1 < "$srcdir/setup-drop-shutil-backport-dep.patch"
}

build() {
    cd "$_name-$pkgver"
    python setup.py build

    cd agents/trezor
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    cd agents/trezor
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
