# Maintainer: Jose Lopes <josemslopes at gmail dot com>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=python-formencode
_pkgname=formencode
_pypi=FormEncode
pkgver=2.1.0
pkgrel=4
pkgdesc="A validation library for Python."
arch=("any")
url="http://www.formencode.org/en/latest/"
license=("MIT")
depends=("python")
checkdepends=("python-pytest" "python-dnspython" "python-pycountry")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/formencode/formencode/archive/$pkgver.tar.gz"
# https://github.com/formencode/formencode/commit/43edbb5fd007ff352a6b75719aee466ae916dbab
  "support_python3.13.patch"
)
sha256sums=(
  'a7b2ba2197e90c8f167cebb73c479921fcbadff7863cb504996af6ff44c4bed5'
  '87a5e96089038e00c1dd47d962a7c9ec14aeaeadee97841b86af61cd1a59674f'
)

prepare() {
  cd "${_pkgname}-${pkgver}"
  sed '/setuptools_scm_git_archive/d' -i setup.py 

  patch -p1 -i "${srcdir}/support_python3.13.patch"
  echo "-----------------------------------------"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check(){
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages" 
  PYTHONDONTWRITEBYTECODE=1 python -m unittest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
