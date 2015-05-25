# $Id$
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Tianjiao Yin <ytj000+AUR@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: TDY <tdy@gmx.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>

pkgbase=python-pyflakes-git
pkgname=(python-pyflakes-git python2-pyflakes-git)
_reponame=pyflakes
pkgver=0.8.1.r35.g03ffc76
pkgrel=1
pkgdesc='A lint-like tool for Python to identify common errors quickly without executing code (Git version)'
arch=('any')
url='http://pypi.python.org/pypi/pyflakes'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_reponame}"::"git+https://github.com/pyflakes/pyflakes/")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cp -r "$srcdir/${_reponame}"{,-py2}
}

build() {
  cd "$srcdir/${_reponame}"
  python setup.py build

  cd "$srcdir/${_reponame}-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/${_reponame}"
  python setup.py test

  cd "$srcdir/${_reponame}-py2"
  python2 setup.py test
}

package_python-pyflakes-git() {
  depends=('python-setuptools')
  provides=(python-pyflakes)
  conflicts=(python-pyflakes)

  cd "${_reponame}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  # We have python 3 as default python, and want to keep compatibility with the old pyflakes3k naming
  ln -s pyflakes "${pkgdir}/usr/bin/pyflakes3k"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pyflakes-git() {
  depends=('python2-setuptools')
  provides=(python2-pyflakes)
  conflicts=(python2-pyflakes)

  cd "${_reponame}-py2"

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  mv "${pkgdir}/usr/bin/pyflakes" "${pkgdir}/usr/bin/pyflakes-python2"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
