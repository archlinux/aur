# Maintainer: czyt <czytcn@gmail.com>

pkgname=wowtype-bin
pkgver=0.7.13
pkgrel=1
pkgdesc="WeType-style pinyin input method for fcitx5, with bundled dictionaries and language model"
arch=('x86_64')
url="https://github.com/Gloridust/WowType"
# The Wubi table (usr/share/wowtype/wubi86.tsv, new in 0.4.0) is LGPL-3.0;
# DATA-SOURCE.txt and WUBI-SOURCE.txt in the licence directory carry the details.
license=('MIT' 'Apache-2.0' 'GPL-3.0-only' 'LGPL-3.0-only' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=(
    'alsa-lib'
    'fcitx5'
    'gcc-libs'
    'glibc'
    # wowtype-config, the settings window, is a Python script.
    'python'
)
optdepends=(
    'python-gobject: 设置界面 wowtype-config'
    'gtk4: 设置界面'
    'libadwaita: 设置界面'
    'fcitx5-gtk: 在 GTK 程序里输入中文'
    'fcitx5-qt: 在 Qt 程序里输入中文'
    'fcitx5-configtool: 图形化管理输入法列表'
    'noto-fonts-emoji: 候选里的彩色 emoji'
    'curl: 互译模式与离线语音模型下载'
    'unzip: 解压离线语音模型'
    'gnome-shell: 绿色主题与语音浮条用的 GNOME 扩展'
)
provides=('wowtype')
conflicts=('wowtype')
install=wowtype-bin.install
options=('!strip' '!debug')

# Upstream ships one .deb per distribution. The Ubuntu 24.04 build has the
# lowest requirements of the three (glibc 2.39, libstdc++ 13.1, fcitx5 5.1.7),
# so it is the safest of them to run on a rolling release.
_deb="wowtype_${pkgver}_ubuntu24.04_amd64.deb"
source=(
    "${_deb}::https://github.com/Gloridust/WowType/releases/download/v${pkgver}/${_deb}"
    # Kept in the repository rather than fetched: unicode.org/license.txt is not
    # downloadable by every helper (paru truncated it), and its copyright year
    # changes, which would break the checksum on every update.
    'Unicode-3.0.txt'
)
noextract=("${_deb}")
sha256sums=('109a057b3445cb61bf26eb0863ceafa68a3d281b1aba8f64a72044ed3e4d4dd0'
            'e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96')

package() {
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" |
        awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Debian puts fcitx5 addons under /usr/lib/<triplet>/; fcitx5 on Arch
    # searches /usr/lib/fcitx5. Everything else already uses standard paths
    # (/usr/bin, /usr/share/fcitx5, /usr/share/wowtype).
    install -Dm755 "${pkgdir}/usr/lib/x86_64-linux-gnu/fcitx5/libwowtype.so" \
        "${pkgdir}/usr/lib/fcitx5/libwowtype.so"
    rm -rf "${pkgdir}/usr/lib/x86_64-linux-gnu"

    install -Dm644 "${pkgdir}/usr/share/doc/wowtype/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    install -Dm644 "${srcdir}/Unicode-3.0.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Unicode-3.0.txt"
    # The dictionary and language model come with their own provenance notes.
    install -Dm644 "${pkgdir}/usr/share/doc/wowtype/DATA-SOURCE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/DATA-SOURCE.txt"
    install -Dm644 "${pkgdir}/usr/share/doc/wowtype/DATA-VERSION" \
        "${pkgdir}/usr/share/licenses/${pkgname}/DATA-VERSION"
    rm -f "${pkgdir}/usr/share/doc/wowtype/copyright" \
        "${pkgdir}/usr/share/doc/wowtype/DATA-SOURCE.txt" \
        "${pkgdir}/usr/share/doc/wowtype/DATA-VERSION"

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
