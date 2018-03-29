# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-4.15
pkgver=4.15.13
pkgrel=1
pkgdesc="User mode Linux kernel and modules"
arch=('x86_64')
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
makedepends=('bc' 'inetutils')
source=(
  http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
  http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  config
  0001-ucontext-fix-incomplete-type-ucontext.patch)

sha256sums=('5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769'
            'SKIP'
            'f1bc5cfc7316daa463cd0ed366e376eb24a29072491c29a68732e1edf8a6ef8b'
            'SKIP'
            '93ac55a0f6dea086900088b138ed34dfe1463d3f5e7c090a7b124010b144aee0'
            '9a7e0a9a2c3d4252cee29b4f5f61da00e98bd247cb5ceb22e31a7f782a45bddf')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # workground for glibc 2.26+
  # https://patchwork.kernel.org/patch/10059117/
  patch -Np1 -i ../0001-ucontext-fix-incomplete-type-ucontext.patch

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
  #  make ARCH=um INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  make ARCH=um INSTALL_MOD_PATH="${pkgdir}/usr" _modinst_
  rm -f $pkgdir/usr/lib/modules/${pkgver}${_kernelname}/{source,build}
  sed \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=$pkgver${_kernelname}/g" \
    -i "${startdir}/modules.install"
}

# vim:set ts=8 sts=2 sw=2 et:
