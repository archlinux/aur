# Maintainer: graysky <therealgraysky AT protonmail DOT com>
 
pkgname=distccd-x86_64
arch=(armv7h aarch64)
_date=20220531
# inspect source tarball under $name/share/gcc-x.y.z
pkgver=12.1.0.$_date
pkgrel=1
license=('GPL' )
url="https://github.com/graysky2/crosstool-ng_for_distcc"
pkgdesc="Toolchain for x86_64 builds on Arch ARM volunteers via distcc"
depends=('distcc')
options=('libtool' 'emptydirs' '!strip')
source_armv7h=("http://repo-ck.com/PKG_source/x-tools86-armv7h-$_date.tar.zst"{,.sig})
source_aarch64=("http://repo-ck.com/PKG_source/x-tools86-aarch64-$_date.tar.zst"{,.sig})
source=(distccd-x86_64.{service,config})
noextract=("x-tools86-armv7h-$_date.tar.zst"
"x-tools86-aarch64-$_date.tar.zst")
backup=(etc/conf.d/distccd-x86_64)
install=readme.install
validpgpkeys=(
'4E22BB637E26407D5DEE550988A032865EE46C4C' # graysky
)
b2sums=('86124551b3ad8abd9c26c6225c3a79cddccf13142f8a8764f71a84331c03426529eebdd9a7dd2048e2da3b69192c54b572031ce127b983671d84d92940688821'
        '964d1f584c0d26a6a720edabcf0f7293949cf247d1ebecb87534cfb90e84493c6f2e97f23bd55090d774f8d136fdf33bc571d0927bb54893895bdf55e2f0a958')
b2sums_armv7h=('0df8f6d450c00e94af59b352010c434283243eaa7b97908d6afff4f5ad3966a942c09000d8c8713b317065f68e0e3b1e77306521933c006034f2c9d695abd42f'
               'SKIP')
b2sums_aarch64=('477a819993307a44221668dc75a7c41df0a2bc69dd547a955849442b21d6cefa3a7c2fe18f9e455aeabd5e59dc9431a0e03515792386b7b71c59ea7787daf98a'
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

  # FS#67629 - since distcc is a dependency there is no need to provide a sysuser.d config

  # install service and config
  install -Dm644 "${srcdir}/distccd-x86_64.service" \
    "${pkgdir}/usr/lib/systemd/system/distccd-x86_64.service"
  install -Dm644 "${srcdir}/distccd-x86_64.config" \
    "${pkgdir}/etc/conf.d/distccd-x86_64"

  # copy in toolchain
  install -d "${pkgdir}/opt"
  bsdtar -x --uid 0 --gid 0 -f "${srcdir}/x-tools86-$CARCH-$_date.tar.zst" \
    -C "${pkgdir}/opt/"
}
