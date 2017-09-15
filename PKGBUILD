# Maintainer: joho1001 (Josef Hopfgartner) <josef at netzagentur dot at>
pkgname=powa-web-git
_gitname=powa-web
pkgver=de4e2db
pkgrel=1
pkgdesc="postgresql background worker web interface"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dalibo/powa-web"
license=('BSD')
depends=('postgresql' 'python-psycopg2' 'python-tornado' 'python-sqlalchemy')
builddepends=('python-setuptools' 'bower')
makedepends=(git)
options=(!emptydirs !libtool)
source=('git://github.com/dalibo/powa-web.git')
md5sums=('SKIP')
install='powa-web-git.install'

pkgver() {
  cd $_gitname
  tag=`git tag | grep REL | tail -1`
  commit=`git log --format="%h" -n 1`
  echo "$tag_$commit"
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git clean -dfx
  git reset --hard
  python ./setup.py build
}

package() {
  install -D ../powa-web.service "${pkgdir}/usr/lib/systemd/system/powa-web.service"
  cd $srcdir/$_gitname
  python ./setup.py install --root="${pkgdir}" --optimize=1
  install -D powa-web.conf-dist "${pkgdir}/etc/powa-web.conf" 
}
