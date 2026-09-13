pkgname=easyconnect-zju
pkgver=7.6.3.7
pkgrel=1
pkgdesc="Accessing ZJU's network resources over vpn connection."
arch=('x86_64')
url="https://rvpn.zju.edu.cn/"
license=('custom')
depends=('glib2-devel')
conflicts=('easyconnect' 'easyconnect-hust')
install=${pkgname}.install
# 重命名下载的包以带上版本号，避免更新时缓存冲突
source=("EasyConnect_x64_${pkgver}.deb::http://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_01/EasyConnect_x64.deb"
        "https://mirror.nju.edu.cn/gnome/sources/pango/1.42/pango-1.42.4.tar.xz")
md5sums=('3d8c1adaf61b01ab49f68e331b0ec0d5'
         'deb171a31a3ad76342d5195a1b5bbc7c')

build() {
    # makepkg 会自动解压 .tar.xz 源码包，无需手动 tar xf
    cd "${srcdir}/pango-1.42.4"
    ./configure --prefix=/usr
    # 直接使用 make，它会自动继承 /etc/makepkg.conf 中的 MAKEFLAGS (如 -j$(nproc)) 实现自适应多线程编译
    make
}

package() {
    # makepkg 会自动从 deb 中解压出 data.tar.gz 或 data.tar.xz，使用通配符自适应后缀
    tar xf "${srcdir}"/data.tar.* -C "${pkgdir}"
    
    cd "${srcdir}/pango-1.42.4"
    make DESTDIR="${pkgdir}/usr/share/sangfor/EasyConnect/oldlib/pango" install
    
    sed -i 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' "${pkgdir}/usr/share/applications/EasyConnect.desktop"
    install -D -m644 "${pkgdir}/usr/share/sangfor/EasyConnect/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
