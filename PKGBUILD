# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>
# Contributor: Lucjan Lucjanov <lucjan.lucjanov@gmail.com>

pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-4.20
pkgver=4.20.4
pkgrel=1
pkgdesc="User mode Linux kernel and modules"
arch=('x86_64')
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
makedepends=('bc' 'inetutils' 'gcc7')
source=(
  http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
#  http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz
  config)

sha256sums=('ad0823183522e743972382df0aa08fb5ae3077f662b125f1e599b0b2aaa12438'
            'SKIP'
            '24ee94fbbf9c356ace420e7eedfff4c9d3f2e8645011bc8947c22421dea5a8ba'
            '0c6ca2df8b072b1fa1c13d290e2c1f0c97d872419f4bf8c2fd813a29e79c5626')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # set extraversion to pkgrel
  sed -i "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" Makefile

  # rewrite configuration
  yes "" | make ARCH=um config >/dev/null
}

build() {
  cd "${srcdir}/${_srcname}"
  unset LDFLAGS CFLAGS

  make ARCH=um CC=gcc-7 vmlinux modules 
}

package_linux-usermode() {
  cd "${srcdir}/${_srcname}"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/kernel-usermode"
  install -m 644 System.map ${pkgdir}/usr/share/kernel-usermode/System.map
  install -m 755 vmlinux ${pkgdir}/usr/bin/
}

package_linux-usermode-modules() {
  install=modules.install

  cd "${srcdir}/${_srcname}"

  # get kernel version, but discard the first result
  make ARCH=um kernelrelease > /dev/null
  _kernver="$(make ARCH=um kernelrelease)"

  #  make ARCH=um INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  make ARCH=um INSTALL_MOD_PATH="${pkgdir}/usr" _modinst_
  rm -f $pkgdir/usr/lib/modules/${_kernver}/{source,build}
  sed \
    -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/modules.install"
}

# vim:set ts=8 sts=2 sw=2 et:
