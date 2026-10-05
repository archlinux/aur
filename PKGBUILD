# Maintainer: 古方元水 <ye@archlinux>
# Contributor: 糯米狐 <nuomihu@archlinux>

pkgname=upmix-core-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Stereo to 5.1 upmixer with HTDemucs neural source separation (prebuilt)"
arch=('x86_64')
url="https://github.com/gensui-fuga/upmix-core"
license=('MIT')
# 依赖表是直接扫二进制得出的，不是猜的：
#   readelf -d   → glibc(libc/libm/ld-linux) + gcc-libs(libgcc_s/libstdc++)
#   strings 里的 dlopen 名 → libglvnd(libGL.so.1/libEGL.so.1)、libx11、libxcb、
#                            libxcursor、libxi、libxkbcommon、libxkbcommon-x11、
#                            libxrender、wayland(libwayland-client/-egl)
# winit/glutin 那套是运行时 dlopen 的，DT_NEEDED 里根本看不到，但缺了启动就崩，
# 所以必须显式写出来。libglvnd 自己依赖 mesa + opengl-driver，不用再列 mesa。
# openssl 只有 upmix-core(CLI) 直接链（下模型走 TLS）；GUI 用不到，同一个包一起列。
# ffmpeg 是运行时调起的外部程序：随包那份 167MB 的故意不装，直接用系统 ffmpeg。
depends=(
  'ffmpeg'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'openssl'
  'wayland'
)
provides=('upmix-core')
conflicts=('upmix-core')
options=('!strip')
source=(
  "upmix-core-linux-${CARCH}-v${pkgver}.tar.gz::https://github.com/gensui-fuga/upmix-core/releases/download/v${pkgver}/upmix-core-linux-x86_64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/gensui-fuga/upmix-core/v${pkgver}/LICENSE"
)
sha256sums=(
  '6280fbab058f644c9a429cc405bdf411c0cb2ef5bb92a9ebf6b614c06b26d107'
  '55aadbacf89b539c4f086c608a0f21129a0ce0c09285447e2eb356d37017bf0d'
)

package() {
  # 二进制与模型同放 /usr/lib/upmix-core：
  # 程序用 current_exe() 旁边的 models/ 找分离模型，两者必须同目录。
  # 发布包里那份 167MB 的 ffmpeg 不装——ffmpeg_path() 找不到旁边的就回退 PATH，
  # 直接用系统 ffmpeg 包，避免重复打包官方仓库已有的东西。
  install -d "$pkgdir/usr/lib/upmix-core"
  install -m755 upmix-gui upmix-core upmix-tui "$pkgdir/usr/lib/upmix-core/"
  cp -a models "$pkgdir/usr/lib/upmix-core/"

  # /usr/bin 只放符号链接。current_exe() 读 /proc/self/exe，会把链接解析回
  # /usr/lib/upmix-core/<bin>，于是 models/ 照常命中，也避免了 /usr/bin/models 这种污染。
  install -d "$pkgdir/usr/bin"
  for _b in upmix-gui upmix-core upmix-tui; do
    ln -s "/usr/lib/upmix-core/${_b}" "$pkgdir/usr/bin/${_b}"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/upmix-core.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Upmix Core
Name[zh_CN]=Upmix Core 声道上混
Comment=Stereo to 5.1 upmixer with HTDemucs neural source separation
Comment[zh_CN]=立体声转 5.1 声道，支持 HTDemucs 神经网络源分离
Exec=upmix-gui
Icon=upmix-core
Terminal=false
Categories=AudioVideo;Audio;AudioVideoEditing;
Keywords=audio;5.1;surround;upmix;demucs;stereo;
StartupWMClass=upmix-gui
EOF

  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cat > "$pkgdir/usr/share/icons/hicolor/scalable/apps/upmix-core.svg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="512" height="512">
  <rect width="512" height="512" rx="112" fill="#f5f0e6"/>
  <g fill="#8a8578">
    <circle cx="256" cy="98" r="25"/>
    <circle cx="120" cy="166" r="21"/>
    <circle cx="392" cy="166" r="21"/>
    <circle cx="120" cy="340" r="21"/>
    <circle cx="392" cy="340" r="21"/>
  </g>
  <circle cx="256" cy="424" r="30" fill="#b9a88f"/>
  <circle cx="256" cy="262" r="104" fill="none" stroke="#3a3733" stroke-width="10" opacity="0.30"/>
  <circle cx="256" cy="262" r="62" fill="#3a3733"/>
</svg>
EOF
}
