# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-diffq
_gitpkgname=diffq
pkgver=0.2.4
pkgrel=2
pkgdesc='Differentiable quantization using pseudo quantization noise'
arch=('x86_64')
url='https://github.com/facebookresearch/diffq'
license=('CC-BY-NC-4.0')
depends=(
  'glibc'
  'python'
  'python-numpy'
  'python-pytorch'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-pdoc'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-torchvision'
)
optdepends=(
  'python-einops: to run the included cifar example'
  'python-hydra-colorlog: to run the included cifar example'
  'python-hydra-core: to run the included cifar example'
  'python-submitit: to run the included cifar example'
  'python-timm: to run the included cifar example'
  'python-torchvision: to run the included cifar example'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/diffq/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '0b47058c19e0ce841889c1f47b266cc292044d5483e7aa3f757bb5d050f48cdde10547b5ce7df654e54ee47271d566f24b667e228bbc20035e2345290eb06512'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Fixing circular imports in unit tests'
  mkdir tmp_test
  mv -v diffq/tests tmp_test/tests
  find tmp_test/tests -name '*.py' -exec sed -i -e 's/diffq\.\(tests\)/\1/' '{}' +

  echo >&2 'Fixing type mismatch in the bitpack.pack() call'
  sed -i -e 's/\(pack_fn(.*, \)\(self\.bits\)/\1int(\2)/' \
    diffq/uniform.py
}

_site_packages() {
  python -c 'import site; print(site.getsitepackages()[0])'
}

build() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="${PWD}/tmp_install/$(_site_packages)" \
    pdoc -o docs diffq
}

check() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Running unit tests'
  env -C tmp_test PYTHONPATH="${PWD}/tmp_install/$(_site_packages)" \
    python -m unittest discover
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
