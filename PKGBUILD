# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Co-Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=vdirsyncer
pkgname=${_pkgname}-git
pkgver=0.19.0b2.dev1+g84613e7
pkgrel=1
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

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "contrib/vdirsyncer.service" "$pkgdir/usr/lib/systemd/user/vdirsyncer.service"
  install -Dm 644 "contrib/vdirsyncer.timer" "$pkgdir/usr/lib/systemd/user/vdirsyncer.timer"
  install -Dm644 docs/_build/man/${_pkgname}.1 \
    "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
