# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=(distccd-x86_64)
_date=20191105
# inspect source tarball under $name/share/gcc-x.y.z
pkgver=9.2.0
pkgrel=2
arch=('armv7h')
license=('GPL' )
pkgdesc="Toolchain for x86_64 builds via distcc on Arch ARM armv7h volunteers"
url="https://archlinuxarm.org/wiki/Distcc_Cross-Compiling"
depends=('distcc')
options=('libtool' 'emptydirs' '!strip')
source=("http://repo-ck.com/PKG_source/x-tools86-$_date.tar.zst"{,.sig}
         http://repo-ck.com/PKG_source/x-tools86-20191105.tar.zst
distccd-x86_64.{service,config}
)
install=readme.install
noextract=("x-tools86-$_date.tar.zst")
backup=(etc/config.d/distccd-x86_64)
validpgpkeys=(
'4E22BB637E26407D5DEE550988A032865EE46C4C' # graysky
)
sha256sums=('6511c4da8cd4a795d191934bdbebccaec608492dc82703c580631981cb778f18'
            'SKIP'
            '6511c4da8cd4a795d191934bdbebccaec608492dc82703c580631981cb778f18'
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
  bsdtar -xf "${srcdir}/x-tools86-$_date.tar.zst" -C "${pkgdir}/opt/"

  # install service and config
  install -Dm644 "${srcdir}/distccd-x86_64.service" \
    "${pkgdir}/usr/lib/systemd/system/distccd-x86_64.service"
  install -Dm644 "${srcdir}/distccd-x86_64.config" \
    "${pkgdir}/etc/conf.d/distccd-x86_64"
}
