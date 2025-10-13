

pkgname=voicevox-engine
pkgver=0.24.1
pkgrel=1
pkgdesc='A http server for text-to-speech'
arch=('x86_64')
license=('LGPL-3.0-only' 'nonfree')
url=https://github.com/VOICEVOX/voicevox_engine
_syspymods=(fastapi importlib-metadata jaraco.text jinja markupsafe numpy platformdirs pydantic pydantic-core python-multipart semver soxr soundfile yaml)
depends=(python ${_syspymods[@]/#/python-})
makedepends=(python-{build,setuptools,installer})
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
https://github.com/r9y9/open_jtalk/releases/download/v1.11.1/open_jtalk_dic_utf_8-1.11.tar.gz
#${url}/releases/download/${pkgver}/voicevox_engine-linux-nvidia-${pkgver}.7z.00{1,2}
${url}/releases/download/${pkgver}/voicevox_engine-linux-cpu-x64-${pkgver}.7z.001) # should be built from src
noextract=(*.7z.*)
sha256sums=('0488d3b98b4e2876c3070c2287347df92cacf724f0e986c60cad7aabffb6cf7e'
            'fe6ba0e43542cef98339abdffd903e062008ea170b04e7e2a35da805902f382a'
            'edc810a1a2a0540b4e38abfeb6b08e9284fa06508f1d1cab6c2379260645aa11')

build(){
  bsdtar -xf voicevox_engine-linux-cpu-x64-${pkgver}.7z.001 linux-cpu-x64/{*.json,libonnxruntime.so,libvoicevox_core.so,*.json,model,resources}
  # buldle missing modules as a workaround
  python -m venv venv --system-site-packages
  venv/bin/pip install kanalizer pyopenjtalk pyworld

  cd ${pkgname/-/_}-$pkgver
  rm -rf resources # avoid build err. non production engine
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$srcdir" voicevox_engine-${pkgver}/dist/*.whl
  install -d "$pkgdir"/usr/lib/VOICEVOX
  mv linux-cpu-x64 "$pkgdir"/usr/lib/VOICEVOX/vv-engine
  mv usr/lib/python*/site-packages/* -t "$pkgdir"/usr/lib/VOICEVOX/vv-engine
  mv venv/lib/python*/site-packages/{kanalizer,pyopenjtalk,pyworld}* -t "$pkgdir"/usr/lib/VOICEVOX/vv-engine
  mv open_jtalk* -t "$pkgdir"/usr/lib/VOICEVOX/vv-engine/pyopenjtalk
  sed '1c#!/usr/bin/python' voicevox_engine-${pkgver}/run.py | install -Dm755 /dev/stdin "$pkgdir"/usr/lib/VOICEVOX/vv-engine/run
}
