# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Chirantan Ekbote <chirantan.ekbote@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Tsekhovoy Eugene aka Krash <8552246@gmail.com>

set -u
_pkgname='mc'
pkgname="${_pkgname}-git"
pkgver=4.8.14.r100.gb8ffa1b
pkgrel=1
pkgdesc='a tty based filemanager/shell that emulates Norton Commander'
arch=('i686' 'x86_64')
url='http://www.midnight-commander.org/'
license=('GPL')
depends=(
    'e2fsprogs'
    'glib2'
    'gpm'
    'libssh2'
    'slang'
    'pcre'
    'perl')
optdepends=(
    'cabextract: ucab extfs'
    'cdparanoia: audio extfs'
    'cdrkit: iso9660 extfs'
    'gawk: hp48+ extfs'
    'aspell: spelling corrections'
    'cvs: CVS support'
    'mtools: a+ extfs'
    'python2-boto: s3+ extfs'
    'python2-pytz: s3+ extfs'
    'smb: VFS support'
    'unace: uace extfs'
    'unarj: uarj extfs'
    'unrar: urar extfs'
    'zip: uzip extfs'
    'p7zip: support for 7zip archives')
makedepends=('git' 'libxt' 'libx11')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}"{,-cvs,-fork-svn,-mp,-slavz,-suse})
backup=('etc/mc/edit.indent.rc'
        'etc/mc/filehighlight.ini'
        'etc/mc/mcedit.menu'
        'etc/mc/mc.ext'
        'etc/mc/mc.keymap'
        'etc/mc/mc.menu'
        'etc/mc/sfs.ini')
options=('!emptydirs' '!makeflags')
#changelog='CHANGELOG'
_verwatch=('http://ftp.midnight-commander.org/' 'mc-\([0-9\.]\+\)\.tar\.xz' 'l')
source=('git://github.com/MidnightCommander/mc')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_pkgname}"
  # http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=dcui/mc&id=338da10abcd744ab75dfb184f8f81370727e5653
  # sed -i -e 's/pkglibexec_SCRIPTS = $(SCRIPTS_OUT)/pkgdata_SCRIPTS = $(SCRIPTS_OUT)/g' 'contrib/Makefile.am'
  #export MCREVISION="$(git describe --tags)"
  #./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --enable-background --enable-network --enable-netcode --enable-charset --enable-nls --with-vfs --with-edit --with-screen=slang --without-x --without-samba --without-gpm-mouse --without-gnome --without-debug --without-included-gettext --disable-dependency-tracking

  ./autogen.sh
  ./configure --prefix='/usr' --sysconfdir='/etc' --enable-vfs-smb --with-x --libexecdir='/usr/lib' --enable-aspell
  set +u
}

build() {
  set -u
  cd "${_pkgname}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  # Fix FS#15177
  # (done) sed -i -e 's|op_has_zipinfo = 0|op_has_zipinfo = 1|' "${pkgdir}/usr/lib/mc/extfs.d/uzip"
  # (changed) sed -i -e 's#/usr/bin/env python#/usr/bin/python2#' "${pkgdir}/usr/lib/mc/extfs.d/s3+" # This is a terrible patch!
  # python2 is still needed. I have python-botocore and running this with python3 results in an error
  sed -i -e 's:^#!\s*/usr/bin/.*python$:#!/usr/bin/python2:g' "${pkgdir}/usr/lib/mc/extfs.d/s3+"
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # Two non English help files
  #! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  # a bunch of help files
  #! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  # A few failover folders
  #! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # mostly help but some shell scripts and syntax files
  #! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u

# vim:set ts=2 sw=2 ft=sh et:
