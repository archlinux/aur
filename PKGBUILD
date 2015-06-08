# Maintainer: xerc <aur[at]xerc.de>
# Contributor: judd <jvinet[at]zeroflux.org>
# Contributor: milomouse <vincent[at]fea.st>
# Contributor: falconindy <d[at]falconindy.com>

_basename=util-linux
pkgname=${_basename}-aes
_basever=2.26
pkgver=${_basever}.2
pkgrel=2
aneurysma=${pkgver}

pkgdesc="Miscellaneous system utilities for Linux, with loop-AES support"
url="http://sourceforge.net/projects/loop-aes/"

license=('GPL2')
arch=('any')
groups=('base')

options=('strip' 'debug' '!libtool')
depends=('pam' 'shadow' 'coreutils' 'libsystemd' 'glibc' 'zlib')

provides=('eject' 'zramctl' "${_basename}=${pkgver}" "lib${_basename}=${pkgver}" "${_basename}-ng=${pkgver}" 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so')
replaces=('eject' 'zramctl' "${_basename}" "lib${_basename}" "${_basename}-ng" "${_basename}-ng-aes")
conflicts=(${replaces[*]})

install=${pkgname}.install
makedepends=('systemd' 'python' 'autoconf' 'automake')

# ToChk
#   autopoint:  /usr/bin/autopoint (GNU gettext-tools) 0.18.3
#   aclocal:    aclocal (GNU automake) 1.14.1
#   autoconf:   autoconf (GNU Autoconf) 2.69
#   autoheader: autoheader (GNU Autoconf) 2.69
#   automake:   automake (GNU automake) 1.14.1
#   libtoolize: libtoolize (GNU libtool) 2.4.2

#validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284') # Karel Zak
#source=("https://www.kernel.org/pub/linux/utils/${_basename}/v${_basever}/${_basename}-${pkgver}.tar."{xz,sign}

source=("https://www.kernel.org/pub/linux/utils/${_basename}/v${_basever}/${_basename}-${pkgver}.tar.xz"
  pam-common::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-common?h=packages/${_basename}"
  pam-login::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-login?h=packages/${_basename}"
  pam-su::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-su?h=packages/${_basename}"
  uuidd.tmpfiles::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/uuidd.tmpfiles?h=packages/${_basename}"
#  http://loop-aes.sourceforge.net/updates/${_basename}-${aneurysma}.diff.bz2
  ${_basename}-${aneurysma}.diff
)

build() {
  cd "${srcdir}/${_basename}-${pkgver}"

  msg "Patching with loop-AES"
  patch -Np1 -i "${srcdir}/${_basename}-${aneurysma}.diff"

  msg "Starting autogen"
  ./autogen.sh

  msg "Starting configure"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --localstatedir=/run \
    --enable-fs-paths-extra=/usr/bin \
    --enable-raw \
    --enable-vipw \
    --enable-newgrp \
    --enable-chfn-chsh \
    --enable-write \
    --enable-mesg \
    --enable-partx \
    --enable-libmount-force-mountinfo \
    --with-python=3

  msg "Starting make"
  make
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  make DESTDIR="$pkgdir" install

  cd "${pkgdir}"
  
  # enable modules
  cat > "${srcdir}/${pkgname}.modules" <<EOF
loop
aes-i586
cryptoloop
EOF

  [ -d /etc/modules-load.d ] && install -Dm644 "${srcdir}/${pkgname}.modules" "${pkgdir}/etc/modules-load.d/${pkgname}.conf"

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm644 "${srcdir}/pam-common" "${pkgdir}/etc/pam.d/chfn"
  install -m644 "${srcdir}/pam-common" "${pkgdir}/etc/pam.d/chsh"
  install -m644 "${srcdir}/pam-login" "${pkgdir}/etc/pam.d/login"
  install -m644 "${srcdir}/pam-su" "${pkgdir}/etc/pam.d/su"
  install -m644 "${srcdir}/pam-su" "${pkgdir}/etc/pam.d/su-l"

  # include tmpfiles fragment for uuidd
  # TODO(dreisner): offer this upstream?
  install -Dm644 "${srcdir}/uuidd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/uuidd.conf"

  # usrmove
  cd "${pkgdir}"
  mv {,usr/}sbin/* usr/bin
  rmdir sbin usr/sbin

  # DO NOT create libutil-linux split : The AUR does not support split packages!
}

md5sums=('9bdf368c395f1b70325d0eb22c7f48fb'
         'a31374fef2cba0ca34dfc7078e2969e4'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'fa85e5cce5d723275b14365ba71a8aad'
         'a39554bfd65cccfd8254bb46922f4a67'
         '430bd16a629e44d33ffe299f993e8a2c')
