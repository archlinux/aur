# Maintainer: David Runge <dvzrv@archlinux.org>

_name=vmprof
pkgname=python-vmprof
pkgver=0.4.15
pkgrel=4
pkgdesc="A statistical program profiler"
arch=(x86_64)
url="https://vmprof.com/#/"
license=(MIT)
depends=(libunwind python python-colorama python-pytz python-requests python-six)
makedepends=(python-setuptools)
checkdepends=(python-cffi python-hypothesis python-pytest)
# tests are not available in pypi sdist
# https://github.com/vmprof/vmprof-python/issues/215
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}-python/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-gcc10.patch::https://github.com/vmprof/vmprof-python/commit/854191e03004.patch"
        "${pkgname}-${pkgver}-pep479.patch"
        "python3.10-no-co_lnotab.patch")
sha512sums=('1815e3310ea83b241514e7773d89f8ee40425119dc7ba195d1fb513596bd63d64ad5d50b0dc0c33e10157469d2d772c5d6435362042971167238ac86f1689b01'
            'fe6eba8adb47c66f4c67d6559a83222e07fde23c75e732961e5e4370dea3fcfbcd1b81522adb37a321e92ba6ad87c58e887e20511c81e20669f39e6e1de87e30'
            'ea085605b70a5cbf3629f5da0401747f1082bd7be3dda21ba036d7444cf48cebd3ad79312d70cd2daff652222f52201d4a4aee40c8c10fd15b7a4bb6ec03aa73'
            '0c169f720c3bd0937fef5a7dc264cad8b32f280bbb1e0c287ae47b784ee1c72c3ff2690ebc98240f0d616d3d9ed54781d01b037dd7c627d5de5a9d7ad6346953')

prepare() {
  mv -v "${_name}-python-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # https://github.com/vmprof/vmprof-python/pull/203
  patch -Np1 -i ../"${pkgname}-${pkgver}-gcc10.patch"
  # fixing PEP479 problems:
  # https://github.com/vmprof/vmprof-python/issues/188
  patch -Np1 -i ../"${pkgname}-${pkgver}-pep479.patch"

  # python 3.10 https://github.com/vmprof/vmprof-python/commit/db1cc42e9f42d464f265f8480f03e3756bd957f2#diff-cc6749fe394944fab6531b387fdd3459827f7c78b7e87f0cb977c4bf231f43de
  patch -Np1 -i ${srcdir}/python3.10-no-co_lnotab.patch
  # fixing TestNative tests:
  # https://github.com/vmprof/vmprof-python/issues/216
  sed -i 's/-Werror/-w/g' vmprof/test/*
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="build/lib.linux-${CARCH}-${python_version}:${PYTHONPATH}"
  pytest -k 'not test_resolve_addr' -v vmprof/test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
