# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jeroen Hoekx <jeroen.hoekx AT hamok DOT be>

# TODO: Fix make validate for packaging
# TODO: Stuff in validate looks like it should be in an installer

set -u
_pkgname='relax-and-recover'
pkgname="${_pkgname}-git"
pkgver=2.9.r103.g4dd5392b3
pkgrel=1
pkgdesc='bootable Linux disaster recovery, formerly rear'
arch=('any')
url='http://relax-and-recover.org/'
license=('GPL')
depends=('lsb-release' 'iproute2' 'parted' 'util-linux' 'cpio' 'mingetty' 'gawk' 'grep')
depends+=('bash' 'tar' 'procps-ng')
optdepends=( 'nfs-utils: to save images to NFS shares'
             'cdrkit: to create ISO images'
             'syslinux: to create bootable media')
makedepends=('git' 'asciidoc' 'xmlto' 'sed' 'bash')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
replaces=('rear')
backup=('etc/rear/local.conf')
_srcdir="${_pkgname^^}"
_giturl="https://github.com/rear/rear"
_verwatch=("${_giturl}/releases.atom" "\s\+<title>rear-\([^>]\+\)</title>.*" 'f') # RSS
source=("${_srcdir}::${_giturl//https:/git+https:}.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _vcsver="$(git describe --long | sed -e 's:release/::g' -e 's/^rear-//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  local _vcsct="$(git rev-list --count HEAD)"
  _vcsver="${_vcsver//.r0./.r${_vcsct}.}"
  echo "${_vcsver}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  #cp -pn 'Makefile' 'Makefile.Arch' # debugging
  sed -e 's:=/bin/bash:=/usr/bin/bash:g' \
      -e '# Fixing this path enables validate which crashes the make' \
      -e '#s:^rearbin = usr/sbin/rear$:rearbin = usr/bin/rear:g' \
      -e '# Fixing this here allows make pacman to work properly' \
      -e 's:^sbindir = $(prefix)/sbin$:sbindir = $(prefix)/bin:g' \
      -e '# One sbin is here so we leave it alone:g' \
    -i 'Makefile'
  test ! -f 'Makefile.Arch'

if :; then
  # Clean up /lib for COPY_AS_IS
  sed -E -e "s:([\"' ])/lib:\1/usr/lib:g" \
         -e "s:/lib\*/:/lib/:g" \
         -e "s:/lib64/:/lib/:g" \
    -i usr/share/rear/prep/GNU/Linux/*include*.sh # $(grep --include '*.sh' -rlEe '(["'"'"' ])/lib') # '

  # Clean up Linux.conf
  #cp -p 'usr/share/rear/conf/GNU/Linux.conf' 'usr/share/rear/conf/GNU/Linux.conf.Arch'
  sed -e 's:/lib\*/:/lib/:g' \
      -e 's:/lib/:/usr/lib/:g' \
      -e 's:/usr/usr/lib/:/usr/lib/:g' \
    -i 'usr/share/rear/conf/GNU/Linux.conf'
  test ! -f 'usr/share/rear/conf/GNU/Linux.conf.Arch'

  # Clean up default.conf
  sed -e 's:/lib64:/usr/lib:g' -i 'usr/share/rear/conf/default.conf'
  bash -c '
    source "usr/share/rear/conf/default.conf"
    for _d in "${COPY_AS_IS_CDM[@]}"; do
      if [ -e "${_d}" ] && [ ! -d "${_d}" -o -L "${_d}" ]; then
        printf "Invalid CDM %s\n" "${_d}"
      fi
    done
  '
fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  #make DESTDIR="${pkgdir}" sbindir='/usr/bin' rearbin='usr/bin/rear' install
  make DESTDIR="${pkgdir}" install
  sed -e 's:^ISO_ISOLINUX_BIN=.*$:ISO_ISOLINUX_BIN="/usr/lib/syslinux/bios/isolinux.bin":g' -i "${pkgdir}/usr/share/rear/conf/default.conf"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
