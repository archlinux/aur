# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=linux-usermode-nokmod
_kernelname=-user
_major=5.14
_minor=15
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=1
pkgdesc="User mode Linux kernel, without modules"
arch=('x86_64')
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
makedepends=('bc' 'inetutils')
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.sign"
        'config')

sha256sums=('74f39a0c69e9d7c94d290515645396725e3ce3667b85baf4b3c3f6f303c7a406'
            'SKIP'
            '5114673d1e8293a49d5870d29f257f9f853913c9f959f389798556b9215a81d7')

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

  make ARCH=um kernelrelease > version
  echo "Prepared $pkgname version $(<version)"

  echo "Save configuration for later reuse"
  cat .config > "${startdir}/config.last"
}

build() {
  cd ${_srcname}
  unset LDFLAGS CFLAGS
  make ARCH=um vmlinux
}

package() {
  cd ${_srcname}
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/kernel-usermode"
  install -m 644 System.map ${pkgdir}/usr/share/kernel-usermode/System.map
  install -m 755 vmlinux ${pkgdir}/usr/bin/
}
