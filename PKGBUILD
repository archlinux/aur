# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=deadlink
pkgdesc="Check and fixes URLs in text files"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${pkgname}"
license=(MIT)
depends=(python-appdirs python-httpx python-rich python-toml)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6a9ef13ef43ebe38a17ec2656f65c23f75f20bc5bf549cc69495c83978e1c377ee0ea233d569e152cecc9379f2a18e6c4de13a92e801e95753dea33da11fb598')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  chmod +x test-env/bin/${pkgname}
  PATH="${PWD}/test-env/bin:$PATH" test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
