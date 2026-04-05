pkgname=python-wyoming-piper
_pkgname=wyoming-piper
pkgdesc="Wyoming Server for Piper"
pkgver=2.2.2
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming-piper"
license=('MIT')
depends=(python python-wyoming piper-tts python-sentence-stream)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-regex')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-speech-features')
backup=(etc/conf.d/wyoming-piper)
source=("git+https://github.com/rhasspy/wyoming-piper.git#tag=v${pkgver}"
        wyoming-piper.conf
        wyoming-piper.service
        wyoming-piper.sysusers
        wyoming-piper.tmpfiles)
b2sums=('72dbafc4d6c961088a24cd8d7aa0bb6809cc094913e7166fcd7b82dbc8cd822f37e27ad72360aab78252243d01e5b77f67cc7796715af8fb01a704cd6c704ff1'
        'd81867797c195e91d22cf0d8a93d63c07ecfa2f7bffe2fc67ccb00c988e6184deba12317b2cf5f049478fbb884e2f73a42072528629cf903f1bfef8cfcd02ac9'
        '79ef3201b170b502244eb48d5df7a7e22f1ef16aad24fba5f09f5b35c38e2b30d1e5e189626efa04fcfc6387e909d770b7e8534e416a0d34e75ee278c0b80012'
        '5f67679c77b4f184134c3b4443a259758442c30600b90ef78acaa2a13c36b304900fcdc4e98d4c31d599f83328ef240f460a3d58b0cb556c38c249fe44ecd031'
        '1515aab452da43a8b0c1a43e2130f0cf503f196fb816e66c86b95fa6ec58467e02e3137e59a13f45fea7a3e66aa8de3ef1ab8d1e640a4357902fe2c49bf43edd')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
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
