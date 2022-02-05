# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specter-desktop
pkgver=1.8.1
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

sha256sums=('0b65de5ea465725dbf144a52f77d1415bd4b6f693d39117027ee0ab0e0a24065'
            '9b5f57a0ebd48e6b7d1ac240913e4b502a6e3ffc5b64ff87ed263f1a4810a265'
	    '87b4381097db243946a22a76dc1d2d424a5f49af572e89334cf2e1fd0a64000e')

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
