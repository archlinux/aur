pkgname=audiomuse-ai-worker
pkgver=3.6.0
pkgrel=6
pkgdesc='AudioMuse-AI analysis and task queue worker'
arch=('x86_64')
url='https://github.com/NeptuneHub/AudioMuse-AI'
license=('AGPL-3.0-only')

depends=(
  'audiomuse-ai-clap-text-model'
  'audiomuse-ai-gte-model'
  'silero-vad-onnx-model'

  'chromaprint'
  'ffmpeg'
  'supervisor'

  'python'
  'python-argon2-cffi'
  'python-av'
  'python-cryptography'
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
  'python-onnxruntime'
  'python-psutil'
  'python-psycopg2'
  'python-pyjwt'
  'python-rapidfuzz'
  'python-requests'
  'python-scikit-learn'
  'python-scipy'
  'python-soundfile'
  'python-soxr'
  'python-sqlglot'
  'python-tokenizers'
  'python-transformers'
  'python-umap-learn'
  'python-wn'
  'python-yaml'
  'python-zstandard'
)

optdepends=(
  'audiomuse-ai-whisper-model: tested Whisper-small ONNX export for lyrics transcription; alternatively configure LYRICS_WHISPER_MODEL_DIR to another compatible export'
  'audiomuse-ai-neural-fingerprint: neural fingerprints and Search by Recording'
  'postgresql: local PostgreSQL server; not required when using a remote database'
  'python-google-genai: Gemini AI provider'
  'python-mistralai: Mistral AI provider'
  'python-matplotlib: spectrum_analyzer plugin'
  'python-onnxruntime-cuda: NVIDIA CUDA acceleration for ONNX inference'
)

install='audiomuse-ai-worker.install'

backup=(
  'etc/audiomuse-ai/worker.env'
  'etc/audiomuse-ai/worker-supervisord.conf'
)

_model_tag='v5.0.0-model'
_dclap_tag='v1'

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"

  "musicnn_embedding.onnx::$url/releases/download/$_model_tag/musicnn_embedding.onnx"
  "musicnn_prediction.onnx::$url/releases/download/$_model_tag/musicnn_prediction.onnx"

  "model_epoch_36.onnx::https://github.com/NeptuneHub/AudioMuse-AI-DCLAP/releases/download/$_dclap_tag/model_epoch_36.onnx"
  "model_epoch_36.onnx.data::https://github.com/NeptuneHub/AudioMuse-AI-DCLAP/releases/download/$_dclap_tag/model_epoch_36.onnx.data"

  'swagger-compat.py'
  'roberta-tokenizer-compat.patch'
  'remove-flasgger.patch'
  'plugin-system-python-deps.patch'
  'audiomuse-ai-worker.service'
  'audiomuse-ai-worker-tmp.mount'
  'audiomuse-ai-worker.supervisord.conf'
  'audiomuse-ai-worker.sysusers'
  'audiomuse-ai-worker.tmpfiles'
  'worker.env'
)

sha256sums=('e6d10aa26820a7589f6512123d8868c26be617b08b2bac4542e387ff5921e0f4'
            'a48ad887950a557aefbb4dcddf58ad4802213ff5fc6fb51eda3507cd797bb9b0'
            '0d4e78dd43c610aec88c099e41f4a8969797da5ac2612ea6ca21faa9e1a428f3'
            '17860403f8fc90aff8ac0632a0741eb5e58d8c0b0ad2fce5ced967274b0ea971'
            '2a735b23c2aad7b12d9ffc85334cebcc659c07696d2ff60e2e378da28b6df657'
            'eefb4cee2ece6c81b0b37969462929156b035a66071faaafc1fcf9626dcc4b21'
            '7aea2aeb6bec2e1a97b778c09190f787b7466a3b041306765b6812edef1817cd'
            '773c336c3fbdc1ed74ea1f7a23d7c518e8071517789a47d4e8dc7ff7ee543622'
            '31f18db3e5ad6729f990234ab9ba904c349c28db23ae1b6bf22411f425fba8fc'
            '2c00bea3125ff5577c1f8d90806adc798489ed2fe54ee8e5bd78b39d00534400'
            '24744c8f628b6aadaef63b928d57446db5e80f55ae0312e2aafc75fefaac0a36'
            'cc4b4f32e7b7f1f5a4fc7fa4b949ab603f7a863ec8183dc339aefa0272da9228'
            '1b6dac9d5528b4eeb16008bc5e988492a80b9d35ceb4640247bdb3331b1d191a'
            '7e036273d925175f889a972fe6c18120d4bdc57251090aa4022b120361ca302c'
            '09e6eb1f58a51a6daeca68ff8309c1dbee6e03e72101258100b81137da2256f6')

prepare() {
  cd "AudioMuse-AI-$pkgver"

  patch -Np1 -i "$srcdir/roberta-tokenizer-compat.patch"
  patch -Np1 -i "$srcdir/remove-flasgger.patch"
  patch -Np1 -i "$srcdir/plugin-system-python-deps.patch"

  rm -f \
    app.py.orig \
    app_chat.py.orig \
    app_sync.py.orig
}

package() {
  local _src="$srcdir/AudioMuse-AI-$pkgver"
  local _app="$pkgdir/usr/lib/audiomuse-ai-worker"
  local _models="$pkgdir/usr/share/audiomuse-ai/worker"

  install -d "$_app"
  cp -a "$_src/." "$_app/"

  rm -rf \
    "$_app/.github" \
    "$_app/test" \
    "$_app/screenshot" \
    "$_app/native-build" \
    "$_app/docs"

  rm -f \
    "$_app/Dockerfile" \
    "$_app/Dockerfile-noavx2" \
    "$_app/docker-compose.yml"

  install -m644 "$srcdir/swagger-compat.py" \
    "$_app/swagger_compat.py"

  install -d "$_models"

  install -m644 "$srcdir/musicnn_embedding.onnx" \
    "$_models/musicnn_embedding.onnx"

  install -m644 "$srcdir/musicnn_prediction.onnx" \
    "$_models/musicnn_prediction.onnx"

  install -m644 "$srcdir/model_epoch_36.onnx" \
    "$_models/model_epoch_36.onnx"

  install -m644 "$srcdir/model_epoch_36.onnx.data" \
    "$_models/model_epoch_36.onnx.data"

  install -Dm644 "$srcdir/audiomuse-ai-worker.service" \
    "$pkgdir/usr/lib/systemd/system/audiomuse-ai-worker.service"

  install -Dm644 "$srcdir/audiomuse-ai-worker.supervisord.conf" \
    "$pkgdir/etc/audiomuse-ai/worker-supervisord.conf"

  install -Dm640 "$srcdir/worker.env" \
    "$pkgdir/etc/audiomuse-ai/worker.env"

  install -Dm644 "$srcdir/audiomuse-ai-worker.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/audiomuse-ai-worker.conf"

  install -Dm644 "$srcdir/audiomuse-ai-worker.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/audiomuse-ai-worker.conf"

  install -Dm644 \
    "${srcdir}/audiomuse-ai-worker-tmp.mount" \
    "${pkgdir}/usr/lib/systemd/system/var-tmp-audiomuse\\x2dai\\x2dworker.mount"
}
