# Maintainer: graysky <graysky AT archlinux DOT us>
 
pkgname=distccd-x86_64
arch=(armv7h aarch64)
_date=20200417
# inspect source tarball under $name/share/gcc-x.y.z
pkgver=9.3.0.$_date
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
sha256sums=('23e791054de2b2599699482fdd880066c9d03758f9e38eb4634dc571cb90959e'
            'ea406b82e10b7084192d0a480ec24ee889a6a592ea3e339dc81cf3a6f1058bf9')
sha256sums_armv7h=('fcceedd50c7e9f3f441f8407b650e0308e937d62f0a49ea3945e26ca655565ca'
                   'SKIP')
sha256sums_aarch64=('acab4c8ffeb253d09dea86f222fb31a7429a471bc69ba43ba97b1eb962e069ba'
                    'SKIP')

package() {
  # install symlink to distccd
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/bin/distccd "${pkgdir}/usr/bin/distccd-x86_64"

  # install whitelist for toolchain new for v3.3
  install -d "${pkgdir}/usr/lib/distcc"

  _targets=(c++ cc clang clang++ cpp g++ gcc)
  for bin in "${_targets[@]}"; do
    ln -sf /usr/bin/distcc "${pkgdir}/usr/lib/distcc/x86_64-pc-linux-gnu-$bin"
  done

  # install service and config
  install -Dm644 "${srcdir}/distccd-x86_64.service" \
    "${pkgdir}/usr/lib/systemd/system/distccd-x86_64.service"
  install -Dm644 "${srcdir}/distccd-x86_64.config" \
    "${pkgdir}/etc/conf.d/distccd-x86_64"

  # copy in toolchain
  install -d "${pkgdir}/opt"
  bsdtar -x --uid 0 --gid 0 -f "${srcdir}/x-tools86-$CARCH-$_date.tar.zst" -C "${pkgdir}/opt/"
}

