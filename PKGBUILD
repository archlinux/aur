# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Co-Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=vdirsyncer
pkgname=${_pkgname}-git
pkgver=0.19.1.dev3+g2c44f7d
pkgrel=2
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=("BSD")
depends=(
  "python-click<9.0"
  "python-click-log<0.5.0"
  "python-requests-toolbelt"
  "python-atomicwrites"
  "python-aiohttp<4.0.0"
  "python-aiostream<0.5.0"
)
makedepends=(
  "git"
  "python-setuptools-scm"
  "python-sphinx"
  "python-sphinx_rtd_theme"
  python-wheel
  python-build
  python-installer
)
checkdepends=(
  "python-hypothesis<7.0.0"
  "python-pytest-httpserver"
  "python-trustme"
  "python-pytest-asyncio"
  "python-aioresponses"
  "python-pytest-cov"
)
optdepends=(
  "python-aiohttp-oauthlib: Google support"
)
source=("git+https://github.com/pimutils/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=("vdirsyncer")
provides=("vdirsyncer=${pkgver}")

pkgver() {
  cd "$srcdir/$_pkgname"
  python -m setuptools_scm 2> /dev/null
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --skip-dependency-check --no-isolation

  export PYTHONPATH="build:${PYTHONPATH}"
  sphinx-build -b man docs/ build/
}

check(){
  cd "${srcdir}/${_pkgname}"

  export DETERMINISTIC_TESTS=true
  python -m pytest --tb=short -c /dev/null
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # systemd
  install -vDm 644 "contrib/${_pkgname}."{service,timer} -t "${pkgdir}/usr/lib/systemd/user/"
  # man page
  install -vDm 644 "build/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  # docs
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst -t "${pkgdir}/usr/share/doc/${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
