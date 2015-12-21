#Maintainer: max-k <max-k AT post DOT com>

pkgname=pydio
pkgver=6.2.1
pkgrel=1
pkgdesc='PHP file sharing platform, formerly AjaXplorer.'
arch=('any')
url='http://pyd.io/'
license=('AGPL3')
depends=('php>=5.3' 'php-mcrypt>=5.3' 'php-gd>=5.3')
optdepends=('php-sqlite: Store your data in sqlite database'
            'libssh2: File management functionalities over SSH2 [access.sftp]'
            'smbclient: Browse a Samba Server [access.smb]'
            'imagemagick: View PDF and various images formats [editor.imagick]'
            'ghostscript: View PDF and various images formats [editor.imagick]'
            'subversion: Extract SVN informations from workspace'
            'php-libgit2-git: Keep tracks of modifications using a Git repo'
            'pear-http-oauth: Allows accessing a dropbox account'
            'php-ldap: Authentication datas are stored in an LDAP/AD directory'
            'pear-mail-mimedecode: Email reader wich supports eml format'
            'pear-http-webdavclient: Access a WebDAV server'
            'php-aws-sdk: Access an AWS server'
            'pecl-rsync: Use desktop sync client')
options=('!strip')
install="${pkgname}.install"

_srcroot="http://sourceforge.net/projects/ajaxplorer/files"
_srcbase="${_srcroot}/${pkgname}/stable-channel"
_gitbase="https://raw.githubusercontent.com/pydio/pydio-core/develop/dist/scripts/misc"

source=("${_srcbase}/${pkgver}/${pkgname}-core-${pkgver}.tar.gz"
        "${_gitbase}/5.2.5-6.0.0.mysql"
        "${_gitbase}/5.2.5-6.0.0.pgsql"
        "${_gitbase}/5.2.5-6.0.0.sqlite"
        "bootstrap_context.php.patch"
        "example_nginx_vhost.conf"
        "example_nginx_vhost_ssl.conf"
        "${pkgname}.install")

md5sums=('f3d4ee0cbe59c4c136ed257fcfc497fc'
         'b93ccc2869b485a3c7cd760e5435645c'
         '85c19235373da52b97e0b6073ba45635'
         'e3c4ea819d6790c61c9b81dc48a34e05'
         '4852094d1b423d62fee10bf5fde38b63'
         'be74fee97c60b4ae7e8b194187b553ea'
         '272007089a6c8ca65d1bdde705d91e05'
         '837e3fc09a4fcfdc8a20c758083cfb99')

package() {
  cd ${srcdir}/${pkgname}-core-${pkgver}

  patch -p0 -i ${srcdir}/bootstrap_context.php.patch conf/bootstrap_context.php

  local _INSTDIR="${pkgdir}/usr/share/webapps/${pkgname}"
  install -d "${_INSTDIR}"
  cp -r *.php core phpunit plugins "${_INSTDIR}/"

  local _CONFDIR="$pkgdir/etc/webapps/${pkgname}"
  install -d "${_CONFDIR}"
  cp -r conf/* "${_CONFDIR}/"
  ln -s "/etc/webapps/${pkgname}" "${_INSTDIR}/conf"

  local _DATADIR="$pkgdir/var/lib/${pkgname}"
  install -d "${_DATADIR}"
  cp -r data/* "${_DATADIR}/"
  ln -s "/var/lib/${pkgname}" "${_INSTDIR}/data"
  chgrp -R 33 "${_DATADIR}"
  chmod -R 770 "${_DATADIR}"

  local _DOCDIR="$pkgdir/usr/share/doc/${pkgname}"
  install -d "${_DOCDIR}"
  install -Dm644 ${srcdir}/example_nginx_vhost.conf "${_DOCDIR}/"
  install -Dm644 ${srcdir}/example_nginx_vhost_ssl.conf "${_DOCDIR}/"
  install -d "${_DOCDIR}/upgrade"
  install -Dm644 ${srcdir}/5.2.5-6.0.0.mysql "${_DOCDIR}/upgrade/"
  install -Dm644 ${srcdir}/5.2.5-6.0.0.pgsql "${_DOCDIR}/upgrade/"
  install -Dm644 ${srcdir}/5.2.5-6.0.0.sqlite "${_DOCDIR}/upgrade/"

}

