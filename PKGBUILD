# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pyscrlink
pkgver=0.2.8
pkgrel=1
pkgdesc="Scratch Link for Linux: connects Scratch 3.0 to BLE devices (LEGO BOOST, WeDo, micro:bit, toio)"
arch=('any')
url="https://github.com/kawasaki/pyscrlink"
license=('BSD-3-Clause')
depends=('python' 'python-websockets' 'python-cryptography' 'python-bluepy' 'nss' 'libcap')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('bluez: bluetoothd to power on the Bluetooth adapter'
            'sudo: for the bluepy_helper_cap helper (the pacman hook already sets capabilities)')
install=pyscrlink.install
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "modern-asyncio-websockets.patch"
        "pyopenssl-cryptography.patch"
        "rescan-after-failed-scan.patch"
        "pyscrlink-bluepy-cap.hook")
sha256sums=('4a0233915693b00f1a68718e532199a406ac49aced52361d2d752099a91f4282'
            '0dff0fe0b3ec329d27370a6b79e23e05f3cb2e390c14911813262c034299134a'
            'f76fdb2d822884cb798b0151e6c90aeac4b9284a2e81fbd80a13a9b17ea0c4b6'
            '72de011b2be5e56993e1b142cc17271b723cf8236648f2d56b0de87fe4461629'
            'eb5a68ee0bca3aad0226aa7238097af0fcd7244d508830beb1e720a668156cc4')

prepare() {
  cd "$pkgname-$pkgver"
  # Python >= 3.14 (no implicit event loop), websockets >= 14 (handler without path),
  # invalid escape sequence in gencert.py
  patch -Np1 -i ../modern-asyncio-websockets.patch
  # pyOpenSSL >= 24.3 dropped X509.add_extensions; use python-cryptography
  patch -Np1 -i ../pyopenssl-cryptography.patch
  # a failed scan left scan_started set, so no further scan was ever run
  patch -Np1 -i ../rescan-after-failed-scan.patch
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH="$PWD/build/lib" python -W error::SyntaxWarning -c 'import pyscrlink.scratch_link'
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ../pyscrlink-bluepy-cap.hook "$pkgdir/usr/share/libalpm/hooks/pyscrlink-bluepy-cap.hook"
}
