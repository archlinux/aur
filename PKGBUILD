pkgname=easyconnect-zju
pkgver=7.6.3.7
pkgrel=3
pkgdesc="Accessing ZJU's network resources over vpn connection."
arch=('x86_64')
url="https://rvpn.zju.edu.cn/"
license=('custom')
depends=('glib2-devel')
conflicts=('easyconnect' 'easyconnect-hust')
install=${pkgname}.install
# freetype2 2.15.0 (2026-10-17) 改了 FT_Face 内部布局，EasyConnect 内置的 HarfBuzz 1.3.1
# 在 hb_face_get_glyph_count 里读到野指针，启动/渲染进程直接 SIGSEGV。
# 打包 2.14.3 的 libfreetype，靠二进制自带的 RPATH=$ORIGIN 优先加载。
_freetypever=2.14.3-1
# HarfBuzz 15.0.0 (2026-10-28) 改了 hb_face_t 布局，同样会和内置的静态 1.3.1 冲突。
# 锁在最后的 14.x。
_harfbuzzver=14.6.0-1
# 重命名下载的包以带上版本号，避免更新时缓存冲突
source=("EasyConnect_x64_${pkgver}.deb::http://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_01/EasyConnect_x64.deb"
        "https://mirror.nju.edu.cn/gnome/sources/pango/1.42/pango-1.42.4.tar.xz"
        "freetype2-${_freetypever}-x86_64.pkg.tar.zst::https://archive.archlinux.org/packages/f/freetype2/freetype2-${_freetypever}-x86_64.pkg.tar.zst"
        "harfbuzz-${_harfbuzzver}-x86_64.pkg.tar.zst::https://archive.archlinux.org/packages/h/harfbuzz/harfbuzz-${_harfbuzzver}-x86_64.pkg.tar.zst")
md5sums=('3d8c1adaf61b01ab49f68e331b0ec0d5'
         'deb171a31a3ad76342d5195a1b5bbc7c'
         'SKIP'
         'SKIP')
sha256sums=('SKIP'
            'SKIP'
            'fcaa410420dea42779d02aa76f1cc95d8430bdc52071ac6219d33306899b8655'
            'b24ae38babb699f2abb8b0503803621905606f586c86623cb431d452567281d6')
noextract=("freetype2-${_freetypever}-x86_64.pkg.tar.zst"
           "harfbuzz-${_harfbuzzver}-x86_64.pkg.tar.zst")

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

    # 旧版 freetype 放到 EasyConnect 目录下，RPATH=$ORIGIN 会优先加载它
    mkdir -p "${srcdir}/freetype"
    bsdtar -xf "${srcdir}/freetype2-${_freetypever}-x86_64.pkg.tar.zst" -C "${srcdir}/freetype"
    install -Dm755 "${srcdir}/freetype/usr/lib/libfreetype.so.6.20.6" \
        "${pkgdir}/usr/share/sangfor/EasyConnect/libfreetype.so.6.20.6"
    ln -sfn libfreetype.so.6.20.6 "${pkgdir}/usr/share/sangfor/EasyConnect/libfreetype.so.6"

    # 同理锁住 HarfBuzz 14.x
    mkdir -p "${srcdir}/harfbuzz"
    bsdtar -xf "${srcdir}/harfbuzz-${_harfbuzzver}-x86_64.pkg.tar.zst" -C "${srcdir}/harfbuzz"
    _hblib=$(basename "${srcdir}/harfbuzz/usr/lib/libharfbuzz.so.0."*)
    install -Dm755 "${srcdir}/harfbuzz/usr/lib/${_hblib}" \
        "${pkgdir}/usr/share/sangfor/EasyConnect/${_hblib}"
    ln -sfn "${_hblib}" "${pkgdir}/usr/share/sangfor/EasyConnect/libharfbuzz.so.0"

    sed -i 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' "${pkgdir}/usr/share/applications/EasyConnect.desktop"
    install -D -m644 "${pkgdir}/usr/share/sangfor/EasyConnect/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
