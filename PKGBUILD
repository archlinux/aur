# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: zhullyb < zhullyb [at] outook dot com >
# Contributor: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-odomu-git
url="https://github.com/odomu/aliyunpan"
pkgrel=2
pkgver=r170.ef60c2b
pkgdesc="阿里云盘小白羊版，odomu's fork"
arch=("any")
license=("MIT")
_electron=electron
depends=("$_electron" 'aria2')
optdepends=('mpv: media preview support')
provides=("aliyunpan-odomu")
conflicts=("aliyunpan-odomu")
source=(
  "git+${url}.git"
  'aliyunpan-odomu.desktop'
)
sha256sums=(
  'SKIP'
  '2b9951837cb588bfed170609a1ef034c3ed87a72babea6e22964ff49c5783ecf'
)

pkgver() {
  cd $srcdir/aliyunpan
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  cat >aliyunpan-odomu.sh <<EOF
#!/bin/sh
set -eu

export ELECTRON_FORCE_IS_PACKAGED=true

exec $_electron --no-sandbox /usr/lib/aliyunpan-odomu/app.asar "\$@"

EOF

}

build(){
  cd ${srcdir}/aliyunpan
  yarn
  yarn run build:electron --linux dir
}

package(){
  install -Dm644 ${srcdir}/aliyunpan/release/linux-unpacked/resources/app.asar -t ${pkgdir}/usr/lib/aliyunpan-odomu/
  cp -a ${srcdir}/aliyunpan/release/linux-unpacked/resources/crx/ ${pkgdir}/usr/lib/aliyunpan-odomu/

  mkdir -p ${pkgdir}/usr/lib/aliyunpan-odomu/engine
  install -Dm644 ${srcdir}/aliyunpan/release/linux-unpacked/resources/engine/aria2.conf -t ${pkgdir}/usr/lib/aliyunpan-odomu/engine/
  ln -s /usr/bin/aria2c ${pkgdir}/usr/lib/aliyunpan-odomu/engine/

  cp -a ${srcdir}/aliyunpan/release/linux-unpacked/resources/images/ ${pkgdir}/usr/lib/aliyunpan-odomu/
  mkdir -p ${pkgdir}/usr/share/icons
  ln -s /usr/lib/aliyunpan-odomu/images/icon_256x256.png ${pkgdir}/usr/share/icons/aliyunpan-odomu.png
  
  install -Dm644 ${srcdir}/aliyunpan-odomu.desktop -t ${pkgdir}/usr/share/applications/
  install -Dm755 ${srcdir}/aliyunpan-odomu.sh ${pkgdir}/usr/bin/aliyunpan-odomu
}
