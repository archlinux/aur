# Maintainer: hrdl <aur@hrdl.eu>

pkgname=python-wyoming-faster-whisper
_pkgname=wyoming-faster-whisper
pkgdesc="Wyoming Server for Faster Whisper"
pkgver=1.1.0
pkgrel=4
arch=(any)
url="https://github.com/rhasspy/wyoming-faster-whisper"
license=('MIT')
depends=(python 'python-wyoming>=1.5.2' ctranslate2 python-tokenizers)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${pkgver}.tar.gz"
        wyoming-faster-whisper.conf
        wyoming-faster-whisper.service
        0001-fix-setup.patch)
sha256sums=('b7eed249299c6da59b015aff81af171578d3cbd2a133254ccac63b14c6ac16ee'
            '9b4a794ebcfbed17849adae53ce5a70ca354d8522693ca721a3938aad150a97d'
            'a3d8484cc0483deea2cc2097229d48911bd22e84ce30cabbfac4704399454502'
            'a04fea323539a46da3e7e90e8bf04a6974317005a6ea470bf8335f73d97ca351')

prepare() {
  cd $_pkgname-$pkgver
  patch -i "${srcdir}/0001-fix-setup.patch"
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../wyoming-faster-whisper.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ../wyoming-faster-whisper.conf "$pkgdir/etc/conf.d/wyoming-faster-whisper"
}
