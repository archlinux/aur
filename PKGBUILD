# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=(distccd-x86_64)
_date=20191103
# inspect source tarball under $name/share/gcc-x.y.z
pkgver=9.2.0
pkgrel=1
arch=('armv7h')
license=('GPL' )
pkgdesc="Toolchain for x86_64 builds via distcc on Arch ARM armv7h volunteers"
url="https://archlinuxarm.org/wiki/Distcc_Cross-Compiling"
depends=('distcc')
options=('libtool' 'emptydirs' '!strip')
source=(
https://olegtown.pw/Public/ArchLinuxArm/x-tools86.tar.xz
distccd-x86_64.{service,config}
)
install=readme.install
noextract=(x-tools86.tar.xz)
backup=(etc/config.d/distccd-x86_64)
sha256sums=('2591533531e889090c621ffb27d78481283b33990bf60e31044ce29bf771d4a3'
            '23e791054de2b2599699482fdd880066c9d03758f9e38eb4634dc571cb90959e'
            'ea406b82e10b7084192d0a480ec24ee889a6a592ea3e339dc81cf3a6f1058bf9')

package() {
  # install symlink to distccd
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/bin/distccd "${pkgdir}/usr/bin/distccd-x86_64"

  # install whitelist for toolchain new for v3.3
  install -d "${pkgdir}/usr/lib/distcc"
  for bin in c++ cc cpp g++ gcc; do
    ln -sf /usr/bin/distcc "${pkgdir}/usr/lib/distcc/x86_64-pc-linux-gnu-$bin"
  done

  # copy in toolchain
  install -d "${pkgdir}/opt"
  bsdtar -xpf "${srcdir}/x-tools86.tar.xz" -C "${pkgdir}/opt/"

  # fix permissions problem in packaging
  chmod 555 "${pkgdir}/opt/x-tools86/x86_64-pc-linux-gnu/bin"

  # install service and config
  install -Dm644 "${srcdir}/distccd-x86_64.service" \
    "${pkgdir}/usr/lib/systemd/system/distccd-x86_64.service"
  install -Dm644 "${srcdir}/distccd-x86_64.config" \
    "${pkgdir}/etc/conf.d/distccd-x86_64"
}
