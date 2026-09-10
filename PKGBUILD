# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# 上游是纯 JS 的 Typora 插件系统,发布 zip 内为 loader.js + loader.json + <版本>/core.js。
# 官方安装方式(install-linux.sh)需要 root 手动改 Typora 的 window.html 并拷文件到用户目录;
# 本包等价地做两件事:
#   1. 运行时装到 Typora userData 的 plugins 目录(window.html 里的
#      typora://app/userData/plugins/loader.js 即指向此处,路径在构建时固化);
#   2. 由 /usr/bin/typora-community-plugin 把同一段 loader <script> 注入
#      /usr/share/typora/resources/window.html,并用 pacman hook 在 typora
#      升级覆盖 window.html 后重新注入(该文件属 typora 包,不能由本包拥有)。
pkgname=typora-community-plugin
pkgver=2.10.18
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
sha256sums=('6a4ba75f59c265ac04a74a0ac5cab4b37fdc864f6c6b776710a3b0781f331c1a'
            '731f5be0037576f31f566458da9817c261db3e8b8c5fc4703841005d5ac53823'
            '09f62600fdc6c5866bad72d4c2a03ca219accef954fe4887051c318494793dea'
            '4a4cefac90a4fdf9ce3987ddd7819c00c28b5a99812a1997ff086bea5121d680')
noextract=("${pkgname}-${pkgver}.zip")

# Typora 读取的 userData 目录(<XDG 配置目录>/Typora),loader 只能从这里加载
_plugin_dir="${XDG_CONFIG_HOME:-$HOME/.config}/Typora/plugins"

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

  # 控制脚本要往哪个用户目录装(pacman 以 root 安装,脚本自行推断目标用户属主)
  sed -i "s|__PLUGIN_DIR__|${_plugin_dir}|" "${srcdir}/typora-community-plugin.sh"
}

package() {
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm755 "${srcdir}/typora-community-plugin.sh" "${pkgdir}/usr/bin/typora-community-plugin"
  install -Dm644 "${srcdir}/typora-community-plugin.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/20-typora-community-plugin.hook"

  # 运行时落盘位置必须与 window.html 注入的 URL 一致
  install -Dm644 "${srcdir}/plugin/loader.js" "${pkgdir}${_plugin_dir}/loader.js"
  install -Dm644 "${srcdir}/plugin/loader.json" "${pkgdir}${_plugin_dir}/loader.json"
  cp -a "${srcdir}/plugin/${pkgver}" "${pkgdir}${_plugin_dir}/${pkgver}"
  find "${pkgdir}${_plugin_dir}" -type d -exec chmod 755 {} +

  # pacman 会把包内目录权限与文件系统现状比对:家目录与 Typora 配置目录都已存在且
  # 常为 750/700,这里按实际权限落包,避免每次安装/升级都告警"目录权限不一致"
  local d
  for d in "${HOME}" "$(dirname "${_plugin_dir}")"; do
    if [[ -d "$d" ]]; then chmod --reference="$d" "${pkgdir}$d"; fi
  done
}
