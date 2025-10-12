

pkgname=voicevox-bin
pkgver=0.24.2
_engine=0.24.1
pkgrel=1
pkgdesc='Frontend for VOICEVOX TTS Engine'
arch=('x86_64')
license=('nonfree+GPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
_syspymods=(fastapi importlib-metadata jaraco.text jinja markupsafe numpy platformdirs pydantic pydantic-core python-multipart semver soxr soundfile yaml)
depends=(glibc gcc-libs zlib bash 7zip
$_electron python uvicorn ${_syspymods[@]/#/python-})
makedepends=(python-{build,setuptools,installer})
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=(voicevox.{desktop,sh.in}
https://github.com/r9y9/open_jtalk/releases/download/v1.11.1/open_jtalk_dic_utf_8-1.11.tar.gz
${url}_engine/archive/refs/tags/${_engine}.tar.gz
${url}/releases/download/${pkgver}/voicevox-linux-cpu-x64-${pkgver}.tar.gz)
noextract=(voicevox-linux-cpu-x64-${pkgver}.tar.gz)
sha256sums=('90694d6010e4ab7ea7813958653b511801242ccd1248da10bc6f277266cc58c8'
            '2d94ccef413c4a03f905179e1e42a1682bd8792d2a1097897129c7252119edb8'
            'fe6ba0e43542cef98339abdffd903e062008ea170b04e7e2a35da805902f382a'
            '0488d3b98b4e2876c3070c2287347df92cacf724f0e986c60cad7aabffb6cf7e'
            'aae06c0a90e565e102e67e3823323a445bede5b525cbdc507bc87c12aea74390')
# see https://raw.githubusercontent.com/VOICEVOX/voicevox/refs/tags/${pkgver}/package.json
_electron=electron36

build() {
  python -m venv venv --system-site-packages
  venv/bin/pip install kanalizer pyopenjtalk pyworld
  cd voicevox_engine-${_engine}
  rm -rf resources # avoid build err. Not for production
  python -m build --wheel --no-isolation
}

package() {
  install -d "$pkgdir"/usr/{lib,share/pixmaps}
  tar -xf ${noextract[0]} -C "$pkgdir"/usr/lib VOICEVOX/{resources,vv-engine/{engine_manifest.json,model,resources,libonnxruntime.so,libvoicevox_core.so},README.txt}
  # Use system python
  python -m installer --destdir="$srcdir" voicevox_engine-${_engine}/dist/*.whl; mv usr/lib/python*/site-packages/* -t "$pkgdir"/usr/lib/VOICEVOX/vv-engine
  mv venv/lib/python*/site-packages/{kanalizer,pyopenjtalk,pyworld}* -t "$pkgdir"/usr/lib/VOICEVOX/vv-engine
  mv open_jtalk* -t "$pkgdir"/usr/lib/VOICEVOX/vv-engine/pyopenjtalk
  sed '1c#!/usr/bin/python' voicevox_engine-${_engine}/run.py | install -Dm755 /dev/stdin "$pkgdir"/usr/lib/VOICEVOX/vv-engine/run
  
  chmod 755 -R "$pkgdir"/usr/lib/VOICEVOX # drop this at next rel
  
  ln -sf /usr/lib/7zip/7z "$pkgdir"/usr/lib/VOICEVOX/7zzs
  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  ln -sf /usr/lib/VOICEVOX/vv-engine/resources/engine_manifest_assets/icon.png "$pkgdir"/usr/share/pixmaps/voicevox.png
  # Use system Electron
  sed "s/@ELECTRON@/${_electron}/" voicevox.sh.in | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/voicevox
  install -d "$pkgdir"/usr/lib/$_electron
  ln -sf /usr/lib/VOICEVOX/vv-engine -t "$pkgdir"/usr/lib/$_electron
}
