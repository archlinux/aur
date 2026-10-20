pkgname=zed-globalization
pkgver=1.24.4
pkgrel=3
pkgdesc="Zed editor with globalization support (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/x6nux/zed-globalization"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'GPL-3.0-or-later')
# 只提供 zedg 命令:不再安装 /usr/bin/zed,故不再 provide zed。
# 但仍需与官方 zed 包冲突——两者都会安装 dev.zed.Zed.desktop。
provides=('zedg')
conflicts=('zedg' 'zed')
options=('!strip' '!debug')

source_x86_64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-aarch64-v${pkgver}.tar.gz")

sha256sums_x86_64=('f5b325655b0eafe5200cbf8cae6e557ff1f201fd744849cd893121e5f52db492')
sha256sums_aarch64=('52a857a3754497f1616ed202b91585b57bedf432e3a75074411652a226e3aa2c')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"

  # 主程序:改名成 CLI 固定查找的 zed-editor。
  # 必须先移动,腾出 usr/bin/zedg 这个名字给下面的 CLI。
  # 放 /usr/libexec 而不是 /usr/lib/zed,是为了让二进制内置的
  # RPATH ($ORIGIN/../lib/zedg) 仍然解析到 /usr/lib/zedg(libgit2 所在处)。
  mv "${pkgdir}/usr/bin/zedg" "${pkgdir}/usr/libexec/zed-editor"

  # CLI:装成 /usr/bin/zedg(真实文件,不是软链)。
  # 不再占用 /usr/bin/zed —— ZFS 的 zed(ZFS Event Daemon,zfs-utils 装到
  # sbindir,而 Arch 上 /sbin -> /usr/bin)也落在 /usr/bin/zed,会文件冲突。
  # CLI 自身文件名无关紧要,它按 ../libexec/zed-editor 定位主程序。
  rm -f "${pkgdir}/usr/bin/zed"
  mv "${pkgdir}/usr/libexec/zedg" "${pkgdir}/usr/bin/zedg"

  # 上游多余的产物:指向 CLI 的软链,以及生态兼容开关脚本
  rm -f "${pkgdir}/usr/libexec/zed-cli" "${pkgdir}/usr/bin/zedg-activate"

  # 桌面条目:必须调用 CLI(主程序在 Linux 上不会把打开请求转发给已运行实例)。
  # 上游桌面项本就用 Exec=zedg,这里按 FreeDesktop 改名并补 MimeType。
  mv "${pkgdir}/usr/share/applications/zedg.desktop" \
     "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i -e 's|^Exec=.*|Exec=zedg %F|' \
         -e 's|^TryExec=.*|TryExec=zedg|' \
     "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i 's|^MimeType=text/plain;$|MimeType=text/plain;inode/directory;|' \
     "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
}
