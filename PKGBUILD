pkgname=wechat-beta-bwrap-qt5ct
pkgver=1.0.0.145
pkgrel=7
uosver=2.1.5
pkgdesc="WeChat Beta with bwrap sandbox"
conflicts=('wechat-beta-bwrap' 'wechat-uos-bwrap')
PKGEXT='.pkg.tar.xz'
COMPRESSXZ=(xz -c -z - --threads=0)
options=('!strip' '!emptydirs')
arch=('x86_64')
license=('proprietary')
depends=('nss' 'xdg-utils' 'libxss' 'libnotify' 'bubblewrap' 'xdg-desktop-portal' 'openssl-1.1' 'lsb-release' 'qt5ct')
makedepends=('dpkg' 'aria2')
# home-store-packages.uniontech.com too slow so use aria2 multi-thread download
DLAGENTS=('https::/usr/bin/aria2c --no-conf -x 16 -o %o %u')
source=(
    wechat.sh
    wechat-beta.desktop
    wechat-beta.svg
    license.tar.gz
    "wechat-uos-amd64.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${uosver}_amd64.deb"
    "wechat-beta-amd64.deb::https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_${pkgver}_amd64.deb"
)

md5sums=('eb7f2e49d0516e90bacea3962395469c'
         '4967385a00db424e596263618335411f'
         'bb30c4e0c5b55f33c262fe34e4a026df'
         '6b159c6e9d21a98925489bc37a9aea43'
         '27d585e8fc57950ed4f4f3ffc036447f'
         '1da072bd774d1b5c08b9545b409e3fcb')

prepare() {
    mkdir -p "$srcdir/wechat-uos"
    dpkg -x "${srcdir}/wechat-uos-amd64.deb" "$srcdir/wechat-uos"
}

package() {
    dpkg -x "wechat-beta-amd64.deb" "$pkgdir"

    # Fixing licenses
    install -d "$pkgdir/usr/share/wechat-uos"
    cp -r license/etc "$pkgdir/usr/share/wechat-uos"
    cp -r license/var "$pkgdir/usr/share/wechat-uos"
    install -Dm644 "$srcdir/wechat-uos/usr/lib/license/libuosdevicea.so" "$pkgdir/usr/lib/license/libuosdevicea.so"

    # Clean unused file
    rm -f "$pkgdir/usr/share/applications/wechat.desktop"

    # Installing stuff in place
    install -Dm644 wechat-beta.desktop "$pkgdir/usr/share/applications/wechat-beta.desktop"
    install -Dm755 wechat.sh "$pkgdir/usr/bin/wechat-beta"
    install -Dm644 wechat-beta.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wechat-beta.svg"
}
