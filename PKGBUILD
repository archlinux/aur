# Maintainer: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

_pkgname=python-pipenv
pkgname=$_pkgname-git
pkgver=v2018.11.26.r612.gf4b66a77
pkgrel=2
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
source=("${_pkgname}::git+https://github.com/pypa/pipenv.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
