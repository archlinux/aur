# Maintainer: Myqfeng <viagrahuang@outlook.com>
#
# 二进制包：直接下载仓库 Release 中预编译好的 .deb（amd64）并解包，
# 不做本地编译，安装速度快。
#
# 版本号占位符 3.3.0 与校验和占位符 a2f40381be5ba7b6ce366c4bd78831b23fc8a786ac12732913dce3eed8f61d7f 会在
# scripts/update_aur.sh 推送时被替换为真实值：
#   - 3.3.0      -> 真实版本号
#   - a2f40381be5ba7b6ce366c4bd78831b23fc8a786ac12732913dce3eed8f61d7f -> 该 .deb 的 sha256
# 前置条件：仓库 Release 中已存在 <版本号>/qteasytier_v<版本号>_linux_amd64.deb。

pkgname=qteasytier-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="基于 EasyTier 的 Qt 图形化异地组网客户端（预编译二进制，取自官方 Release）"
arch=('x86_64')
url="https://github.com/qteasytier/qt-easy-tier"
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-tools'
  'openssl'
  'sqlite'
  'hicolor-icon-theme'
)
provides=('qteasytier')
conflicts=('qteasytier' 'qteasytier-dde')
options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://github.com/qteasytier/qt-easy-tier/releases/download/${pkgver}/qteasytier_v${pkgver}_linux_amd64.deb")
sha256sums=('a2f40381be5ba7b6ce366c4bd78831b23fc8a786ac12732913dce3eed8f61d7f')

# deb 解包必须分两步，不能用 bsdtar -xf 一次性完成：
#   1. .deb 是 ar 归档，成员为 debian-binary / control.tar.* / data.tar.*；
#   2. 有效载荷在该 data.tar.<后缀> 内。Release 产物由 Ubuntu 24.04 的
#      dpkg（>= 1.22）生成，默认 zstd 压缩，成员名是 data.tar.zst。
# GNU tar 的 --auto-compress 与 macOS 的 tar 会在解 ar 后按后缀继续解压，
# 但 libarchive 的 bsdtar 不会：直接 -xf 只会落下三个未展开的成员文件，
# 于是 cp 阶段的源目录不存在，报
#   "对 '.../extract/opt/qteasytier/.' 调用 stat 失败: 没有那个文件或目录"。
# 因此这里先解 ar，再显式解 data.tar.*，并用通配符兼容 xz/gz/bz2 等后缀。
_extract_deb_payload() {
  local deb="$1"
  local out="$2"

  rm -rf "${out}"
  mkdir -p "${out}"

  # 第一步：解 ar 归档
  bsdtar -xf "${deb}" -C "${out}"

  # 第二步：找出 data.tar 成员（结尾可能带压缩后缀）
  local data_tar=""
  local cand
  for cand in "${out}"/data.tar*; do
    if [[ -f "${cand}" ]]; then
      data_tar="${cand}"
      break
    fi
  done

  if [[ -z "${data_tar}" ]]; then
    echo "错误：deb 解包后未找到 data.tar 成员，无法取得有效载荷" >&2
    ls -la "${out}" >&2 || true
    return 1
  fi

  # 第三步：解出真正的文件树；data.tar.* 自身不再需要
  local root="${out}/_root"
  mkdir -p "${root}"
  bsdtar -xf "${data_tar}" -C "${root}"
  rm -rf "${out}"/data.tar* "${out}"/control.tar* "${out}/debian-binary"

  printf '%s' "${root}"
}

package() {
  local payload
  payload="$(_extract_deb_payload "${srcdir}/${pkgname}-${pkgver}.deb" "${srcdir}/extract")" || exit 1

  install -d "${pkgdir}/opt/qteasytier"
  cp -a "${payload}/opt/qteasytier/." "${pkgdir}/opt/qteasytier/"

  install -d "${pkgdir}/usr/share/applications"
  cp -a "${payload}/usr/share/applications/." "${pkgdir}/usr/share/applications/"

  # deb 把服务装在 /etc/systemd/system，Arch 包规范放在 /usr/lib/systemd/system
  install -d "${pkgdir}/usr/lib/systemd/system"
  cp -a "${payload}/etc/systemd/system/qtet-daemon.service" \
    "${pkgdir}/usr/lib/systemd/system/qtet-daemon.service"
}
