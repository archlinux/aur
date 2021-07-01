# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Co-Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=vdirsyncer
pkgname=${_pkgname}-git
pkgver=0.18.1.dev33+g21db254
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=("BSD")
depends=(
  "python-click<9.0"
  "python-click-log<0.4.0"
  "python-requests-toolbelt"
  "python-atomicwrites"
  "python-aiohttp<4.0.0"
  "python-aiostream<0.5.0"
)
makedepends=("git"
             "python-setuptools-scm"
             "python-sphinx"
             "python-sphinx_rtd_theme")
checkdepends=(
  "python-hypothesis<7.0.0"
  "python-pytest-httpserver"
  "python-trustme"
  "python-pytest-asyncio"
  "python-aioresponses"
)
source=("git+https://github.com/pimutils/${_pkgname}.git")
sha256sums=("SKIP")
conflicts=("vdirsyncer")
provides=("vdirsyncer=${pkgver}")

pkgver() {
  cd "$srcdir/$_pkgname"
  python setup.py --version
}

build() {
  # Build vdirsyncer
  cd "${srcdir}/${_pkgname}"
  python setup.py build

  # "Install" development stuff needed to build the man page
  rm -rf "${srcdir}/develop"
  mkdir "${srcdir}/develop"
  export PYTHONPATH="${srcdir}/develop":${PYTHONPATH}
  python setup.py develop --install-dir="${srcdir}/develop/"

  # Build man page
  cd "${srcdir}/${_pkgname}/docs"
  make man SPHINXBUILD=sphinx-build
}

check(){
  cd "${srcdir}/${_pkgname}"

  # When using a clean chroot,
  # one has to choose a proper locale to run the tests
  if [ "${LANG}" == "C" ]
  then
    export LANG=$(locale -a | grep utf8 | head -n1)
  fi

  make DETERMINISTIC_TESTS=true test
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "contrib/vdirsyncer.service" "$pkgdir/usr/lib/systemd/user/vdirsyncer.service"
  install -Dm 644 "contrib/vdirsyncer.timer" "$pkgdir/usr/lib/systemd/user/vdirsyncer.timer"
  install -Dm644 docs/_build/man/${_pkgname}.1 \
    "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
