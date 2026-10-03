# Maintainer: 古方元水 <ye@archlinux>
# Contributor: 糯米狐 <nuomihu@archlinux>
#
# 老 CPU 专用版（无 AVX2）。
# 上游用 -march=x86-64-v2 重编了 ONNX Runtime，不含官方预编译包里的 AVX2/AVX-512，
# 因此适用于 Ivy Bridge / Sandy Bridge 等 2012 年前后的 CPU（i5-3320M、Celeron J1900…）。
# 主线版 upmix-core-bin 在这类机器上跑自动（分离）模式会 SIGILL 崩溃，快速模式则不受影响。
# 代价：自动模式明显更慢（双核 + 无 FMA）。

pkgname=upmix-core-legacy-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Stereo to 5.1 upmixer with HTDemucs separation (prebuilt for pre-AVX2 CPUs)"
arch=('x86_64')
url="https://github.com/gensui-fuga/upmix-core"
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'openssl'
  'zlib'
  'brotli'
  'zstd'
  'mesa'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'wayland'
  'hicolor-icon-theme'
  'ffmpeg'
)
provides=('upmix-core')
conflicts=('upmix-core')
options=('!strip')
source=(
  "upmix-core-linux-x86_64-legacy-v${pkgver}.tar.gz::https://github.com/gensui-fuga/upmix-core/releases/download/v${pkgver}-legacy/upmix-core-linux-x86_64-legacy.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/gensui-fuga/upmix-core/v${pkgver}-legacy/LICENSE"
)
sha256sums=(
  '0903dd79035fd5bc4e9ecc4b0ae8a9e93c91fde02e60062533c0cd3e628c56a0'
  '55aadbacf89b539c4f086c608a0f21129a0ce0c09285447e2eb356d37017bf0d'
)

package() {
  # 二进制、模型、ONNX Runtime 三者同放 /usr/lib/upmix-core：
  # 程序用 current_exe() 旁的 models/ 找模型，二进制 RUNPATH=$ORIGIN 找 ORT 库，
  # 位置必须一致。发布包里那份 167MB 的 ffmpeg 不装——ffmpeg_path() 找不到旁边的
  # 就回退 PATH，直接用系统 ffmpeg 包。
  install -d "$pkgdir/usr/lib/upmix-core"
  install -m755 upmix-gui upmix-core upmix-tui "$pkgdir/usr/lib/upmix-core/"
  cp -a models "$pkgdir/usr/lib/upmix-core/"

  # baseline ONNX Runtime。发布包里 .so / .so.1 / .so.1.23.2 是同一份内容的
  # 三个独立副本（非硬链接），只装实体，另两个做链接，省 56MB。
  install -m644 libonnxruntime.so.1.23.2 "$pkgdir/usr/lib/upmix-core/"
  ln -s libonnxruntime.so.1.23.2 "$pkgdir/usr/lib/upmix-core/libonnxruntime.so.1"
  ln -s libonnxruntime.so.1.23.2 "$pkgdir/usr/lib/upmix-core/libonnxruntime.so"

  # /usr/bin 只放符号链接，current_exe() 会把它们解析回 /usr/lib/upmix-core/。
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
