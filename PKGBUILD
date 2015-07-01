#Maintainer : mark@markelee.com
#Contributor: mark@markelee.com

pkgname='liveroot'
url='https://github.com/bluerider/liveroot.git'
pkgdesc='Initcpio hooks for non persistent boot'
pkgver=21
pkgrel=1
arch=('any')
depends=('util-linux' 'rsync')
makedepends=('git')
license=('GPL3')
source=("git+$url")
sha256sums=('SKIP')
install="${pkgname}.install"

prepare() {
   echo "Do you want to use the static compiler?"
   echo "b|B : btrfs specific"
   echo "y|Y : use compiler"
   echo "n|N : use standard oroot hook" 
   read ans
   case $ans in
    b|B)
      bash "${srcdir}/${pkgname}/compiler" btrfs &&
      mv ${srcdir}{,/${pkgname}/initcpio/hooks}/oroot &&
      mv "${srcdir}/oroot_install" "${srcdir}/${pkgname}/initcpio/install/oroot" &&
      msg "Compiled oroot for btrfs" ||
      msg "Failed to compile oroot"
      ;;
    y|Y)
      bash "${srcdir}/${pkgname}/compiler" &&
      mv ${srcdir}{,/${pkgname}/initcpio/hooks}/oroot &&
      mv "${srcdir}/oroot_install" "${srcdir}/${pkgname}/initcpio/install/oroot" &&
      msg "Compiled oroot" ||
      msg "Failed to compile oroot"
      ;;
    n|N)
     msg "Using default oroot hook"
     ;;
   esac;
}

package() {
  install -m755 -d "${pkgdir}/usr/lib/initcpio/hooks"
  install -m755 -d "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/${pkgname}/initcpio/hooks/oroot" "${pkgdir}/usr/lib/initcpio/hooks"
  install -m644 "${srcdir}/${pkgname}/initcpio/install/oroot" "${pkgdir}/usr/lib/initcpio/install"
  install -m755 -d "${pkgdir}/etc/modprobe.d"
  echo "options zram num_devices=$[$(nproc)+2]" > "/${pkgdir}/etc/modprobe.d/zram.conf"
  install -m755 -d "${pkgdir}/usr/share/liveroot"
  install -m644 "${srcdir}/${pkgname}/examples/mkinitcpio.conf.example" "${pkgdir}/usr/share/liveroot"
  install -m644 "${srcdir}/${pkgname}/examples/syslinux.cfg.example" "${pkgdir}/usr/share/liveroot"
}
