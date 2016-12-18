#Maintainer : mark@markelee.com
#Contributor: mark@markelee.com

pkgname='liveroot'
url='https://github.com/bluerider/liveroot.git'
pkgdesc='Initcpio hooks for non persistent boot'
pkgver=30
pkgrel=1
real_ver=1.0
arch=('any')
depends=('util-linux' 'rsync')
makedepends=('git')
license=('GPL3')
source=("${url//.git/}/archive/${real_ver}.tar.gz")
sha256sums=('652b01fdfa45a97f35a9ec52b11cb229efd7552ebee88a4c429edff33c4d501b')
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
  install -m644 "${srcdir}/${pkgname}-${real_ver}/initcpio/hooks/oroot" "${pkgdir}/usr/lib/initcpio/hooks"
  install -m644 "${srcdir}/${pkgname}-${real_ver}/initcpio/install/oroot" "${pkgdir}/usr/lib/initcpio/install"
  install -m755 -d "${pkgdir}/etc/modprobe.d"
  echo "options zram num_devices=$[$(nproc)+2]" > "/${pkgdir}/etc/modprobe.d/zram.conf"
  install -m755 -d "${pkgdir}/usr/share/liveroot"
  install -m644 "${srcdir}/${pkgname}-${real_ver}/examples/mkinitcpio.conf.example" "${pkgdir}/usr/share/liveroot"
  install -m644 "${srcdir}/${pkgname}-${real_ver}/examples/syslinux.cfg.example" "${pkgdir}/usr/share/liveroot"
}
