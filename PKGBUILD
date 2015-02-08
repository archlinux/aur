# Maintainer: Étienne Deparis <etienne [at] depar [dot] is>
# Contributor: eolianoe <eolianoe [at] googlemail [dot] com>

pkgname=khal-git
_gitname=khal
pkgver=0.5.0.r5.g09362ae
pkgrel=1
pkgdesc="Command line CalDav client"
license=("MIT")
url="http://lostpackets.de/khal/"
# python2-click, python2-icalendar come with the python2-vdirsyncer dependancy
# python2-pytz comes with the python2-icalendar dependancy
depends=('python2-urwid' 'python2-xdg' 'python2-vdirsyncer'
         'python2-dateutil' 'python2-configobj' 'python2-tzlocal'
         'sqlite')
# Doesn't seems to be useful anymore...
# python2-requests' 'python2-certifi')
makedepends=('python2-setuptools' 'git' 'python2-sphinxcontrib-newsfeed')
source=("${_gitname}::git+https://github.com/geier/khal.git")
md5sums=('SKIP')
install='khal.install'
provides=('khal')
conflicts=('khal')
arch=('any')
options=(!emptydirs)

pkgver() {
  cd "$srcdir/${_gitname}"
  MAJOR=`sed -n "s/MAJOR\s\?=\s\?\(\d*\)/\1/p" version.py`
  MINOR=`sed -n "s/MINOR\s\?=\s\?\(\d*\)/\1/p" version.py`
  PATCH=`sed -n "s/PATCH\s\?=\s\?\(\d*\)/\1/p" version.py`
  GITVER=`git describe --always --dirty --tags | cut -d- -f2- | sed -r 's/([^-]*-g)/r\1/;s/-/./g'`

  echo "${MAJOR}.${MINOR}.${PATCH}.${GITVER}"
}

build(){
  cd "$srcdir/${_gitname}/doc"
  # Fix to use python2
  sed -i  's/sphinx-build/sphinx-build2/g' Makefile
  sed -i  's/python/python2/' source/generate_config.py
  sed -i  's/python/python2/' source/Makefile

  make man
}

package() {
  cd "$srcdir/${_gitname}/"
  python2 setup.py install --root=$pkgdir

  install -D -m644 khal.conf.sample "${pkgdir}/etc/skel/khal.conf"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/khal/LICENSE"
  install -D -m644 AUTHORS.txt "${pkgdir}/usr/share/licenses/khal/AUTHORS"

  install -D -m644 doc/build/man/khal.1 "${pkgdir}/usr/share/man/man1/khal.1"

  # You can comment the following to disable zsh completion (if you do
  # not plan to use zsh for example)
  install -D -m644 misc/__khal "${pkgdir}/usr/share/zsh/site-functions/_khal"
}
