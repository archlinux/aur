# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=hnscrcpy-git
_pkgname=hnscrcpy
pkgver=v1.0.1.r4.gdcb7bf9
pkgrel=1
pkgdesc="Display and control HarmonyOS NEXT devices via hdc, scrcpy-like (JavaFX + FFmpeg)"
arch=('x86_64')
url="https://github.com/taxiao213/hnscrcpy"
license=('Apache-2.0')

# jpackage app-image 内嵌完整 JRE 与 JavaFX/FFmpeg native，故不依赖系统 Java。
# libgl 为 JavaFX Prism 渲染所需；X/GTK 库由桌面环境提供。
depends=('libgl')
makedepends=('maven' 'jdk21-openjdk')

provides=('hnscrcpy')
conflicts=('hnscrcpy-bin')

_tag="v${pkgver}"
_archive="${pkgname%-git}"
source=(
  "git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
  git -C ${_pkgname} describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  sh scripts/build-package.sh
}
package() {
  cd "${srcdir}/${_pkgname}"

  # 1. 生成 desktop 文件（内联，不需要外部 hnscrcpy.desktop）
install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=hnscrcpy
Name[zh_CN]=鸿蒙Next手机投屏
GenericName=鸿蒙 Next 屏幕投屏与设备控制工具
Comment=借助hdc投屏并控制鸿蒙Next设备
Exec=hnscrcpy
Icon=hnscrcpy
Terminal=false
Categories=Utility;RemoteAccess;
Keywords=harmony;hmos;hdc;scrcpy;mirror;cast;
StartupNotify=true
DESKTOP

  # 2. 整套app-image复制到 /opt
  install -d "${pkgdir}/opt"
  cp -a "target/dist/${_pkgname}" "${pkgdir}/opt/"
  install -Dm755 "target/classes/hdc/linux-64/hdc" "${pkgdir}/usr/bin/hdc"
  install -Dm644 "target/classes/hdc/linux-64/libusb_shared.so" "${pkgdir}/usr/lib/libusb_shared.so"

  # 3. 启动 wrapper
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'WRAPPER'
#!/usr/bin/env bash
exec /opt/hnscrcpy/bin/hnscrcpy "$@"
WRAPPER

  # 4. udev 规则 内联，不再需要外部 51-hdc-huawei.rules
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/51-hdc-huawei.rules" <<'UDEV'
SUBSYSTEM=="usb", ATTRS{idVendor}=="12d1", MODE="0666", GROUP="uucp"
UDEV

  # 5. 图标
  install -Dm644 "design/icon/hnscrcpy-linux.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
