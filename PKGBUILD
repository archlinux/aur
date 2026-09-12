pkgname=audiomuse-ai-web
pkgver=3.6.0
pkgrel=1
pkgdesc='Web interface and API for AudioMuse-AI'
arch=('x86_64')
url='https://github.com/NeptuneHub/AudioMuse-AI'
license=('AGPL-3.0-only')

depends=(
  'audiomuse-ai-clap-text-model'
  'audiomuse-ai-gte-model'

  'gunicorn'
  'supervisor'

  'python'
  'python-argon2-cffi'
  'python-av'
  'python-cryptography'
  'python-flatbuffers'
  'python-flask'
  'python-flask-cors'
  'python-ftfy'
  'python-httpx'
  'python-huggingface-hub'
  'python-langdetect'
  'python-librosa'
  'python-numba'
  'python-numpy'
  'python-onnx'
  'python-onnxruntime-cpu'
  'python-packaging'
  'python-protobuf'
  'python-psutil'
  'python-psycopg2'
  'python-pyjwt'
  'python-rapidfuzz'
  'python-requests'
  'python-scikit-learn'
  'python-scipy'
  'python-six'
  'python-soundfile'
  'python-soxr'
  'python-sqlglot'
  'python-sympy'
  'python-tokenizers'
  'python-transformers'
  'python-umap-learn'
  'python-wn'
  'python-yaml'
  'python-zstandard'
)

optdepends=(
  'audiomuse-ai-neural-fingerprint: enable Search by Recording'
  'postgresql: local PostgreSQL server; unnecessary when using a remote PostgreSQL server'
  'python-google-genai: Gemini AI provider'
  'python-mistralai: Mistral AI provider'
  'python-numkong: accelerate quantized IVF distance scans; NumPy fallback is used otherwise'
)

install='audiomuse-ai-web.install'

backup=(
  'etc/audiomuse-ai/web.env'
)

_sae_tag='v1'

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "dclap-sae-encoder-$pkgver.onnx::https://github.com/NeptuneHub/AudioMuse-AI-SAE/releases/download/$_sae_tag/dclap_sae_k20_d1024_best_encoder.onnx"
  "dclap-sae-decoder-$pkgver.onnx::https://github.com/NeptuneHub/AudioMuse-AI-SAE/releases/download/$_sae_tag/dclap_sae_k20_d1024_best_decoder.onnx"
  'swagger-compat.py'
  'roberta-tokenizer-compat.patch'
  'no-flasgger.patch'
  'audiomuse-ai-web.service'
  'audiomuse-ai-web.supervisord.conf'
  'audiomuse-ai-web.sysusers'
  'audiomuse-ai-web.tmpfiles'
  'web.env'
)

sha256sums=('e6d10aa26820a7589f6512123d8868c26be617b08b2bac4542e387ff5921e0f4'
            'd81723cc7d14566057e8b199f2bc4ea3ea1e2ca7a79529a40f3fcd5399f976f6'
            '7b16ee06c79810664aea026e2b6d29b65db68d756d87bee88a855a1e2cffcbf6'
            'eefb4cee2ece6c81b0b37969462929156b035a66071faaafc1fcf9626dcc4b21'
            '7aea2aeb6bec2e1a97b778c09190f787b7466a3b041306765b6812edef1817cd'
            'a303790466768dd31acef4e092a672b4bcaa7e6a39fe85a3f998895f0cca5db2'
            '0a75a10f48565b85dc95b265a341fb44b9b0106021007af39528c944510ff337'
            '5544adb5ab11efb7f49fdd9823ed7bbda57816c91d493c25b3ff74ba28f631ab'
            '9344589685639d833e4c405013172119f4e1929ed78d9a223886e55b3d96a676'
            'f2a4370ba7ced81b39a583a583684b8623e083eb0943f9b1b604a5913dc16f24'
            'ffb4733cd782ff70404caa3277fa0f3026782799264f6ad68eab3c68bd22dac5')

prepare() {
  cd "AudioMuse-AI-$pkgver"
  patch -Np1 -i "$srcdir/roberta-tokenizer-compat.patch"
  patch -Np1 -i "$srcdir/no-flasgger.patch"
}

package() {
  local _src="$srcdir/AudioMuse-AI-$pkgver"
  local _app="$pkgdir/usr/lib/audiomuse-ai-web"
  local _models="$pkgdir/usr/share/audiomuse-ai/web"

  install -d "$_app"
  cp -a "$_src/." "$_app/"

  rm -rf \
    "$_app/.github" \
    "$_app/native-build" \
    "$_app/screenshot" \
    "$_app/test"

  install -Dm644 "$srcdir/swagger-compat.py" \
    "$_app/swagger_compat.py"

  install -Dm644 "$srcdir/dclap-sae-encoder-$pkgver.onnx" \
    "$_models/dclap_sae_k20_d1024_best_encoder.onnx"

  install -Dm644 "$srcdir/dclap-sae-decoder-$pkgver.onnx" \
    "$_models/dclap_sae_k20_d1024_best_decoder.onnx"

  install -Dm644 "$srcdir/audiomuse-ai-web.service" \
    "$pkgdir/usr/lib/systemd/system/audiomuse-ai-web.service"

  install -Dm644 "$srcdir/audiomuse-ai-web.supervisord.conf" \
    "$pkgdir/etc/audiomuse-ai/web-supervisord.conf"

  install -Dm640 "$srcdir/web.env" \
    "$pkgdir/etc/audiomuse-ai/web.env"

  install -Dm644 "$srcdir/audiomuse-ai-web.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/audiomuse-ai-web.conf"

  install -Dm644 "$srcdir/audiomuse-ai-web.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/audiomuse-ai-web.conf"
}
