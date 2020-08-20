# Maintainer: graysky <graysky AT archlinux DOT us>
 
pkgname=distccd-x86_64
arch=(armv7h aarch64)
_date=20200812
# inspect source tarball under $name/share/gcc-x.y.z
pkgver=10.2.0.$_date
pkgrel=2
license=('GPL' )
url="https://github.com/graysky2/crosstool-ng_for_distcc"
pkgdesc="Toolchain for x86_64 builds on Arch ARM volunteers via distcc"
depends=('distcc')
options=('libtool' 'emptydirs' '!strip')
source_armv7h=("http://repo-ck.com/PKG_source/x-tools86-armv7h-$_date.tar.zst"{,.sig})
source_aarch64=("http://repo-ck.com/PKG_source/x-tools86-aarch64-$_date.tar.zst"{,.sig})
source=(distccd-x86_64.{service,config}
  sysusers.conf)
noextract=("x-tools86-armv7h-$_date.tar.zst"
"x-tools86-aarch64-$_date.tar.zst")
backup=(etc/conf.d/distccd-x86_64)
install=readme.install
validpgpkeys=(
'4E22BB637E26407D5DEE550988A032865EE46C4C' # graysky
)
b2sums=('55206b1b7aceb046cd049db2dbc73ad603807eabad392ab68d97f5181e12a581548a1c3281b037dec1bd3627c04dc25e1417681b11fdfcb17842eeec2b469c45'
        '964d1f584c0d26a6a720edabcf0f7293949cf247d1ebecb87534cfb90e84493c6f2e97f23bd55090d774f8d136fdf33bc571d0927bb54893895bdf55e2f0a958'
        'd1b057ce49994ac61e9d5a861c1c770452102300d47a9c396b3272d7f5afbd3fe3e865e6db11c046e73ae3b6886bc8970a10624650731d55132362436904f989')
b2sums_armv7h=('298a5ed0f1007073f056ae157d53376f7c850ffecd541735883de6c1cef6e777a75d1b43704dad0330e40fdf48e47a574a5180d5bd047b331fc818ff162e5ba8'
               'SKIP')
b2sums_aarch64=('6233bbf5cbe14012f18f60a91f65b9095b6398d8c14176a534d22eddfdfb5e889845ef5a321044cbb77ffef6197cbaf2876db24e67b31d53aae5b6d9d1d2f354'
                'SKIP')

package() {
  # install symlink to distccd
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/bin/distccd "${pkgdir}/usr/bin/distccd-x86_64"

  # install whitelist for toolchain new for v3.3
  install -d "${pkgdir}/usr/lib/distcc"

  # currently no clang support
  # https://github.com/crosstool-ng/crosstool-ng/issues/652
  _targets=(c++ cc cpp g++ gcc)
  for bin in "${_targets[@]}"; do
    ln -sf /usr/bin/distcc "${pkgdir}/usr/lib/distcc/x86_64-pc-linux-gnu-$bin"
  done

 # FS#67629
 install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/distccd.conf"

  # install service and config
  install -Dm644 "${srcdir}/distccd-x86_64.service" \
    "${pkgdir}/usr/lib/systemd/system/distccd-x86_64.service"
  install -Dm644 "${srcdir}/distccd-x86_64.config" \
    "${pkgdir}/etc/conf.d/distccd-x86_64"

  # copy in toolchain
  install -d "${pkgdir}/opt"
  bsdtar -x --uid 0 --gid 0 -f "${srcdir}/x-tools86-$CARCH-$_date.tar.zst" -C "${pkgdir}/opt/"
}
