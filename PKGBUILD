# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgbase=subliminal-git
pkgname=('python-subliminal-git' 'python2-subliminal-git'
         'nautilus-subliminal-git'
         'python-subliminal-git-docs')
pkgver=1.1.1.r790.615185e
pkgrel=1
epoch=2
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools'
	     'python-sphinx' 'gettext')
#checkdepends=('python2-sympy' 'python-sympy' 'python2-pytest' 'python-pytest'
#	      'python2-mock')
source=("${_gitname}::git+${_gitroot}.git#branch=master"
        'sphinx-manpages.patch')
md5sums=('SKIP'
         'd63a79b506a7d4adea15112fe46f321b')

pkgver() {
  cd ${_gitname}
  printf "1.1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_gitname}
  patch -p1 -i ${srcdir}/sphinx-manpages.patch
}

#check() {
#  cd ${srcdir}/${_gitname}
#  python setup.py test
#  python2 setup.py test
#}

package_python-subliminal-git() {
  depends=(
    'python-beautifulsoup4>=4.2.0' 'python-guessit>=0.9.1' 'python-guessit<2.0'
    'python-requests>=2.0' 'python-enzyme>=0.4.1'
    'python-dogpile.cache>=0.5.4' 'python-click>=4.0'
    'python-pysrt>=1.0.1' 'python-six>=1.9.0'
    'python-babelfish>=0.5.2'
    'python-chardet>=2.3.0' 'python-stevedore>=1.0.0'
  )
  provides=('subliminal-git' 'subliminal')
  conflicts=('subliminal')
  replaces=('subliminal-git')
  install=python-subliminal-git.install
  pkgdesc="Python library and CLI tool for searching and downloading subtitles. (python3 version)"
  optdepends=('python-subliminal-git-docs: package manpages')

  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/subliminal "${pkgdir}"/usr/bin/subliminal3

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python-subliminal-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python-subliminal-git/"
}

package_python2-subliminal-git() {
  depends=(
    'python2-beautifulsoup4>=4.2.0' 'python2-guessit>=0.9.1' 'python2-guessit<2.0'
    'python2-requests>=2.0' 'python2-enzyme>=0.4.1'
    'python2-dogpile.cache>=0.5.4' 'python2-click>=4.0'
    'python2-pysrt>=1.0.1' 'python2-six>=1.9.0'
    'python2-babelfish>=0.5.2'
    'python2-chardet>=2.3.0' 'python2-stevedore>=1.0.0'
  )
  provides=('subliminal-git' 'subliminal')
  conflicts=('subliminal')
  install=python2-subliminal-git.install
  pkgdesc="Python library and CLI tool for searching and downloading subtitles. (python2 version)"
  optdepends=('python-subliminal-git-docs: package manpages')
  
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/subliminal "${pkgdir}"/usr/bin/subliminal2
  install -v -m755 -d "${pkgdir}/usr/share/licenses/python2-subliminal-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python2-subliminal-git/"
}

package_nautilus-subliminal-git() {
  pkgdesc="An extension for Nautilus to download subtitles."
  depends=('subliminal-git' 'python2-nautilus')

  cd ${srcdir}/${_gitname}/examples
  install -v -m755 -d "${pkgdir}/usr/share/nautilus-python/extensions/subliminal/ui"
  install -v -m644 ./nautilus.py "${pkgdir}/usr/share/nautilus-python/extensions/subliminal-nautilus.py"
  install -v -m644 ./ui/{choose,config}.glade "${pkgdir}/usr/share/nautilus-python/extensions/subliminal/ui/"

  mkdir -pv ${pkgdir}/usr/share/locale/{de,es,fr,it,pt_BR,pt,ru,tr}/LC_MESSAGES
  msgfmt ./i18n/de.po -o "${pkgdir}/usr/share/locale/de/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/es.po -o "${pkgdir}/usr/share/locale/es/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/fr.po -o "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/it.po -o "${pkgdir}/usr/share/locale/it/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/pt_BR.po -o "${pkgdir}/usr/share/locale/pt_BR/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/pt.po -o "${pkgdir}/usr/share/locale/pt/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/ru.po -o "${pkgdir}/usr/share/locale/ru/LC_MESSAGES/subliminal.mo"
  msgfmt ./i18n/tr.po -o "${pkgdir}/usr/share/locale/tr/LC_MESSAGES/subliminal.mo"
  
  install -v -m755 -d "${pkgdir}/usr/share/licenses/nautilus-subliminal-git"
  install -v -m644 ../LICENSE "${pkgdir}/usr/share/licenses/nautilus-subliminal-git/"
}

package_python-subliminal-git-docs() {
  pkgdesc="Manpages for Subliminal."

  cd ${srcdir}/${_gitname}/docs
  make man
  install -v -m755 -d "${pkgdir}/usr/share/man/man1"
  install -v -m644 ./_build/man/subliminal.1 "${pkgdir}/usr/share/man/man1/"
}
