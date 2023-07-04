pkgname=python-wyoming-faster-whisper
_pkgname=wyoming_faster_whisper
pkgdesc="Wyoming Server for Faster Whisper"
pkgver=0.0.3
pkgrel=1
arch=(any)
url="http://github.com/rhasspy/rhasspy3"
license=('MIT')
depends=(python python-wyoming ctranslate2 python-tokenizers)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/$_pkgname/$_pkgname-$pkgver.tar.gz"
        wyoming-faster-whisper.conf
        wyoming-faster-whisper.service
	0001-python311-enum-value.patch)
sha256sums=('baa7a96bbd25a6bcd5dc324adb0acd000c9990c309e52f3a44a2bbd7acf1614e'
            '0d54c89a46c4c1b907565ba2901ee6bfb2b07702cb8f8ecab5279342beba7ddd'
            '4d9d274dc9d58db5db274be03adf81fd9fae0ad3d7258f479eeada341059dafc'
            'c61aa218cecfc12fe62fb9d6bb50c561c8c97b9acb085877bd8df6755921e43f')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i "${srcdir}/0001-python311-enum-value.patch"
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
