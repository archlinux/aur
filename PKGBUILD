# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>
pkgname='eudev-git'
pkgdesc="The userspace dev tools (udev) forked by Gentoo"
pkgver=20130802
pkgrel=1
_udevver=206
provides=("udev=${_udevver}" "systemd=${_udevver}" "libsystemd=${_udevver}" "systemd-tools=${_udevver}")
replaces=('udev' 'systemd' 'libsystemd' 'systemd-tools')
conflicts=('udev' 'systemd' 'libsystemd' 'systemd-tools')
groups=('base')
arch=('i686' 'x86_64')
url="https://github.com/gentoo/eudev"
license=('GPL')
depends=('util-linux' 'glib2' 'kmod' 'hwids' 'bash' 'acl')
makedepends=('git' 'gobject-introspection' 'gperf' 'libxslt' 'docbook-xsl')
options=(!makeflags !libtool)
install="${pkgname}.install"
backup=('etc/udev/udev.conf' 'etc/udev/rules.d/80-net-name-slot.rules')
source=('git://github.com/gentoo/eudev.git'
        'initcpio_hooks'
        'initcpio_install'
	'80-net-name-slot.rules')
options=(!makeflags !libtool)
md5sums=('SKIP'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         '825af8cce7dd73ed4ce1a8289e3bdad8'
         '372d60f89f626629005bb755be259a20')
#_gitroot=('git://github.com/gentoo/eudev.git')
_gitname=('eudev')
         
build() {
  #if [ -d "${_gitname}" ] ; then
  #  cd "${srcdir}/${_gitname}"
  #  msg2 "Updating local tree..."
  #  git pull origin master
  #else
  #  cd "${srcdir}"
  #  msg2 "Cloning initial copy of ${_gitname}..."
  #  git clone --depth=1 "${_gitroot}" "${_gitname}"
  #  cd "${srcdir}/${_gitname}"
  #fi
  cd "${srcdir}/${_gitname}"

  if [ -f "Makefile" ];then
    msg2 "Cleaning up..."
    make clean
  fi
  
  msg2 "Configuring sources..."
  ./autogen.sh
  ./configure --prefix=/usr \
              --with-rootprefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
	      --sbindir=/usr/bin \
              --with-firmware-path=/usr/lib/firmware/updates:/lib/firmware/updates:/usr/lib/firmware:/lib/firmware \
              --with-modprobe=/sbin/modprobe \
              --enable-gudev \
              --enable-introspection

  msg2 "Compiling..."
  make
}


package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install

  # install the mkinitpcio hook
  install -Dm644 "${srcdir}/initcpio_hooks" "${pkgdir}/usr/lib/initcpio/hooks/udev"
  install -Dm644 "${srcdir}/initcpio_install" "${pkgdir}/usr/lib/initcpio/install/udev"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  for i in "${pkgdir}/usr/lib/udev/rules.d/"*.rules; do
    sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g;
               s#GROUP="tape"#GROUP="storage"#g;
               s#GROUP="cdrom"#GROUP="optical"#g' "${i}"
  done

  # Make new interface naming policy disabled by default
  rm -f "${pkgdir}/usr/lib/udev/rules.d/80-net-name-slot.rules"
  install -Dm644 "${srcdir}/80-net-name-slot.rules" "${pkgdir}/etc/udev/rules.d/80-net-name-slot.rules"
}

pkgver()
{
  cd "${srcdir}/${_gitname}"

  # Date of last commit
  git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

