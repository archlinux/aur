# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specter-desktop
pkgver=1.14.3
pkgrel=1
pkgdesc="Specter Desktop functions as a watch-only coordinator for multi-signature and single-key Bitcoin wallets."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'libusb' 'systemd-libs' 'python-dotenv' 'python-flask' 'python-flask-login' 'python-flask-wtf' 'python-mnemonic' 'python-hwilib' 'python-embit' 'python-flask-cors' 'python-pgpy' 'python-pyopenssl' 'python-stem' 
'python-typing_extensions' 'python-psutil' 'python-hidapi' 'python-ecdsa' 'python-protobuf' 'python-importlib-metadata' 'python-daemonize' 'python-noiseprotocol-git' 'python-wheel' 'python-pyasn1' 'python-cbor' 'python-urllib3' 'python-flask-babel' 'python-flask-apscheduler' 'gunicorn' 'python-cryptography' 'python-pyjwt' 'specterext-exfund' 'specterext-faucet' 'specterext-liquidissuer' 'specterext-spectrum')
backup=(usr/lib/systemd/system/specter.service)
install=$pkgname.install
source=("https://github.com/cryptoadvance/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'specter.service'
	'version.patch'
	'specter-desktop.install')

sha256sums=('f6bc48d70e7dfa7ae8662a70e95ce4a15d278459dd912e58361bd7c52a45447d'
            '9b5f57a0ebd48e6b7d1ac240913e4b502a6e3ffc5b64ff87ed263f1a4810a265'
	    '027e21210088706f41ea0d4f319cc7615593484b6bcb9f188ac045f20f8408fb'
	    '668ace7f14369014e42197321fa7e0edc90737c87e2b6a68354ab205d37e3aa6')

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
