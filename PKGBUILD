# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: zhullyb < zhullyb [at] outook dot com >
# Contributor: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-gaozhangmin-bin
url="https://github.com/gaozhangmin/aliyunpan"
pkgrel=1
pkgver=3.11.26
pkgdesc="阿里云盘小白羊版，gaozhangmin's fork"
arch=("any")
license=("MIT")
_electron=electron
depends=("$_electron" 'aria2' 'alist-bin')
optdepends=('mpv: media preview support')
provides=("aliyunpan-odomu")
conflicts=("aliyunpan-odomu")
source=(
  "${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-amd64.deb"
  "aliyunpan-gaozhangmin.desktop"
)
sha256sums=('7f2b5da6d68ddcf666fb373989162a3d03fd4cd97d812238eade7db1cf7b980d'
            '8dc19ab03306c3498b30659ebd8c1922e9145dd6b7851207f645bc33806ad63b')


prepare() {
tar -xf data.tar.xz -C "${srcdir}"
cat >aliyunpan-gaozhangmin.sh <<EOF
#!/bin/sh
set -eu

export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_IS_DEV=0

exec $_electron --no-sandbox /usr/lib/aliyunpan-gaozhangmin/app.asar "\$@"

EOF
mv aliyunpan-gaozhangmin.desktop ${srcdir}/usr/share/applications
}

package() {
  install -Dm644 ${srcdir}/opt/小白羊云盘/resources/app.asar -t ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/
  cp -a ${srcdir}/opt/小白羊云盘/resources/crx/ ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/

  mkdir -p ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/engine
  install -Dm644 ${srcdir}/opt/小白羊云盘/resources/engine/aria2.conf -t ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/engine/
  ln -s /usr/bin/aria2c ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/engine/
  ln -s /usr/bin/alist ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/engine/
  
  cp -a ${srcdir}/opt/小白羊云盘/resources/images/ ${pkgdir}/usr/lib/aliyunpan-gaozhangmin/
  mkdir -p ${pkgdir}/usr/share/icons
  ln -s /usr/lib/aliyunpan-gaozhangmin/images/icon_256x256.png ${pkgdir}/usr/share/icons/aliyunpan-gaozhangmin.png

  install -Dm644 ${srcdir}/usr/share/applications/aliyunpan-gaozhangmin.desktop -t ${pkgdir}/usr/share/applications/
  install -Dm755 ${srcdir}/aliyunpan-gaozhangmin.sh ${pkgdir}/usr/bin/aliyunpan-gaozhangmin
}
