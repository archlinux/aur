# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>
# Contributor: Lucjan Lucjanov <lucjan.lucjanov@gmail.com>

pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-5.1
pkgver=5.1.5
pkgrel=1
pkgdesc="User mode Linux kernel and modules"
arch=('x86_64')
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
makedepends=('bc' 'inetutils')
source=(
  http://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.{xz,sign}
#  http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  http://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz
  config
  001-hide_the_int3_emulate_call_jmp_functions_from_uml.patch)

sha256sums=('d06a7be6e73f97d1350677ad3bae0ce7daecb79c2c2902aaabe806f7fa94f041'
            'SKIP'
            'def1a382c555454daf28fb768ed2c3e6f339c4bfcd36faa99982e4d31c04efa6'
            'c2741019f57c2c918ad80cbf0fad0d03ef585fadf045078b3117cd73d83e5f2b'
            'f292341bdbc90f27ea6775bf3c709d92fbf8842c7cf7603c71807f06ad1e69a9')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # https://lkml.org/lkml/2019/5/14/966
  patch -Np1 -i "${srcdir}"/001-hide_the_int3_emulate_call_jmp_functions_from_uml.patch

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

  make ARCH=um vmlinux modules
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
