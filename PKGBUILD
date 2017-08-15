# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Richard Murri <admin@richardmurri.com>
# Contributor: Farhad Shahbazi <farhad@enthusiasm.cc>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgbase=python-bottle-git
pkgname=("python-bottle-git" "python2-bottle-git")
pkgver=0.11.1.r668.g13eb839
pkgrel=1
pkgdesc="A fast and simple micro-framework for small web-applications"
arch=(any)
url="http://bottlepy.org"
license=('MIT')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-mako' 'python2-mako' 'python-jinja' 'python2-jinja' 'python-cherrypy'
              'python2-cherrypy' 'python-twisted' 'python2-twisted' 'python-tornado'
              'python2-tornado' 'python-paste' 'python2-paste' 'python-gevent' 'python2-gevent'
              'python-eventlet' 'python2-eventlet')
source=("git+https://github.com/defnull/bottle.git")
sha512sums=('SKIP')

pkgver() {
   cd "bottle"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a bottle{,-py2}
  sed -i "1s/python/python2/" bottle-py2/bottle.py
}

check() {
  cd "$srcdir/"bottle
  # https://github.com/bottlepy/bottle/issues/791
  python test/testall.py || warning 'Tests failed'

  cd "$srcdir/"bottle-py2
  python2 test/testall.py
}

package_python-bottle-git() {
  depends=('python')
  provides=('python-bottle')
  conflicts=('python-bottle')

  cd bottle
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-bottle-git() {
  depends=('python2')
  provides=('python2-bottle')
  conflicts=('python2-bottle')

  cd bottle-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # deal with conflict with python-bottle's /usr/bin/bottle.py
  mv "$pkgdir"/usr/bin/bottle.py{,2}
}
