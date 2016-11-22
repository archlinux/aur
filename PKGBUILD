pkgname=sopel-git
pkgver=6.5.0.r0.gf6315f7
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='http://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-pyenchant' 'python-pygeoip')
makedepends=('git' 'python-sphinx')
checkdepends=('python-pytest' 'ipython')
conflicts=('sopel')
provides=('sopel')
backup=('etc/sopel.cfg')
source=("git+https://github.com/sopel-irc/sopel.git"
         "tmpfiles.d")
md5sums=('SKIP'
         '8442d9ea410e80dfb67f864cc845af1b')
install=install

pkgver() {
  cd $srcdir/sopel
  git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  sed -i 's/requests>.*/requests/' sopel/requirements.txt

  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd sopel
  python setup.py build
  make -C docs man
}

check() {
  cd sopel
  py.test --ignore=sopel.py --ignore=build/
}

package() {
  cd sopel
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/sopel.cfg "$pkgdir/etc/sopel.cfg"
  install -Dm644 contrib/sopel.service "$pkgdir/usr/lib/systemd/system/sopel.service"
  install -Dm644 contrib/sopel.conf "$pkgdir/usr/lib/tmpfiles.d/sopel.conf"
  install -Dm644 docs/build/man/sopel.1 "$pkgdir/usr/share/man/man1/sopel.1"
  
  install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/sopel.conf
  install -dm755 $pkgdir/var/lib/sopel
  install -dm755 $pkgdir/var/log/sopel
}
