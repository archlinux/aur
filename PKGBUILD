# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=probequest
pkgver=0.8.0
_tag=6b792d7ca4e45d0b2d433f56d219e839c789e222 # git rev-parse "v${pkgver}"
pkgrel=4
pkgdesc="Toolkit allowing to sniff and display the Wi-Fi probe requests passing nearby your wireless interface"
arch=('any')
url="https://probequest.skyplabs.net/en/stable/"
license=('GPL-3.0-or-later')
depends=(
    'python-netaddr>=0.7.19'
    'python-scapy>=2.4.3'
    'python>=3.7'
)
checkdepends=('python-pytest')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools-scm>=2.0.0'
    'python-setuptools>=42'
    'python-wheel'
)
source=(
    "$pkgname-$pkgver::git+https://github.com/SkypLabs/probequest.git#tag=$_tag?signed"
    "0001-Do-not-require-old-setuptools-scm.patch"
    "0002-Fix-timezone-dependent-unittest.patch"
)
validpgpkeys=('AA73D4B7CDB8C0546B47F061063BB9E8C569B26A') # Paul-Emmanuel Raoul <skyper <at> skyplabs <dot> net>
b2sums=('a3639126d88a74b77bc503a30287b396acb60c016e2edd68b8509136b6fc4f7b1889e0b8ffee6497fa819ec4d2834872236814d6db6f300038afece42d825d60'
        'c624bb7592368ba7ac65437fa1f1272c78b65491693c26d0b94be20e71d61561feb55d4b5ce5086fdd1b4ca9c92d0f13b3635e828b101801b2edef4d630301e0'
        '017b1cb49a0ff4020c2cfd5f4d92c469e271e7e9604b48ad6b62edbc266f0449b3d609ef1ef2dae7553d7dfcaa14b9f8a75d10077054e86b95ec3614ecb90910')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input=../0001-Do-not-require-old-setuptools-scm.patch
    patch --forward --strip=1 --input=../0002-Fix-timezone-dependent-unittest.patch
}

check() {
    cd $pkgname-$pkgver
    PYTHONPATH=src pytest
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
