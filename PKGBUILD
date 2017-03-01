# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=vdirsyncer
pkgname=${_pkgname}-git
pkgver=0.15.0.r0.g968b416
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('i686' 'x86_64')
url="https://github.com/pimutils/${_pkgname}"
license=('MIT')
depends=("python-click>=5.0" "python-click-log>=0.1.3" "python-click-threading>=0.2"
         "python-requests>2.9.0" "python-requests-toolbelt>=0.4.0"
         "python-atomicwrites>=0.1.7"
         "python-requests-oauthlib"
         "python-keyring")
makedepends=("git" "python-setuptools-scm"
             "python-sphinx" 'python-sphinx_rtd_theme')
checkdepends=("python-hypothesis>=3.1"
              "python-pytest" "python-pytest-localserver" "python-pytest-subtesthack")
source=("git://github.com/pimutils/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('vdirsyncer')
provides=("vdirsyncer=${pkgver}")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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

  make test
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/_build/man/${_pkgname}.1 \
    "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
