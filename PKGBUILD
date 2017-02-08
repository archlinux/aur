# Contributor: xsmile <sascha_r AT gmx DOT de>
# Maintainer: max-k <max-k AT post DOT com>
pkgname=pydio
pkgver=7.0.4
pkgrel=1
pkgdesc='Sync & share solution, formerly AjaXplorer'
arch=('any')
url='https://pydio.com'
license=('AGPL3')
depends=('php>=5.5.9'
         'php-gd>=5.5.9'
         'php-intl>=5.5.9'
         'php-mcrypt>=5.5.9')
optdepends=('mariadb: MySQL database back end'
            'php-apcu: to use caching'
            'php-imap: to browse mailboxes over IMAP and POP3 (access.imap)'
            'libssh2: to manage files over SFTP (access.sftp)'
            'pecl-ssh2: to manage files over SFTP (access.sftp)'
            'smbclient: to mount SAMBA shares (access.smb)'
            'zip: to create and modify zipfiles (action.powerfs)'
            'ghostscript: to generate thumbnails (editor.imagick)'
            'imagemagick: to generate thumbnails (editor.imagick)'
            'librsync: to compute checksums/deltas and apply patches using rdiff (meta.filehasher)'
            'pecl-rsync: to compute checksums/deltas and apply patches using rdiff (meta.filehasher)'
            'git: to use Git-based versioning (meta.git)'
            'pear-versioncontrol-git: to use Git-based versioning (meta.git)'
            'udevil: to mount filesystems (meta.mount)')
options=('!strip')
install="${pkgname}.install"
_srcbase="https://download.${pkgname}.com/pub/core/archives"
source=("${_srcbase}/${pkgname}-core-${pkgver}.tar.gz"
        "${pkgname}.install")
md5sums=('4f9b7763ada139f8eabd59fc70bbd91c'
         '70d858a897b7add73d7554bb47f1ff6a')

package() {
  cd "${srcdir}/${pkgname}-core-${pkgver}"

  local _INSTDIR="${pkgdir}/usr/share/webapps/${pkgname}"
  install -d "${_INSTDIR}"
  cp -r .htaccess core plugins *.php robots.txt "${_INSTDIR}/"

  local _CONFDIR="${pkgdir}/etc/webapps/${pkgname}"
  install -d "${_CONFDIR}"
  cp -r conf/* "${_CONFDIR}/"
  ln -s "/etc/webapps/${pkgname}" "${_INSTDIR}/conf"

  local _DATADIR="${pkgdir}/var/lib/${pkgname}"
  install -d "${_DATADIR}"
  cp -r data/* "${_DATADIR}/"
  ln -s "/var/lib/${pkgname}" "${_INSTDIR}/data"
  chgrp -R 33 "${_DATADIR}"
  chmod -R 770 "${_DATADIR}"

  local _DOCDIR="${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${_DOCDIR}"
  install -Dm644 *.sample "${_DOCDIR}/"
}
