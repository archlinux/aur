# Maintainer: nlsdt <nlsdt@nlsdt.cc>

pkgname=pilinara
_pkgname=pilinara
_srcname=PiliNara
_pkgtag=2.1.0.2-beta1
pkgver=2.1.0.2
pkgrel=1
url="https://github.com/Starfallan/PiliNara"
pkgdesc="PiliPlus 的第三方Fork版本，做了一些自用改动"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('clang' 'cmake' 'ninja' 'fvm' 'patchelf')
provides=('pilinara')
conflicts=('pilinara-bin' 'pilinara-git')
options=('!debug' '!strip')

source_x86_64=("${_srcname}-${_pkgtag}.tar.gz::${url}/archive/refs/tags/2.1.0.2-beta1.tar.gz"
               '0001-Fix-file-picker-git-dependency.patch')
sha256sums_x86_64=('79f992dd52d4d5d2ce61b91eb732612ad551264ad3211033e1e4ef5b08fe1484'
                   'SKIP')

prepare() {
  cd "${_srcname}-${_pkgtag}/"
  patch -Np1 -i "${srcdir}/0001-Fix-file-picker-git-dependency.patch"
  fvm install
  fvm flutter --disable-analytics
  fvm flutter --no-version-check pub get
}

build() {
  cd "${_srcname}-${_pkgtag}/"
  fvm flutter build linux --no-pub --release
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
