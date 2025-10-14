# Maintainer: ernest <307141632@qq.com>
pkgname=coremail
pkgdesc="Coremail 邮箱客户端 安全省心，轻松连通世界" 
pkgver=4.2.1
pkgrel=1427
arch=('x86_64')
url="https://www-lunkr.coremail.cn/"
license=('LicenseRef-coremail')
source=("https://lunkrcdn.icoremail.net/cab/publish/lunkr4mail/cn.coremail.cmclient-ubuntu_${pkgver}-${pkgrel}_amd64.ubuntu.deb")
md5sums=('4b37ad3c5048634932c46b57847e9de8')
options=('!strip' '!debug')
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

prepare() {
    mv "cn.coremail.cmclient-ubuntu_${pkgver}-${pkgrel}_amd64.ubuntu.deb" "${pkgver}.deb"
    ar -x "${pkgver}.deb"
    mkdir -p "${pkgname}-${pkgver}"
    tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
    cd "$pkgname-$pkgver"
    cp -r ./ ${pkgdir}/
    
    # 安装图标到hicolor主题
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    if [ -f "${pkgdir}/opt/apps/cmclient/entries/icons/cmclient.svg" ]; then
        cp "${pkgdir}/opt/apps/cmclient/entries/icons/cmclient.svg" \
           "${pkgdir}/usr/share/icons/hicolor/scalable/apps/coremail.svg"
    fi
    
    # 修改desktop文件，添加Path
    find "${pkgdir}" -name "*.desktop" -type f -exec \
        sed -i 's/Icon=.*/Icon=coremail/' {} \;
    find "${pkgdir}" -name "*.desktop" -type f -exec \
        sed -i '/^Exec=/i Path=/opt/apps/cmclient/files/' {} \;
    
    # 解决 Wayland 兼容性问题
    sed -i '/^[[:space:]]*export LD_LIBRARY_PATH/i \
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then\
  export GDK_BACKEND=x11\
fi' "${pkgdir}/opt/apps/cmclient/files/cmclient.sh"
}
