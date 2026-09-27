# Maintainer: 15deg <204751610 at qq dot com>
# Contributor: SteamedFish <steamedfish@hotmail.com>

pkgname=ovital-map
pkgver=10.6.0
pkgrel=1
install=ovital-map.install

# 上游为每个架构给出不同的构建号，升级版本时必须同步核对
_build_x86_64=34222
_build_aarch64=34217
_build_loong64=34217

pkgdesc="Ovital Map (奥维互动地图) - cross-platform map browser"
arch=('x86_64' 'aarch64' 'loong64')
url="https://www.ovital.com"
license=('LicenseRef-custom')
depends=(
  'alsa-lib'
  'bzip2'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glu'
  'gst-plugins-bad-libs'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk-update-icon-cache'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libglvnd'
  'libpulse'
  'libsm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'libxrender'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'qt5-base'
  'xz'
  'zlib'
)
# patchelf 用于清除上游留下的 /usr/local RUNPATH
makedepends=('patchelf')
options=('!strip')
# 非自由软件、无源码分发，按 Nonfree applications package guidelines 不使用 -bin 后缀
#
# 上游不随 deb 分发许可文本，只提供网页版用户协议。LICENSE.html 是 2026-09-19
# 取自 https://www.ovital.com/agreement/ 的副本，随源分发以便 package() 不需要
# 联网（官方仓库与规范都要求构建过程离线，此前的 curl 取法不符合这一点）。

source_x86_64=("Linux-x86_64-OMap-${pkgver}-build${_build_x86_64}.deb::https://cdn.ovital.com/pub/Linux-x86_64-OMap-${pkgver}-build${_build_x86_64}.deb")
source_aarch64=("Linux-aarch64-OMap-${pkgver}-build${_build_aarch64}.deb::https://cdn.ovital.com/pub/Linux-aarch64-OMap-${pkgver}-build${_build_aarch64}.deb")
source_loong64=("Linux-loongarch64-OMap-${pkgver}-build${_build_loong64}.deb::https://cdn.ovital.com/pub/Linux-loongarch64-OMap-${pkgver}-build${_build_loong64}.deb")
b2sums_x86_64=('9ee49291c777a8d2cd8211cf6d7b139ef93cfa929adfe3086d1f281de0edb3d8bd09b0caaa3f1b108d127424970db755c1ff8ca128f593eeaa3c44981c6be15e')
b2sums_aarch64=('b363ba1e997a5aadf2fad9cfbec05942dc8d39c0db977cd2e84455873e737df824103661bdb660a9231fc793678ac08ef2df0f58efc1cba62002d39b6579de04')
b2sums_loong64=('d84411418ec1741c036d116ab62d0f8fc34a1ba4ff1fba748427a4229de37734bc021f364a03be6352ff0adff9da8e3b4a233cb407d73425f8bafa38abd8b5bc')

package() {
  local _debarch _build
  case "$CARCH" in
    x86_64)  _debarch='x86_64';      _build="${_build_x86_64}" ;;
    aarch64) _debarch='aarch64';     _build="${_build_aarch64}" ;;
    loong64) _debarch='loongarch64'; _build="${_build_loong64}" ;;
    *)       error "不支持的架构: ${CARCH}"; return 1 ;;
  esac

  local _deb="Linux-${_debarch}-OMap-${pkgver}-build${_build}.deb"

  bsdtar -O -xf "${_deb}" data.tar.gz | bsdtar -xzf - -C "$pkgdir"

  # 上游 deb 里可执行位不完整
  chmod 755 "$pkgdir/opt/com.ovital.map/OMapQT" \
            "$pkgdir/opt/com.ovital.map/OMapQTUpgrade" \
            "$pkgdir/opt/com.ovital.map/launcher"

  # libQt5WebEngineCore 的 RUNPATH 指向构建机的 /usr/local/Qt-5.12.12/lib，
  # 替换为相对 $ORIGIN，避免加载器去搜索不存在的系统路径
  while IFS= read -r -d '' _so; do
    local _rpath
    _rpath=$(patchelf --print-rpath "${_so}" 2>/dev/null) || continue
    [[ "${_rpath}" == *"/usr/local"* ]] && patchelf --set-rpath '$ORIGIN' "${_so}"
  done < <(find "$pkgdir/opt/com.ovital.map" -type f \( -name '*.so' -o -name '*.so.*' \) -print0)

  # launcher 在 Wayland 会话下有问题，桌面项直接调用 OMapQT；
  # 同时修正非标准的 Categories
  sed -i \
    -e 's|^Exec=/opt/com.ovital.map/launcher|Exec=/opt/com.ovital.map/OMapQT|' \
    -e 's|^Categories=Application$|Categories=Geography;Maps;|' \
    "$pkgdir/usr/share/applications/ovital-map.desktop"

  # 用户协议副本（随源分发，见文件头说明）
  install -Dm644 "$startdir/LICENSE.html" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.html"
}
