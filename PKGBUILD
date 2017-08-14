# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgname=subliminal-develop-git
pkgver=2.0.5.r39.g2c34541
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles (develop branch)."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>2.0.1'
         'python-babelfish>=0.5.2'
         'python-enzyme>=0.4.1'
         'python-beautifulsoup4>=4.2.0'
         'python-requests>=2.0'
         'python-click>=4.0'
         'python-dogpile.cache>=0.6.0'
         'python-stevedore>=1.0.0'
         'python-chardet>=2.3.0'
         'python-pysrt>=1.0.1'
         'python-six>=1.9.0'
         'python-appdirs>=1.3'
         'python-rarfile>=2.7'
         'python-pytz>=2012c')
makedepends=('git'
             'python-setuptools'
             'python-sphinx'
             'python-sphinxcontrib-programoutput')
provides=('subliminal-git' 'subliminal' 'subliminal-git-doc')
conflicts=('subliminal' 'subliminal-git')
replaces=('subliminal' 'subliminal-git')
source=("${_gitname}::git+${_gitroot}.git#branch=develop"
        'sphinx-manpages.patch')
md5sums=('SKIP'
         'd63a79b506a7d4adea15112fe46f321b')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${_gitname}
  patch -p1 -i ${srcdir}/sphinx-manpages.patch
}

build() {
  cd ${srcdir}/${_gitname}/docs
  make man
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root="${pkgdir}/" --optimize=1
  ln -s /usr/bin/subliminal "${pkgdir}"/usr/bin/subliminal3

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python-subliminal-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python-subliminal-git/"

  install -v -m755 -d "${pkgdir}/usr/share/man/man1"
  install -v -m644 docs/_build/man/subliminal.1 "${pkgdir}/usr/share/man/man1/"
}
