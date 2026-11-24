# Maintainer: duanluan <duanluan@outlook.com>
# Contributor: bruceutut <https://aur.archlinux.org/account/bruceutut>

pkgname=echobird-bin
_pkgname=echobird
_appname=EchoBird
pkgver=6.4.9
pkgrel=1
pkgdesc='Desktop hub to manage AI coding tools, accounts and quota with smart routing (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/edison7009/EchoBird'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'wayland'
  'webkit2gtk-4.1'
)
provides=("echobird=${pkgver}")
conflicts=('echobird')
options=('!strip')
source=('LICENSE')
source_x86_64=("EchoBird_${pkgver}_Linux_x64.deb::https://github.com/edison7009/EchoBird/releases/download/v${pkgver}/EchoBird_${pkgver}_Linux_x64.deb")
source_aarch64=("EchoBird_${pkgver}_Linux_arm64.deb::https://github.com/edison7009/EchoBird/releases/download/v${pkgver}/EchoBird_${pkgver}_Linux_arm64.deb")
noextract=(
  "EchoBird_${pkgver}_Linux_x64.deb"
  "EchoBird_${pkgver}_Linux_arm64.deb"
)
sha256sums=('80fe40d09a2f2c7a3b7a6a59b6d52f3e4b41d51642b279ad78de53a6d318fc64')
sha256sums_x86_64=('5ae62a53c6cdd7bfcfc4a7013bb4060fbc1d07f4fa2517251920ff42f410e126')
sha256sums_aarch64=('df9aca0bc63b5e94b5e1612b7577b54536a31fd417660f32a828d5e5723bfba9')

package() {
  local deb
  case "${CARCH}" in
    x86_64)
      deb="${srcdir}/EchoBird_${pkgver}_Linux_x64.deb"
      ;;
    aarch64)
      deb="${srcdir}/EchoBird_${pkgver}_Linux_arm64.deb"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  local extract_dir="${srcdir}/deb-extract"
  local data_archives

  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf "${deb}"

  data_archives=("${extract_dir}"/data.tar.*)
  if (( ${#data_archives[@]} != 1 )) || [[ ! -f "${data_archives[0]}" ]]; then
    printf 'unable to locate the Debian data archive\n' >&2
    return 1
  fi
  bsdtar -C "${pkgdir}" -xf "${data_archives[0]}"

  # NVIDIA 显卡上 WebKitGTK 的 DMABUF 渲染器画不出内容，窗口全透明；
  # 真实二进制改名 echobird.bin 后留在 /usr/bin，Tauri 按可执行文件
  # 所在目录解析资源路径 /usr/lib/EchoBird，不能挪到别处
  mv "${pkgdir}/usr/bin/echobird" "${pkgdir}/usr/bin/echobird.bin"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/echobird" <<'WRAPPER'
#!/bin/bash
# WebKitGTK 的 DMABUF 渲染器在 NVIDIA 驱动下输出全透明画面，
# 默认关闭它；其他显卡想恢复硬件加速可把这个变量设为 0
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
exec -a echobird /usr/bin/echobird.bin "$@"
WRAPPER

  # 托盘图标通过 dlopen 加载 libayatana-appindicator，二进制本身不直接
  # 链接它，上游 deb 同样把它声明为依赖，缺失时托盘不可用
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
