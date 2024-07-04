# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-open-unmix-pytorch
_gitpkgname=open-unmix-pytorch
pkgver=1.3.0
pkgrel=2
pkgdesc='PyTorch implementation of Open-Unmix, a music source separation toolkit'
arch=('any')
url='https://github.com/sigsep/open-unmix-pytorch'
license=('MIT')
depends=(
  'python'
  'python-numpy<2'  # https://gitlab.archlinux.org/archlinux/packaging/packages/tensorflow/-/issues/9
  'python-pytorch'
  'python-torchaudio'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pdoc'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=(
  'asteroid-filterbanks'
  'onnx'
  'open-unmix-umx-weights'
  'open-unmix-umxhq-weights'
  'open-unmix-umxl-weights'
  'open-unmix-umxse-weights'
  'python-musdb'
  'python-museval'
  'python-pytest'
)
optdepends=(
  'asteroid-filterbanks: support for exporting short-time Fourier transform results'
  'open-unmix-umx-weights: UMX, a music separation model trained on MUSDB18'
  'open-unmix-umxhq-weights: UMX-HQ, a music separation model trained on MUSDB18-HQ'
  'open-unmix-umxl-weights: UMX-L, a music separation model trained on a private dataset'
  'open-unmix-umxse-weights: UMX-SE, a speech enhancement model trained on the 28-speaker version of Voicebank+Demand'
  'python-musdb: enable the built-in trainer to use the MUSDB dataset'
  'python-museval: to use the evaluate.py script'
  # The python-stempeg dependency does nothing, because torchaudio no longer supports setting a global backend
  # 'python-stempeg'
)
provides=('python-open-unmix')
conflicts=('python-open-unmix')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/sigsep/open-unmix-pytorch/archive/v${pkgver}.tar.gz"
  'use-packaged-weights.patch'
)

sha512sums=(
  'bb0f4069be17500907b1e496cfe7e3d77914aea66df7d40bd19be932f2b12160390ca36709233b99758ac19deef9dad9de1a24f3e3a88eee9253158fdcdbf3f2'
  'bcb47cfbf878ee22d1e3246de485ff8ba9a0d4c331ff6048bc4bb4c14b2cef0ab89ab41d38da97a3e6c5f1c4c93d14bd662498a8bc9fc660ab187d1bb9db1c9f'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Adding support for packaged weights'
  patch -p1 < ../use-packaged-weights.patch
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  pdoc --template-dir pdoc -o docs openunmix
}

check() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Running unit tests'
  # Excluded tests
  # - sourcefolder: missing dataset
  # - trackfolder: missing dataset
  pytest -k 'not sourcefolder and not trackfolder'
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/html"
  cp -R --preserve=mode -T docs \
    "${pkgdir}/usr/share/doc/${pkgname}/html"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
