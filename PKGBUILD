# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=rustmusic
pkgver=0.7.2
pkgrel=1
pkgdesc="A high-performance music player built with Rust and Tauri"
arch=('x86_64')
url="https://github.com/LingyunStudio/RustMusic"
license=('Apache-2.0')
# 按二进制的 NEEDED 逐条列出；libsoup3 由 webkit2gtk-4.1 传递引入但也被直接链接，
# 依「depends 应列出所有直接依赖」仍显式声明
depends=('alsa-lib' 'cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!debug')
# deb 内不含 LICENSE，走 main 分支而非 v${pkgver}：版本升级后 updater 不会更新
# 无架构后缀的 source=，锚定 tag 会让 LICENSE 永久停在旧版本，旧 tag 删除还会断构建
source=("LICENSE::https://raw.githubusercontent.com/LingyunStudio/RustMusic/main/LICENSE")
# 写完整字面 URL：updater 遇到含 shell 变量的 URL 会跳过更新
# （pkgbuild_editor._update_source_field），用 ${pkgver} 模板会让
# update_source_url 静默失效。上游文件名含版本号，SRCDEST 不会命中旧缓存
source_x86_64=("https://github.com/LingyunStudio/RustMusic/releases/download/v0.7.2/RustMusic_0.7.2_amd64.deb")
b2sums=('5c150ef6311a8c820b2a1e29315c03569adf9fc25072f65d2e3110262455eb49ea0cff7d13862abe596c82644a99586559ff89a47deee438518d8081e6c351cc')
b2sums_x86_64=('9739817f4ab0601ada08a774a2f896832f168fceabd1e31e04dea4e8e95b1cb3984b8cfd522d5b08790b43a6e98bb739077abcb5be2cfc1811af4fbdd82fd0bb')

package() {
    # 数据层是 data.tar.gz（非 xz），按解包后实际出现的文件名取
    bsdtar --no-same-owner -xf data.tar.gz -C "${pkgdir}/"

    # 上游 desktop 的 Categories 为空（菜单无法归类），补成音频播放器分类；
    # 文件名改为 pkgname 以与 AUR 包名一致
    sed -i 's|^Categories=.*|Categories=AudioVideo;Audio;Player;|' \
        "${pkgdir}/usr/share/applications/RustMusic.desktop"
    mv "${pkgdir}/usr/share/applications/RustMusic.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
