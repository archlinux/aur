pkgname=python-wyoming-piper
_pkgname=wyoming-piper
pkgdesc="Wyoming Server for Piper"
pkgver=1.5.2
pkgrel=2
arch=(any)
url="https://github.com/rhasspy/wyoming-piper"
license=('MIT')
depends=(python python-wyoming piper-tts)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=(etc/conf.d/wyoming-piper)
source=("git+https://github.com/rhasspy/wyoming-piper.git#tag=v${pkgver}"
        wyoming-piper.conf
        wyoming-piper.service
        wyoming-piper.sysusers
        wyoming-piper.tmpfiles)
b2sums=('06df8a4acd0b61173c58b66426e9318ae24672de2bfc17a905235331eeb7bc652742b2388323c93f6df4b1b7cae307aae0c319e5f713e1b9e893f5e9fd54016e'
        'd81867797c195e91d22cf0d8a93d63c07ecfa2f7bffe2fc67ccb00c988e6184deba12317b2cf5f049478fbb884e2f73a42072528629cf903f1bfef8cfcd02ac9'
        '317e1cd40e9c92c72c70feef44df5409a5df7a2a5f3b226fa903f203dd4a25dc218d34acdbf8fb571fe13add43796bd85af7b47853b217fef89178f66d26d483'
        '5f67679c77b4f184134c3b4443a259758442c30600b90ef78acaa2a13c36b304900fcdc4e98d4c31d599f83328ef240f460a3d58b0cb556c38c249fe44ecd031'
        '1515aab452da43a8b0c1a43e2130f0cf503f196fb816e66c86b95fa6ec58467e02e3137e59a13f45fea7a3e66aa8de3ef1ab8d1e640a4357902fe2c49bf43edd')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../wyoming-piper.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ../wyoming-piper.conf "$pkgdir/etc/conf.d/wyoming-piper"
  install -Dm644 ../wyoming-piper.sysusers "$pkgdir/usr/lib/sysusers.d/wyoming-piper.conf"
  install -Dm644 ../wyoming-piper.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/wyoming-piper.conf"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
