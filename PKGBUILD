# Maintainer: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

_pkgname=python-pipenv
pkgname=$_pkgname-git
pkgver=v2018.11.26.r218.gd5e446ee
pkgrel=1
pkgdesc="Sacred Marriage of Pipfile, Pip, & Virtualenv."
url="https://docs.pipenv.org"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
conflicts=($_pkgname)
provides=($_pkgname)
#checkdepends=('python-pytest' 'python-pytest-runner'
#	      'python-pip' 'python-certifi' 'python-virtualenv'
#	      'python-virtualenv-clone' 'python-strict-rfc3339'
#	      'python-pytz' 'python-flaky' 'python-mock')
source=("${_pkgname}::git+https://github.com/pypa/pipenv.git"
        "0001-setup-don-t-setup_requires-on-things-used-to-run-dev.patch")
sha256sums=('SKIP'
            '50c9482911eb7d12bdce45b5e5a44efd4223d3d4a908c42b265d04ab58064e1f')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -p1 -d "$srcdir/$_pkgname" < 0001-setup-don-t-setup_requires-on-things-used-to-run-dev.patch
}

build(){
  cd "$srcdir/$_pkgname"
  python setup.py build
}

#check(){
#  cd "$srcdir/pipenv-$pkgver"
#  python setup.py pytest
#}

package() {
  depends=('python' 'python-pip' 'python-pew' 'python-virtualenv'
  	   'python-setuptools' 'python-virtualenv-clone' 'python-certifi')
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  PIPENV_SHELL=bash python -m pipenv --completion | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pipenv"
  PIPENV_SHELL=zsh  python -m pipenv --completion | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_pipenv"
  PIPENV_SHELL=fish python -m pipenv --completion | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/pipenv.fish"
}
