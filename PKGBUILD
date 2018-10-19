# Maintainer: TC <crt@archlinux.email>
_pkgname=automx
pkgname=$_pkgname-git
pkgver=v1.1.1.13.g4aee43f
pkgrel=1
pkgdesc="automx makes setting up a mail account easy by handling mail account profile requests from your mail clients"
arch=('any')
url="https://automx.org"
license=('GPL3')
depends=('mod_wsgi' 'python-dateutil' 'python-ipaddress' 'python-lxml' 'python-ldap' 'python-m2crypto')
makedepends=('git' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=automx.install
options=('emptydirs')
source=("$_pkgname::git+https://github.com/sys4/automx.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"

  # Create automx lib directory
  install -D -d -m755 "$pkgdir/usr/lib/$_pkgname"
  # Create dependency directory
  install -D -d -m755 "$pkgdir/usr/lib/python3.7/$_pkgname"
  # Install automx_wsgi.py to automx lib directory
  install -D -m755 src/automx_wsgi.py "$pkgdir/usr/lib/$_pkgname/automx_wsgi.py"
  # Update permissions for httpd
  chown -R http:http "$pkgdir/usr/lib/$_pkgname"
  # Install python dependencies
  install -D -m644 "src/$_pkgname/config.py" "$pkgdir/usr/lib/python3.7/$_pkgname/config.py"
  install -D -m644 "src/$_pkgname/__init__.py" "$pkgdir/usr/lib/python3.7/$_pkgname/__init__.py"
  install -D -m644 "src/$_pkgname/view.py" "$pkgdir/usr/lib/python3.7/$_pkgname/view.py"
  # Install automx-test
  install -D -m755 "src/automx-test" "$pkgdir/usr/bin/automx-test"
  # Install man pages
  install -D -m644 "doc/man/man1/automx-test.1" "$pkgdir/usr/local/man/man1/automx-test.1"
  install -D -m644 "doc/man/man5/automx.conf.5" "$pkgdir/usr/local/man/man5/automx.conf.5"
  install -D -m644 "doc/man/man5/automx_ldap.5" "$pkgdir/usr/local/man/man5/automx_ldap.5"
  install -D -m644 "doc/man/man5/automx_script.5" "$pkgdir/usr/local/man/man5/automx_script.5"
  install -D -m644 "doc/man/man5/automx_sql.5" "$pkgdir/usr/local/man/man5/automx_sql.5"
  # Install conf files
  install -D -d -m755 "$pkgdir/usr/share/$_pkgname/conf"
  install -D -m644 "src/conf/apache.conf.example" "$pkgdir/usr/share/$_pkgname/conf/"
  install -D -m644 "src/conf/automx.conf" "$pkgdir/usr/share/$_pkgname/conf/" 
  install -D -m644 "src/conf/automx.conf.example-complex" "$pkgdir/usr/share/$_pkgname/conf/"
  install -D -m644 "src/conf/nginx-automx.conf" "$pkgdir/usr/share/$_pkgname/conf/"
  # Install automx BASIC_CONFIGURATION_README and INSTALL docs
  install -D -m644 "BASIC_CONFIGURATION_README" "$pkgdir/usr/share/docs/$_pkgname/"
  install -D -m644 "INSTALL" "$pkgdir/usr/share/docs/$_pkgname/"
  # Install license
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
