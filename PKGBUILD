# Maintainer: Nate Levesque <public@thenaterhood.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.4.5
_pkgver=37069
_dist=artful
pkgrel=1
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('xdg-utils' 'glibc' 'python2')
optdepends=(
    'sni-qt: system tray icon'
)
arch=('i686' 'x86_64')
source=('insync@.service' 'insync.service')
sha256sums=('cf276c1dbf1592ea63a21c2d61c75f7ad6ec3b13e87b3aaa331e9c14799f4598'
            '1432141539a6b3c5333631a2ee6696fab9bd2fe8770643bc670d95e4e96203e0')
sha256sums_i686=('a1c00cf9ea675f2811947e943cb81e729d0c9ced18b768b8598f3267302fe526')
sha256sums_x86_64=('a42cbf92ad26761152a74682435a41487058b9aa9f3867d8b1ce5573fc35717f')
source_i686=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-${_dist}_i386.deb")
source_x86_64=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-${_dist}_amd64.deb")
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   # Patch files for Arch
   echo "==> Patching files..."
   cd ${pkgdir}
   grep -R "/usr/bin/python" ./usr | cut -d':' -f1 | cut -d' ' -f1 | \
   while read -r file; do
      echo "Patch: $file"
      [ -f "$file" ] && sed -i "s|usr/bin/python$|usr/bin/python2|g" "$file" || :
   done
   # End of patching
   install -Dm644 ${srcdir}/insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 ${srcdir}/insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
   # insync provides its own libraries, so this appears to be unneeded
   # ln -sf "/usr/lib/libfontconfig.so.1" "${pkgdir}/usr/lib/insync/libfontconfig.so.1"
}
