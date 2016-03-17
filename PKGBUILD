# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jeroen Hoekx <jeroen.hoekx AT hamok DOT be>

# TODO: Fix make validate for packaging
# TODO: Stuff in validate looks like it should be in an installer

set -u
_pkgname='relax-and-recover'
pkgname="${_pkgname}-git"
pkgver=1.18.r1928.g9cfd922
pkgrel=1
pkgdesc='bootable Linux disaster recovery, formerly rear'
arch=('any')
url='http://relax-and-recover.org/'
license=('GPL')
depends=('lsb-release' 'iproute2' 'parted' 'util-linux' 'cpio' 'mingetty' 'gawk' 'grep')
optdepends=( 'nfs-utils: to save images to NFS shares'
             'cdrkit: to create ISO images'
             'syslinux: to create bootable media')
makedepends=('git' 'asciidoc' 'xmlto')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
replaces=('rear')
backup=('etc/rear/local.conf')
_srcdir="${_pkgname^^}"
_giturl="https://github.com/rear/rear"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/rear-\(.*\)\.tar\.gz" 'l')
source=("${_srcdir}::${_giturl//https:/git:}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _vcsver="$(git describe --long | sed -e 's/^rear-//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  local _vcsct="$(git rev-list --count HEAD)"
  _vcsver="${_vcsver//.r0./.r${_vcsct}.}"
  echo "${_vcsver}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  #cp -pn 'Makefile' 'Makefile.Arch' # debugging
  sed -i -e 's:/bin/bash:/usr/bin/bash:g' \
         -e '# Fixing this path enables validate which crashes the make' \
         -e '#s:^rearbin = usr/sbin/rear$:rearbin = usr/bin/rear:g' \
         -e '# Fixing this here allows make pacman to work properly' \
         -e 's:^sbindir = $(prefix)/sbin$:sbindir = $(prefix)/bin:g' \
    'Makefile'
  set +u
  ! test -f 'Makefile.Arch'
}

package() {
  set -u
  cd "${_srcdir}"
  #make DESTDIR="${pkgdir}" sbindir="/usr/bin" rearbin='usr/bin/rear' install
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
