# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>

pkgbase=linux-usermode
pkgname=('linux-usermode' 'linux-usermode-modules')
_kernelname=-usermodelinux
_major=6.1
_minor=1
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=1
pkgdesc="User mode Linux kernel and modules"
arch=('x86_64')
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
makedepends=('bc' 'inetutils')
source=("https://www.kernel.org/pub/linux/kernel/v6.x/linux-${pkgver}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v6.x/linux-${pkgver}.tar.sign"
        'config'
        '70-uml.hook')

sha256sums=('a3e61377cf4435a9e2966b409a37a1056f6aaa59e561add9125a88e3c0971dfb'
            'SKIP'
            '06eef80d62da91f1cae6c26e73c3714236639bfdc2c3989870736edcb6e29bc6'
            '05ea4e00d1e99bf8140a21c94e3c42acf17b9debad9c6f5decbe1dd1fe04332c')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

prepare() {
  cd ${_srcname}
  
  echo "Setting version..."
  sed -e "/^EXTRAVERSION =/s/=.*/=/" -i Makefile
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  yes "" | make ARCH=um config >/dev/null
  diff -u ../config .config || :

  make ARCH=um kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"

  echo "Save configuration for later reuse"
  cat .config > "${startdir}/config.last"
}

build() {
  cd ${_srcname}
  unset LDFLAGS CFLAGS
  make ARCH=um vmlinux modules
}

_package() {

  cd ${_srcname}
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/kernel-usermode"
  install -m 644 System.map ${pkgdir}/usr/share/kernel-usermode/System.map
  install -m 755 vmlinux ${pkgdir}/usr/bin/
}

_package-modules() {
  depends=('kmod')

  cd ${_srcname}
  local kernver="$(<version)"
  make ARCH=um INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod
  rm -f $pkgdir/usr/lib/modules/${kernver}/{source,build}
  # sed expression for following substitutions
  local _subst="
        s|%PKGBASE%|${pkgbase}|g
        s|%KERNVER%|${kernver}|g
  "
  # install pacman hook
  sed "${_subst}" ../70-uml.hook |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/70-uml.hook"
}

pkgname=("${pkgbase}" "${pkgbase}-modules")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
