# Maintainer: duanluan <duanluan@outlook.com>
# Contributor: wasdxl <https://aur.archlinux.org/account/wasdxl>
#
# Unofficial Linux port: the WorkBuddy international edition (workbuddy.ai)
# publishes no Linux build. This package converts the official macOS build to
# a Linux Electron app on the user's machine; nothing proprietary is
# redistributed. Conversion toolchain vendored from the MIT-licensed
# community project workbuddy-linux (see LICENSE.port-tool); see DISCLAIMER.
#
# The node/python session runtimes are taken from the official domestic-
# edition Linux deb (download.codebuddy.cn): the international darwin build
# bundles macOS/Windows runtimes only, while the app expects
# resources/runtime/{node,python} on Linux. The runtimes are edition-
# agnostic and pinned to their own upstream version.

pkgname=workbuddy-international
_pkgver=5.9.4.42593613
_build=fa0a0901
_electronver=37.10.3
_cn_pkgver=5.6.2.40046327
_cn_build=c7b525f3
pkgver=${_pkgver}_${_build}
pkgrel=1
pkgdesc='AI Agent for everyday office work - WorkBuddy international edition (unofficial Linux port)'
arch=('x86_64' 'aarch64')
url='https://www.workbuddy.ai'
license=('NOASSERTION')
depends=('libsecret' 'libappindicator-gtk3' 'nss' 'alsa-lib' 'gtk3' 'libxss')
makedepends=('nodejs' 'npm' 'p7zip' 'unzip' 'python' 'imagemagick')
optdepends=('gnome-shell-extension-appindicator: tray icon support')
options=('!strip' '!debug')
provides=('workbuddy-international-bin')
conflicts=('workbuddy-international-bin')
source=(
  'install.sh'
  'lib-common.sh'
  'lib-dmg.sh'
  'lib-electron.sh'
  'lib-native-modules.sh'
  'lib-linux-patches.sh'
  'lib-apply-linux-patches.js'
  'workbuddy-international.desktop'
  'LICENSE.port-tool'
  'DISCLAIMER'
)
source_x86_64=(
  "WorkBuddy-darwin-x64-${_pkgver}-${_build}.zip::https://download.codebuddy.ai/workbuddy/saas/darwin-x64/WorkBuddy-darwin-x64-${_pkgver}-${_build}.zip"
  "electron-v${_electronver}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electronver}/electron-v${_electronver}-linux-x64.zip"
  "WorkBuddy-linux-x64-deb-${_cn_pkgver}-${_cn_build}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-x64-deb/WorkBuddy-linux-x64-deb-${_cn_pkgver}-${_cn_build}.deb"
)
source_aarch64=(
  "WorkBuddy-darwin-arm64-${_pkgver}-${_build}.zip::https://download.codebuddy.ai/workbuddy/saas/darwin-arm64/WorkBuddy-darwin-arm64-${_pkgver}-${_build}.zip"
  "electron-v${_electronver}-linux-arm64.zip::https://github.com/electron/electron/releases/download/v${_electronver}/electron-v${_electronver}-linux-arm64.zip"
  "WorkBuddy-linux-arm64-deb-${_cn_pkgver}-${_cn_build}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-arm64-deb/WorkBuddy-linux-arm64-deb-${_cn_pkgver}-${_cn_build}.deb"
)
noextract=(
  "WorkBuddy-linux-x64-deb-${_cn_pkgver}-${_cn_build}.deb"
  "WorkBuddy-linux-arm64-deb-${_cn_pkgver}-${_cn_build}.deb"
)
sha256sums=('6e8c6154b013e26cb2f8f2c3646b206a135cd0060e67f86298c1d2b23c10a1c3'
            '33aeab4b44329127ce747cc3048df98db9873cb511685e666d81332d9c219c73'
            'f263ea88a81ceb8be3b59c458fd7be15daf0dbbd2b625fc143f772ad300742fd'
            'f207ee01cc207532c3c804ba6ff6ab4209adab06a1903d9b9f38b8d96d90d50c'
            '6d9bf1001374d62e12941c7e98acee1329fbe4dcaf4ae809509c934b865417c1'
            'e2c715973e9e720008bb6507f3fe31563772907eb236a6ecb804186b539485c2'
            'f436d99d242064c905f06eb53f1a810e90e7be92a804015e4679cea1fcb62885'
            '6fcbfa4cba8e730e603b68fcca484c7963aacdaf56a3f6c5c47ff320a5189e85'
            '43164499524650222076bae69b7cb21d3e3e4a954c7c56426474267a554a2f33'
            'aa036c1f37d070f14a551bcba2133390710da46bd91225dfd366711bb5a3b6ec')
sha256sums_x86_64=('57935f9578fed1ddf0ab0219a328d96f69494a45369e88aabf1f650242084e87'
                   'c0b4edd6bd9858cda4cf7ab299e69a2d3ecd2e5fcca78507bc0851ba35614660'
                   '12149ad8c0cd748fd5062d8f62c7827d688d8095427ada99b1ae9e7019897523')
sha256sums_aarch64=('754926260c0ab867b5fe1050ab5cc01724a1330451617c8f339c679ff3bbc542'
                    '37a228821184136fa86a8727bec19ab400524dd7d4bca78937de5d50704592d1'
                    '561822578435d382a06d0a0b079a4b157f68b588c9fe72d589e2a88b2fd155fa')

build() {
  local darwin_zip electron_zip cn_deb app_bundle

  case "${CARCH}" in
    x86_64)
      darwin_zip="WorkBuddy-darwin-x64-${_pkgver}-${_build}.zip"
      electron_zip="electron-v${_electronver}-linux-x64.zip"
      cn_deb="WorkBuddy-linux-x64-deb-${_cn_pkgver}-${_cn_build}.deb"
      ;;
    aarch64)
      darwin_zip="WorkBuddy-darwin-arm64-${_pkgver}-${_build}.zip"
      electron_zip="electron-v${_electronver}-linux-arm64.zip"
      cn_deb="WorkBuddy-linux-arm64-deb-${_cn_pkgver}-${_cn_build}.deb"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  rm -rf "${srcdir}/app-extract"
  install -dm755 "${srcdir}/app-extract"
  # __MACOSX 是 macOS 打包时混入的资源叉元数据，解包时直接排除，
  # 避免 find 选到错误的 .app
  unzip -q "${srcdir}/${darwin_zip}" -d "${srcdir}/app-extract" -x '__MACOSX/*'

  app_bundle="$(find "${srcdir}/app-extract" -maxdepth 2 -name '*.app' -type d | sort | head -n1)"
  [[ -n "${app_bundle}" ]] || { printf 'no .app bundle found in the darwin zip\n' >&2; return 1; }

  WORKBUDDY_APP_ID='WorkBuddy AI' \
  WORKBUDDY_APP_DISPLAY_NAME='WorkBuddy AI (International)' \
  WORKBUDDY_INSTALL_DIR="${srcdir}/workbuddy-app" \
  WORKBUDDY_ELECTRON_ZIP="${srcdir}/${electron_zip}" \
    bash "${srcdir}/install.sh" "${app_bundle}"

  # 从国内版官方 Linux deb 提取会话运行时。国际版的 darwin 包只在
  # win32/darwin 条目下捆绑运行时，Linux 条目（node.tar.gz/python.tar.gz）
  # 实际不存在；缺失时 daemon 反复退出并弹 "critical component" 警告
  rm -rf "${srcdir}/cn-deb-extract"
  install -dm755 "${srcdir}/cn-deb-extract"
  bsdtar -C "${srcdir}/cn-deb-extract" -xf "${srcdir}/${cn_deb}"
  bsdtar -C "${srcdir}/cn-deb-extract" -xf "${srcdir}/cn-deb-extract"/data.tar.* \
    ./opt/WorkBuddy/resources/runtime

  local runtime_dir="${srcdir}/cn-deb-extract/opt/WorkBuddy/resources/runtime"
  [[ -x "${runtime_dir}/node/bin/node" && -x "${runtime_dir}/python/bin/python3" ]] || {
    printf 'session runtimes missing from the domestic deb: %s\n' "${runtime_dir}" >&2
    return 1
  }
  rm -rf "${srcdir}/workbuddy-app/resources/runtime"
  cp -a "${runtime_dir}" "${srcdir}/workbuddy-app/resources/runtime"
}

package() {
  install -dm755 "${pkgdir}/opt/workbuddy-international"
  cp -a "${srcdir}/workbuddy-app/." "${pkgdir}/opt/workbuddy-international/"

  # The helper desktop file written by install.sh embeds the build-time
  # srcdir in Exec=; point it at the final install location instead.
  sed -i "s|${srcdir}/workbuddy-app|/opt/workbuddy-international|g" \
    "${pkgdir}/opt/workbuddy-international/.workbuddy-linux/WorkBuddy AI.desktop" 2>/dev/null || true

  # Desktop entry: named exactly after the app's Wayland app_id ("WorkBuddy AI")
  # so the task manager associates windows with this entry and its icon.
  install -Dm644 "${srcdir}/workbuddy-international.desktop" \
    "${pkgdir}/usr/share/applications/WorkBuddy AI.desktop"

  # Icons: theme-integrated hicolor entry plus pixmaps fallback
  install -Dm644 "${srcdir}/workbuddy-app/.workbuddy-linux/workbuddy.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/workbuddy-international.png"
  install -Dm644 "${srcdir}/workbuddy-app/.workbuddy-linux/workbuddy.png" \
    "${pkgdir}/usr/share/pixmaps/workbuddy-international.png"

  # Launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/workbuddy-international" <<'LAUNCHER'
#!/usr/bin/env bash
exec /opt/workbuddy-international/start.sh "$@"
LAUNCHER

  # Licenses / notices
  install -Dm644 "${srcdir}/LICENSE.port-tool" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.port-tool"
  install -Dm644 "${srcdir}/DISCLAIMER" \
    "${pkgdir}/usr/share/licenses/${pkgname}/DISCLAIMER"
}
