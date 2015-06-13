# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=sbackup
pkgver=0.11.6
pkgrel=2
pkgdesc="Simple backup solution intended for desktop use"
arch=('any')
url="https://launchpad.net/sbackup"
license=('GPL')
depends=('python2-gconf' 'python2-libgnome' 'python2-notify' 'gvfs' 'dbus-python' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('python2-distribute')
optdepends=('python-pexpect: for ssh fuse plugin'
            'sshfs: for ssh plugin'
            'curlftpfs: for ftp and sftp fuse plugins')
install="${pkgname}.install"
source=("http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz"
        "sbackup.conf"
        "move-sbin-to-bin.patch")
sha256sums=('a7684837ac2dba199ae0e3a6e6af972b0ef328db0bb79c847e289e4c6418887d'
            'd354338c794088c3e7c62162c414394bee339f05535f2316d00bc19c0f1af9b9'
            'a0e7302d5053b44e36439d45e954c89689c0f826761c3bae8fdbd67037a54d43')

prepare() {
  patch -p0 -i "../move-sbin-to-bin.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/env python2@'
  sed -i "s/dpkg --get-selections/pacman -Q/" src/sbackup/core/snapshot.py

  make PYTHON=python2 PREFIX=/usr
}

package() {
  # Add configuration file to tmpfiles.d
  install -m755 -d "${pkgdir}/usr/lib/tmpfiles.d"
  install -m644 -t "${pkgdir}/usr/lib/tmpfiles.d" "sbackup.conf"

  # Install package files
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2 \
       PREFIX=/usr \
       DESTDIR="${pkgdir}/usr" \
       sysconf_dir=${pkgdir}/etc \
       SETUP.PY_OPTS="--root=${pkgdir}/" \
       DISABLE_MAKEFILE_GTK_UPDATE_ICON_CACHE=1 \
       DISABLE_MAKEFILE_DESKTOP_DATABASE_RELOAD=1 \
       DISABLE_MAKEFILE_DBUS_RELOAD=1 \
       GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
       DISABLE_MAKEFILE_CLEAN_DATA=1 \
       install
}
