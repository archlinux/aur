# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# 上游是纯 JS 的 Typora 插件系统,发布 zip 内为 loader.js + loader.json + <版本>/core.js。
# 包内只安装共享只读副本到 /usr/share/typora-community-plugin/plugins。
# 首次修复旧版路径时,由 pre_upgrade 备份用户数据,用户按升级提示手动 cp;
# 后续版本通过用户目录中的符号链接跟随 pacman 更新。
# 由 /usr/bin/typora-community-plugin 把 loader <script> 注入
# /usr/share/typora/resources/window.html,并用 pacman hook 在 typora
# 升级覆盖 window.html 后重新注入(该文件属 typora 包,不能由本包拥有)。
pkgname=typora-community-plugin
pkgver=2.10.52
pkgrel=1
pkgdesc="Typora 社区插件系统:插件市场、命令面板、多标签工作区"
url="https://github.com/typora-community-plugin/typora-community-plugin"
arch=('any')
license=('MIT')
# 上游兼容表为 Typora v1.1.x - v1.14.x,这里跟随 AUR 上的 typora 版本下限
depends=('typora>=1.14.9')
install=typora-community-plugin.install
source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/typora-community-plugin.zip"
  "LICENSE.md::https://raw.githubusercontent.com/typora-community-plugin/typora-community-plugin/${pkgver}/LICENSE.md"
  'typora-community-plugin.sh'
  'typora-community-plugin.hook'
)
sha256sums=('9f25a883360297f853c2c737344ad8001e4b6b91a77de843c284d104de8e60f5'
            '731f5be0037576f31f566458da9817c261db3e8b8c5fc4703841005d5ac53823'
            'ccafa03d4982da3ca3eaebea538bd64d472383dd743b962c71bac0d02e038a62'
            '4a4cefac90a4fdf9ce3987ddd7819c00c28b5a99812a1997ff086bea5121d680')
noextract=("${pkgname}-${pkgver}.zip")

prepare() {
  # 上游 zip 无顶层目录,单独解压,避免与包内文件混在 $srcdir 根下
  install -d "${srcdir}/plugin"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" -C "${srcdir}/plugin"

  # 上游打包结构调整时立即失败,而不是装出一个加载不了的包
  local f
  for f in loader.js loader.json "${pkgver}/core.js" "${pkgver}/core.css" \
    "${pkgver}/locales/lang.en.json" "${pkgver}/locales/lang.zh-cn.json"; do
    [[ -f "${srcdir}/plugin/$f" ]] || {
      printf 'error: 上游 zip 结构变化,缺少 %s\n' "$f" >&2
      return 1
    }
  done
  grep -qF "\"coreVersion\":\"${pkgver}\"" "${srcdir}/plugin/loader.json" || {
    printf 'error: loader.json 的 coreVersion 与 pkgver 不一致,框架目录名会错\n' >&2
    return 1
  }
}

package() {
  local plugin_dir="${pkgdir}/usr/share/${pkgname}/plugins"

  install -Dm644 "${srcdir}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm755 "${srcdir}/typora-community-plugin.sh" \
    "${pkgdir}/usr/bin/typora-community-plugin"
  install -Dm644 "${srcdir}/typora-community-plugin.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/20-typora-community-plugin.hook"

  # 包内只保存共享只读副本,不把构建机的 $HOME 写入包。
  install -Dm644 "${srcdir}/plugin/loader.js" \
    "${plugin_dir}/loader.js"
  install -Dm644 "${srcdir}/plugin/loader.json" \
    "${plugin_dir}/loader.json"
  install -d "${plugin_dir}/${pkgver}"
  cp -a "${srcdir}/plugin/${pkgver}/." "${plugin_dir}/${pkgver}/"
  find "${plugin_dir}" -type d -exec chmod 755 {} +
}

