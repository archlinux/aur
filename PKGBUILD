# Maintainer: James An <james@jamesan.ca>
pkgbase=aegir
pkgname=('aegir' 'aegir-hostmaster' 'aegir-provision')
pkgver=2.1
pkgrel=1
arch=('any')
url="http://aegirproject.org/"
license=('GPL')
options=(!strip)

#source=($pkgbase-$pkgver.tar.gz)
sha256sums=() #autofill using updpkgsums

build() {
  cd "$pkgbase-$pkgver"

  ./configure --prefix=/usr
  make
}

package_aegir() {
  pkgdesc="Meta-Drupal hosting system"
  install=aegir.install
  depends=('aegir-hostmaster>=2.1')

  cd "$pkgbase-$pkgver"

  make DESTDIR="$pkgdir/" install
}

package_aegir-hostmaster() {
  pkgdesc="Meta-Drupal hosting system - front end"
  install=aegir-hostmaster.install
  depends=('aegir-provision>=2.1')

  cd "$pkgbase-$pkgver"

  make DESTDIR="$pkgdir/" i
  install
}

package_aegir-provision() {
  pkgdesc="Meta-Drupal hosting system - back end"
  install=aegir-provision.install
  depends=('apache' 'drush>=5.10' 'git' 'php' 'php-gd' 'php-pear' 'mysql-clients' 'rsync' 'sudo' 'smtp-forwarder' 'unzip')
  optdepends=(
    'apache: asdf'
    'php-apache: '
  )

  # Sserver config
  # Make sure service units for httpd and mysqld are enabled.
  echo "Include /var/aegir/config/apache.conf" >> /etc/httpd/conf/httpd.conf
  sed -i 's/^open_basedir.*$/open_basedir =/' /etc/php/php.ini
  sed -i 's/^;date.timezone.*$/date.timezone = Etc\/UTC/' /etc/php/php.ini
  sed -i 's/^memory_limit = 1.*$/memory_limit = 192M/' /etc/php/php.ini
  sed -i 's/^;extension=posix.so$/;extension=posix.so/' /etc/php/php.ini
  sed -i 's/^;extension=mysqli.so$/extension=mysqli.so/' /etc/php/php.ini
  sed -i 's/^;extension=pdo_mysql.so$/extension=pdo_mysql.so/' /etc/php/php.ini
  #sed -i 's/^;$//' /etc/php/php.ini

  sed -i 's/^LoadModule.*mpm_event.*$/#LoadModule mpm_event_module modules\/mod_mpm_event.so/'    /etc/httpd/conf/httpd.conf
  sed -i '/^LoadModule.*mpm_event.*$/a LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so' /etc/httpd/conf/httpd.conf
  sed -i '/^LoadModule.*mod_dir.*$/a LoadModule php5_module modules/libphp5.so'                   /etc/httpd/conf/httpd.conf
  echo 'Include conf/extra/php5_module.conf' >> /etc/httpd/conf/httpd.conf

  # `hostname` and `uname -n` must resolve to an IP address of this server (loopback with 127.0.0.1 is sufficient).
  mysql_secure_installation
  # Install hosting-queued.service.

  # Aegir user creation.

  su -s /bin/bash - aegir
  (
    drush dl --destination=/var/aegir/.drush provision-6.x-2.0
    drush cache-clear drush
    drush hostmaster-install --web_group=http
  )

  cd "$pkgbase-$pkgver"

  make DESTDIR="$pkgdir/" install
}
