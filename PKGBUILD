# Maintainer: K1412 <jonathan@opensides.be>
pkgname=fusiondirectory
pkgver=1.0.8.8
pkgrel=1
pkgdesc="FusionDirectory is a combination of system-administrator and end-user web interface, designed to handle LDAP based setups."
arch=('any')
url="http://fusiondirectory.org/"
license=('LGPL')
depends=('apache' 'smarty3' 'smarty3-i18n' 'prototype' 'scriptaculous' 'schema2ldif' 'javascript-common'
'perl-path-class' 'perl-ldap' 'perl-mime-base64' 'perl-crypt-passwdmd5' 'perl-term-readkey'
'perl-crypt-cbc' 'perl-file-copy-recursive' 'perl-xml-twig' 'perl-archive-extract' 'perl-extutils-makemaker'
'php-imagick' 'php-ldap' 'php-pear' 'php-gd' 'php-imap' 'php-apache')
install=${pkgname}.install

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz"
        'fixes-path.patch'
        'fixes-apache-path.patch'
        'fixes-pear-lib.patch'
        'fixes-headers.patch'
        'fixes-password.patch')

md5sums=('e169b4ca7ac809a6b939ed06d81c0f2a'
         '5f92d3e4378d0ea7fda7fa9c8b81d29e'
         'd2e3d7dedf5c436c6d7484dc049f3f7f'
         '0a78917932d864cbaefa0139f90c6ab0'
         '21ff95126a4e956a85219242c609bb3c'
         '2afdfadf6e441099d7644577640c0cb5')

prepare() {
  # In srcdir
  cd "$srcdir/$pkgname-$pkgver"

  # Apply patchs
  patch -p1 -i ../fixes-path.patch
  patch -p1 -i ../fixes-apache-path.patch
  patch -p1 -i ../fixes-pear-lib.patch
  patch -p1 -i ../fixes-headers.patch
  patch -p1 -i ../fixes-password.patch

  # Right for executables 
  chmod 750 ./contrib/bin/*

  # Create the man files
  gzip ./contrib/man/fusiondirectory.conf.5
  gzip ./contrib/man/fusiondirectory-setup.1
  gzip ./contrib/man/fusiondirectory-insert-schema.1
}

package() {
	# In srcdir
	cd "$srcdir/$pkgname-$pkgver"

	# Create multiple directories
	install -d -m 0770 $pkgdir/var/spool/$pkgname/
	install -d -m 0770 $pkgdir/var/cache/$pkgname/tmp/
	install -d -m 0770 $pkgdir/var/cache/$pkgname/locale/
	install -d -m 0770 $pkgdir/var/cache/$pkgname/include/
	install -d -m 0770 $pkgdir/var/cache/$pkgname/template/

	# Copy man files
	install -d -m 0755 $pkgdir/usr/share/man/man1/
	install -d -m 0755 $pkgdir/usr/share/man/man5/

	cp ./contrib/man/fusiondirectory.conf.5.gz $pkgdir/usr/share/man/man5/
        cp ./contrib/man/fusiondirectory-setup.1.gz $pkgdir/usr/share/man/man1/
        cp ./contrib/man/fusiondirectory-insert-schema.1.gz $pkgdir/usr/share/man/man1/

	# Copy docs
	install -d -m 0770 $pkgdir/usr/share/doc/$pkgname/
	cp ./AUTHORS ./Changelog ./COPYING $pkgdir/usr/share/doc/$pkgname/

	# Move fusiondirectory.conf in template
	cp ./contrib/fusiondirectory.conf $pkgdir/var/cache/$pkgname/template/

	mkdir -p $pkgdir/usr/share/doc/$pkgname/
	cp -a contrib/openldap/slapd.conf $pkgdir/usr/share/doc/$pkgname/ 

	# Move executables
	mkdir -p $pkgdir/usr/bin/
	cp ./contrib/bin/fusiondirectory-setup $pkgdir/usr/bin/

	# Move smarty functions and create php lib directory if it exist
	install -d -m 0755 $pkgdir/usr/share/php/smarty3/plugins/

	cp ./contrib/smarty/plugins/function.msgPool.php $pkgdir/usr/share/php/smarty3/plugins/function.msgPool.php
	cp ./contrib/smarty/plugins/function.filePath.php $pkgdir/usr/share/php/smarty3/plugins/function.filePath.php
	cp ./contrib/smarty/plugins/block.render.php $pkgdir/usr/share/php/smarty3/plugins/block.render.php

	# Copy apache configuration
	install -d -m 0755 $pkgdir/etc/httpd/conf/extra/
	cp ./contrib/apache/fusiondirectory-apache.conf $pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf

	# FusionDirectory install
	install -d -m 0755 $pkgdir/usr/share/webapps/${pkgname}/
	DIRS="ihtml plugins html include locale setup"
	for i in $DIRS ; do
  		cp -ua $i $pkgdir/usr/share/webapps/${pkgname}/
	done

  rm ${pkgdir}/usr/share/webapps/fusiondirectory/include/class_databaseManagement.inc
}
