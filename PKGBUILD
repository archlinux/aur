# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specter-desktop
pkgver=1.7.2
pkgrel=1
pkgdesc="Specter Desktop functions as a watch-only coordinator for multi-signature and single-key Bitcoin wallets."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'libusb' 'systemd-libs' 'python-dotenv' 'python-flask' 'python-flask-login' 'python-flask-wtf' 'python-mnemonic' 'python-hwilib' 'python-embit' 'python-flask-cors' 'python-pgpy' 'python-pyopenssl' 'python-stem' 
'python-typing_extensions' 'python-psutil' 'python-hidapi' 'python-ecdsa' 'python-protobuf' 'python-importlib-metadata' 'python-daemonize' 'python-noiseprotocol-git' 'python-wheel' 'python-pyasn1' 'python-cbor' 'python-urllib3' 'python-flask-babel')
backup=(usr/lib/systemd/system/specter.service)
source=("https://github.com/cryptoadvance/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'specter.service'
	'version.patch')

sha256sums=('2ea805705e5808f75c51aae0a74c39c6a8d6e176ee1f66aa52b1b64aff1d0d46'
            '9b5f57a0ebd48e6b7d1ac240913e4b502a6e3ffc5b64ff87ed263f1a4810a265'
	    '32c38d16cc00fba2ad3d5ac9df3b1742fd57b625f6b34f368e59affd9aa440d3')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/version.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py sdist bdist_wheel
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # install systemd file
  install -Dm 644 "${srcdir}"/*.service -t "${pkgdir}"/usr/lib/systemd/system

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
