# Maintainer: xerc <aur[at]xerc.de>
# Contributor: judd <jvinet[at]zeroflux.org>
# Contributor: milomouse <vincent[at]fea.st>
# Contributor: falconindy <d[at]falconindy.com>

_basename=util-linux
pkgname=${_basename}-aes
_basever=2.27
pkgver=${_basever}.1
pkgrel=1
aneurysma=${pkgver}-20151110

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

source=("https://www.kernel.org/pub/linux/utils/util-linux/v${pkgver%.?}/${_basename}-${pkgver}.tar.xz"
#  "https://www.kernel.org/pub/linux/utils/util-linux/v${pkgver%.?}/${_basename}-${pkgver}.tar."{xz,sign}
  pam-common::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-common?h=packages/${_basename}"
  pam-login::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-login?h=packages/${_basename}"
  pam-su::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-su?h=packages/${_basename}"
  "http://loop-aes.sourceforge.net/updates/${_basename}-${aneurysma}.diff.bz2"
#  "http://loop-aes.sourceforge.net/updates/${_basename}-${aneurysma}.diff.bz2"{,.sign}
#  ${_basename}-${aneurysma}.diff
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

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "$pkgdir/usr/lib/systemd/system/uuidd.socket"

  # TODO(dreisner): fix configure.ac upstream so that this isn't needed
  cd "${pkgdir}"
  mv {,usr/}sbin/* usr/bin
  rmdir sbin usr/sbin

  # DO NOT create libutil-linux split : The AUR does not support split packages!
}

md5sums=('3cd2698d1363a2c64091c2dadc974647'
         'a31374fef2cba0ca34dfc7078e2969e4'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'fa85e5cce5d723275b14365ba71a8aad'
         '2e9ab9fe6f7f5065fc5fa0e38e1f7225'
)
