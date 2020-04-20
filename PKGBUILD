# Maintainer: AK <crt@archlinux.email>
pkgname=automx
pkgver=v1.1.1.13.g4aee43f
pkgrel=2
pkgdesc="automx makes setting up a mail account easy by handling mail account profile requests from your mail clients"
arch=('any')
url="https://automx.org"
license=('GPL3')
depends=('python-dateutil' 'python-ipaddress' 'python-lxml' 'python-m2crypto')
optdepends=('python-ldap: LDAP backend support'
            'python-sqlalchemy: SQL backend support'
            'mod_wsgi: Apache support'
            'uwsgi: Nginx support')
makedepends=('git' 'python')
provides=("$pkgname")
conflicts=("$pkgname")
install=automx.install
options=('emptydirs')
source=("$pkgname::git+https://github.com/sys4/automx.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$pkgname"

  # Create automx lib directory
  install -D -d -m755 "$pkgdir/usr/lib/$pkgname"
  # Create dependency directory
  install -D -d -m755 "$pkgdir/usr/lib/python3.7/$pkgname"
  # Install automx_wsgi.py to automx lib directory
  install -D -m755 src/automx_wsgi.py "$pkgdir/usr/lib/$pkgname/automx_wsgi.py"
  # Update permissions for httpd
  chown -R http:http "$pkgdir/usr/lib/$pkgname"
  # Install python dependencies
  install -D -m644 "src/$pkgname/config.py" "$pkgdir/usr/lib/python3.7/$pkgname/config.py"
  install -D -m644 "src/$pkgname/__init__.py" "$pkgdir/usr/lib/python3.7/$pkgname/__init__.py"
  install -D -m644 "src/$pkgname/view.py" "$pkgdir/usr/lib/python3.7/$pkgname/view.py"
  # Install automx-test
  install -D -m755 "src/automx-test" "$pkgdir/usr/bin/automx-test"
  # Install man pages
  install -D -m644 "doc/man/man1/automx-test.1" "$pkgdir/usr/local/man/man1/automx-test.1"
  install -D -m644 "doc/man/man5/automx.conf.5" "$pkgdir/usr/local/man/man5/automx.conf.5"
  install -D -m644 "doc/man/man5/automx_ldap.5" "$pkgdir/usr/local/man/man5/automx_ldap.5"
  install -D -m644 "doc/man/man5/automx_script.5" "$pkgdir/usr/local/man/man5/automx_script.5"
  install -D -m644 "doc/man/man5/automx_sql.5" "$pkgdir/usr/local/man/man5/automx_sql.5"
  # Install conf files
  install -D -d -m755 "$pkgdir/usr/share/$pkgname/conf"
  install -D -m644 "src/conf/apache.conf.example" "$pkgdir/usr/share/$pkgname/conf/"
  install -D -m644 "src/conf/automx.conf" "$pkgdir/usr/share/$pkgname/conf/" 
  install -D -m644 "src/conf/automx.conf.example-complex" "$pkgdir/usr/share/$pkgname/conf/"
  install -D -m644 "src/conf/nginx-automx.conf" "$pkgdir/usr/share/$pkgname/conf/"
  # Install automx BASIC_CONFIGURATION_README and INSTALL docs
  install -D -d -m755 "$pkgdir/usr/share/docs/$pkgname"
  install -D -m644 BASIC_CONFIGURATION_README "$pkgdir/usr/share/docs/$pkgname/"
  install -D -m644 INSTALL "$pkgdir/usr/share/docs/$pkgname/"
  # Install license
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
