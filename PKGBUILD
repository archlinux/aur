# Maintainer: graysky <graysky AT archlinux DOT us>
 
pkgname=distccd-x86_64
arch=(armv7h aarch64)
_date=20201217
# inspect source tarball under $name/share/gcc-x.y.z
pkgver=10.2.0.$_date
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
b2sums=('dfbc894ed5ea69e2a2c066a5afde8d28b9f71082b7fa0401887c0ef9612d6d6f45a51f73a523963819de074ff00cdc6ef23bbc2623d84c0e5b9c3d7cc5a360e1'
        '964d1f584c0d26a6a720edabcf0f7293949cf247d1ebecb87534cfb90e84493c6f2e97f23bd55090d774f8d136fdf33bc571d0927bb54893895bdf55e2f0a958')
b2sums_armv7h=('fbe35760ea4acefc9b4ba30ef792288e9f27f0ce33a4bf76215c272bb9b37e275edd879b85c9b0b6a4a5b8549df3ee600cc8252907f3bb2cc323b6c750a4731a'
               'SKIP')
b2sums_aarch64=('31c8c6eec0ed239af38d2fd78a9841a58310e3f8eef5ff480da818611cb563228c07da0c0bf0b9755b720f07a4f33f37c54e0a4a637d4f324010cd68972658d6'
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
  bsdtar -x --uid 0 --gid 0 -f "${srcdir}/x-tools86-$CARCH-$_date.tar.zst" -C "${pkgdir}/opt/"
}
