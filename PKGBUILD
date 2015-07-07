# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>
pkgname='eudev-git'
pkgdesc="The userspace dev tools (udev) forked by Gentoo"
pkgver=20150619
pkgrel=1
provides=('eudev' 'libgudev')
replaces=('eudev' 'udev' 'systemd' 'libsystemd' 'systemd-tools' 'libgudev')
conflicts=('eudev' 'udev' 'systemd' 'libsystemd' 'systemd-tools' 'libgudev')
groups=('base')
arch=('i686' 'x86_64')
url="https://github.com/gentoo/eudev"
license=('GPL')
depends=('util-linux' 'glib2' 'kmod' 'hwids' 'bash')
makedepends=('git' 'gobject-introspection' 'gperf' 'libxslt' 'docbook-xsl')
options=(!makeflags !libtool)
install="${pkgname}.install"
backup=('etc/udev/udev.conf' 'etc/udev/rules.d/80-net-name-slot.rules')
source=('git://github.com/gentoo/eudev.git'
        'initcpio_hooks'
        'initcpio_install'
        '80-net-name-slot.rules')
md5sums=('SKIP'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         'd3a7b1d77e53d401ed37827ad297846a'
         'd83a59d647b511b815ee0e8c85dcd54a')
_gitname="eudev"

pkgver()
{
  cd "${srcdir}/${_gitname}"

  # Date of last commit
  git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

build() {
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
              --enable-gudev \
              --enable-introspection

  msg2 "Compiling..."
  make
}


package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install

  # Install the mkinitpcio hook
  install -Dm644 "${srcdir}/initcpio_hooks" "${pkgdir}/usr/lib/initcpio/hooks/udev"
  install -Dm644 "${srcdir}/initcpio_install" "${pkgdir}/usr/lib/initcpio/install/udev"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  for i in "${pkgdir}/usr/lib/udev/rules.d/"*.rules; do
    sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g;
               s#GROUP="tape"#GROUP="storage"#g;
               s#GROUP="cdrom"#GROUP="optical"#g' "${i}"
  done

  # input group is not used in Arch Linux at this moment
  sed '/GROUP="input"/d' -i "${pkgdir}/usr/lib/udev/rules.d/50-udev-default.rules"

  # Make new interface naming policy disabled by default
  rm -f "${pkgdir}/usr/lib/udev/rules.d/80-net-name-slot.rules"
  install -Dm644 "${srcdir}/80-net-name-slot.rules" "${pkgdir}/etc/udev/rules.d/80-net-name-slot.rules"

  # Getting udev version
  udevver=$(grep UDEV_VERSION configure.ac | egrep -o "[0-9]{3}")
  provides+=("udev=$udevver")
  provides+=("systemd=$udevver")
  provides+=("libsystemd=$udevver")
  provides+=("systemd-tools=$udevver")
}

