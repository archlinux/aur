# Maintainer: nlsdt <nlsdt@nlsdt.cc>

pkgname=pilinara
_pkgname=pilinara
_srcname=PiliNara
_pkgtag=2.1.0.2-beta4
pkgver=2.1.0.2
pkgrel=2
url="https://github.com/Starfallan/PiliNara"
pkgdesc="PiliPlus 的第三方Fork版本，做了一些自用改动"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('clang' 'cmake' 'git' 'ninja' 'fvm' 'patchelf')
provides=('pilinara')
conflicts=('pilinara-bin' 'pilinara-git')
options=('!debug' '!strip')

source_x86_64=("${_srcname}-${_pkgtag}.tar.gz::${url}/archive/refs/tags/${_pkgtag}.tar.gz")
sha256sums_x86_64=('b14142475545817f3fdaf86c212fe79419564672063ec788d8f776a49fe8e4b8')

prepare() {
  cd "${_srcname}-${_pkgtag}/"
  fvm install
  fvm flutter --disable-analytics
  fvm flutter --no-version-check pub get
}

build() {
  cd "${_srcname}-${_pkgtag}/"
  local _sdk _scripts
  _sdk="$(readlink -f .fvm/flutter_sdk)"
  _scripts="${PWD}/lib/scripts"

  # 修补 flutter SDK
  local _patches=(modal_barrier text_selection mouse_cursor image_anim
                  layout_builder navigation_drawer popup_menu fab
                  null_safety_for_selectable_region selectable_region
                  editable_text text_field scroll_position scrollable
                  scrollable_gesture draggable_scrollable_sheet scaffold
                  text text_painter)

  printf "正在应用 Flutter 引擎补丁...\n"
  git -C "${_sdk}" reset --hard HEAD
  git -C "${_sdk}" show beb2ad17004a1b118ff2bd09f55cee23198f6652 --binary | git -C "${_sdk}" apply
  for _patch in "${_patches[@]}"; do
    git -C "${_sdk}" apply "${_scripts}/${_patch}.patch"
  done

  printf "补丁应用完成, 开始构建...\n"
  if fvm flutter build linux --no-pub --release; then
    git -C "${_sdk}" reset --hard HEAD
  else
    _rc=$?
    printf "构建失败, 正在恢复 Flutter SDK...\n"
    git -C "${_sdk}" reset --hard HEAD
    return ${_rc}
  fi
  printf "构建完成, Flutter SDK 已恢复.\n"
}

package() {
  cd "${_srcname}-${_pkgtag}/"
  local _srcdir=build/linux/x64/release/bundle

  # 建立目录
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  # 安装文件
  install -Dm755 "${_srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  cp -a "${_srcdir}/lib" "${pkgdir}/opt/${_pkgname}/"
  cp -a "${_srcdir}/data" "${pkgdir}/opt/${_pkgname}/"

  # 设置库文件的 RPATH 为 $ORIGIN
  find "${pkgdir}/opt/${_pkgname}/lib" -type f -name "*.so*" -exec \
  patchelf --set-rpath '$ORIGIN' {} \;

  # 安装图标
  install -Dm644 "assets/images/logo/logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  # 安装 .desktop
  install -Dm644 "assets/linux/com.example.${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/com.example.${_pkgname}.desktop"
  # 链接主程序
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
