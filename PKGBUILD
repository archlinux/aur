# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgname=subliminal-git
pkgver=2.0.5.r1.gdd74383
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=( 'python-guessit>2.0.1'
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
          'python-pytz>=2012c'
)
makedepends=('git' 'python-setuptools'
             'python-sphinx' 'python-sphinxcontrib-programoutput')

provides=('subliminal-git' 'subliminal' 'subliminal-git-doc')
conflicts=('subliminal')
replaces=('subliminal-git')
install=subliminal-git.install
pkgdesc="Python library and CLI tool for searching and downloading subtitles. (python3 version)"
source=("${_gitname}::git+${_gitroot}.git#branch=master"
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
  mv "${pkgdir}"/usr/bin/subliminal "${pkgdir}"/usr/bin/subliminal3

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python-subliminal-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python-subliminal-git/"

  install -v -m755 -d "${pkgdir}/usr/share/man/man1"
  install -v -m644 docs/_build/man/subliminal.1 "${pkgdir}/usr/share/man/man1/"
}

