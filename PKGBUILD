# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Uzsolt

pkgname=adminer-git
_gitname=adminer

pkgver=v4.1.0.r0.g6aed2f5
pkgrel=1
pkgdesc="Adminer (formerly phpMinAdmin) is a full-featured MySQL management tool written in PHP. GIT version."
url="http://www.adminer.org"
arch=('any')
license=('Apache License, Version 2.0')
install=
depends=('php')
optdepends=('mariadb' 'apache' 'adminer-skins: various CSS skins for adminer' 'postgresql' 'sqlite: for sqlite3' 'sqlite2')
conflicts=("adminer")
provides=('adminer')
makedepends=('git')
install=adminer.install
source=("$pkgname"::'git://adminer.git.sourceforge.net/gitroot/adminer/adminer')

md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _instdir=$pkgdir/usr/share/webapps/$_gitname
  mkdir -p ${_instdir} $pkgdir/etc/webapps/$_gitname $pkgdir/etc/httpd/conf/extra

  cp -R $srcdir/$pkgname/$_gitname/* $_instdir

  # It's similar to phpMyAdmin
  cat >$pkgdir/etc/webapps/$_gitname/apache.example.conf <<EOF
        Alias /${_gitname} "/usr/share/webapps/${_gitname}"
        <Directory "/usr/share/webapps/${_gitname}">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
        </Directory>
EOF
    cp $pkgdir/etc/webapps/$_gitname/apache.example.conf $pkgdir/etc/httpd/conf/extra/httpd-${_gitname}.conf
#  echo "Include conf/extra/httpd-${pkgname}.conf" >> $pkgdir/etc/httpd/conf/httpd.conf
}
