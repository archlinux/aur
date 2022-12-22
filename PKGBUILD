# Maintainer: Nate Levesque <public@thenaterhood.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
# Source : new application - https://forums.insynchq.com

pkgname=insync
pkgver=3.8.4.50481
pkgrel=1
_dist=buster
pkgdesc="An unofficial Google Drive and OneDrive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('adobe-source-code-pro-fonts'
         'alsa-lib'
         'fontconfig'
         'glibc'
         'hicolor-icon-theme'
         'libglvnd'
         'nss'
         'xdg-utils'
         'libxcrypt'
)
optdepends=(
         'lib32-libappindicator-gtk2: Required for tray icon in some configurations'
)
arch=('x86_64')
source=("http://cdn.insynchq.com/builds/linux/${pkgname}_${pkgver}-${_dist}_amd64.deb"
    'insync@.service'
    'insync.service')
sha256sums=('2a2d8fab1c067b467abeb7d9fd1f656c6b997fe934fb4546431d6c0a711d35ee'
            'cf276c1dbf1592ea63a21c2d61c75f7ad6ec3b13e87b3aaa331e9c14799f4598'
            '1432141539a6b3c5333631a2ee6696fab9bd2fe8770643bc670d95e4e96203e0')
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
   install -dm755  ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0
   ln -s /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
   echo "-> Patching https://forums.insynchq.com/t/crash-when-changing-sync-folders-linux-with-solution/17254/4"
   mv ${pkgdir}/usr/lib/insync/libgdk_pixbuf-2.0.so.0{,.bak}
   echo "-> Patching https://forums.insynchq.com/t/crash-changing-sync-directory-with-fix/17364/10"
   mv ${pkgdir}/usr/lib/insync/libpangoft2-1.0.so.0{,.bak}
   echo "-> Patching https://forums.insynchq.com/t/gui-is-broken-on-arch-for-3-7-7-with-workaround/18434"
   mv ${pkgdir}/usr/lib/insync/libstdc++.so.6{,.bak}
   echo "-> Patching https://forums.insynchq.com/t/workaround-for-libcrypt-so-1-issue-on-3-7-9-for-arch/18504"
   ln -s /usr/lib/libcrypt.so.2 ${pkgdir}/usr/lib/insync/libcrypt.so.1
}
