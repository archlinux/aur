pkgname=zed-globalization
pkgver=1.23.2
pkgrel=2
pkgdesc="Zed editor with globalization support (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/x6nux/zed-globalization"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'GPL-3.0-or-later')
provides=('zedg' 'zed')
conflicts=('zedg' 'zed')
options=('!strip' '!debug')

source_x86_64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-aarch64-v${pkgver}.tar.gz")

sha256sums_x86_64=('5356a5c556e60641098fda7382ea462975822327e59de7ee7b852862fd0fb9aa')
sha256sums_aarch64=('2da95afeaf8924c622747ec25d32ac829d8841fdd003934ea983d68ea829bd66')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"

  # CLI:直接改名顶替成 zed(真实文件,不是软链)
  rm -f "${pkgdir}/usr/bin/zed"
  mv "${pkgdir}/usr/libexec/zedg" "${pkgdir}/usr/bin/zed"

  # 主程序:改名成 CLI 默认查找的 zed-editor。
  # 放 /usr/libexec 而不是 /usr/lib/zed,是为了让二进制内置的
  # RPATH ($ORIGIN/../lib/zedg) 仍然解析到 /usr/lib/zedg(libgit2 所在处)。
  mv "${pkgdir}/usr/bin/zedg" "${pkgdir}/usr/libexec/zed-editor"

  # 上游多余的产物:指向主程序的软链,以及已无用的激活脚本
  rm -f "${pkgdir}/usr/libexec/zed-cli" "${pkgdir}/usr/bin/zedg-activate"

  # 若还想保留 `zedg` 这个命令名,再放一份 CLI(约 3MB):
  # install -Dm755 "${pkgdir}/usr/bin/zed" "${pkgdir}/usr/bin/zedg"

  # 桌面条目:必须调用 CLI(主程序在 Linux 上不会把打开请求转发给已运行实例),
  # 同时修正 TryExec 与 MimeType
  mv "${pkgdir}/usr/share/applications/zedg.desktop" \
     "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i -e 's|^Exec=.*|Exec=zed %F|' \
         -e 's|^TryExec=.*|TryExec=zed|' \
     "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i 's|^MimeType=text/plain;$|MimeType=text/plain;inode/directory;|' \
     "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
}
