# Maintainer: taotieren <admin@taotieren.com>

pkgname=marukotoolbox
pkgver=1.1.2
pkgrel=2
pkgdesc="小丸工具箱粉丝致敬版"
arch=($CARCH)
url="https://github.com/arenascats/MarukoToolbox-Rewrite"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
)
makedepends=(
    ffmpeg
    git
    nuitka
    tcl
    tk
    tkdnd
)
optdepends=(
    "amf-amdgpu-pro: AMDGPU Pro Advanced Multimedia Framework"
    "nvidia-utils: NVIDIA drivers utilities"
    "faac: Freeware Advanced Audio Coder"
    "ffmpeg: Complete solution to record, convert and stream audio and video"
    "libvpx: VP8 and VP9 codec"
    "svt-av1: Scalable Video Technology AV1 encoder and decoder"
    "svt-hevc: Scalable Video Technology HEVC encoder"
    "x264: Open Source H264/AVC video encoder"
    "x265: Open Source H265/HEVC video encoder"
)
backup=()
options=('!strip' '!debug' '!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('73e9df3e81dd196a1095cb693de4fc2c1b31a5cf57365f54932d2d4293b803ba')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    python -m nuitka \
    --onefile \
    --standalone \
    --windows-console-mode=disable \
    --show-progress \
    --lto=yes \
    --jobs=4 \
    --enable-plugins=tk-inter \
    --include-module=math \
    --follow-imports \
    --linux-icon=logo.png \
    --output-filename=marukotoolbox \
    --output-dir=dist \
    --include-data-file='./hooks/pre_find_module_path/hook-tkinter.py'='./hooks/pre_find_module_path/hook-tkinter.py' \
    ./main.py
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    # install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm755 "dist/marukotoolbox" -t "${pkgdir}/usr/bin/"
    install -vDm644 /dev/stdin -t "${pkgdir}/usr/share/applications/marukotoolbox.desktop" <<EOF
[Desktop Entry]
Categories=Others;
Comment=小丸工具箱粉丝重制版 for Linux
Encoding=UTF-8
Exec=marukotoolbox
Icon=marukotoolbox.png
MimeType=
Name=小丸工具箱粉丝重制版
StartupWMClass=小丸工具箱粉丝重制版
Terminal=false
Type=Application
EOF
    install -vDm644 "logo.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/marukotoolbox.png"
}
