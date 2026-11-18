# Maintainer: 7Ji <pugokushin at gmail dot com>
# Maintainer: leaeasy <leaeasy at gmail dot com>
# Contributor: devome <evinedeng at hotmail dot com>

_pkgname=wechat-universal
pkgname=${_pkgname}-bwrap
pkgver=4.1.13.26
pkgrel=3
pkgdesc="WeChat (Universal) with bwrap sandbox"
arch=('x86_64' 'aarch64' 'loong64')
url='https://linux.weixin.qq.com/'
license=('LicenseRef-wechat-license')
install="${_pkgname}".install
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=('wechat-beta'{,-bwrap})
depends=(
    'at-spi2-core'
    'bubblewrap'
    'flatpak-xdg-utils'
    'jack'
    'libpulse'
    'libxcomposite'
    'libxdamage'
    'libxkbcommon-x11'
    'libxrandr'
    'mesa'
    'nss'
    'pango'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'xdg-desktop-portal'
    'xdg-user-dirs'
)
makedepends=(
    'patchelf'
)
optdepends=(
    'binutils: pdfjsfix applet'
    'pdfjs: pdfjsfix CMap resources'
    'python: pdfjsfix MMKV configuration'
)
if [[ "${CARCH}" == loong64 ]]; then # This is needed instead of a plain declaration because AUR web would return all depends regardless of client's arch, AUR helpers would thus refuse to build the package on non-loong64 due to missing liblol
    depends_loong64=('liblol')
fi
options=(!strip !debug emptydirs)

_lib_uos='libuosdevicea'

source=(
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
    "${_pkgname}-alias-browser.desktop"
    "${_pkgname}-alias-icon.desktop"
    "${_lib_uos}".{c,Makefile}
    'wechat-license'
)

_upstream_name='wechat'
_deb_url_common='https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_'
_deb_prefix="${_pkgname}-${pkgver}-"

source_x86_64=("${_deb_prefix}x86_64.deb::${_deb_url_common}x86_64.deb")
source_aarch64=("${_deb_prefix}aarch64.deb::${_deb_url_common}arm64.deb")
source_loong64=("${_deb_prefix}loong64.deb::${_deb_url_common}LoongArch.deb")

noextract=("${_deb_prefix}"{x86_64,aarch64,loong64}.deb )

sha256sums=(
    'fffa82838ce86288651862b3882a810eea079c902cb85f4a0529b3539beb35c9'
    '0563472cf2c74710d1fe999d397155f560d3ed817e04fd9c35077ccb648e1880'
    'f4b744db5543e31e2be823129693e7b918be191cad5616c1054dd9c1e95cd734'
    '93f5363c956b7d13e0408e14fe97abe936916da8d4adf414e74ad334e308f37c'
    'fc3ce9eb8dee3ee149233ebdb844d3733b2b2a8664422d068cf39b7fb08138f8'
    'f05f6f907898740dab9833c1762e56dbc521db3c612dd86d2e2cd4b81eb257bf'
    '898ebc397583d111db9a337e9d09aaee2f795fcd720e65cab5ce0e92efcd8f10'
)

sha256sums_x86_64=(
    'a0db8caeee8d1e6cfe0aa5ce58710270f8d74a90ff4920f53a3fc22aa0956fe9'
)
sha256sums_aarch64=(
    '374732eda88a6f3a7e4eb315e64e5fac73ef17923d504d242964f19ed1b80c75'
)
sha256sums_loong64=(
    'ec580793cced556aadc236e8935750ce1489ba8f796092ba39d3d1822309cdc2'
)

prepare() {
    echo 'Extracting data from deb...'
    bsdtar --extract --to-stdout --file "${_deb_prefix}${CARCH}.deb" ./data.tar.xz |
        xz --to-stdout --decompress --threads 0 |
        tar --strip-components 2 --extract ./opt/"${_upstream_name}" ./usr/share/icons/hicolor

    mv share/icons/hicolor icons
    rm -rf share "${_upstream_name}"/libuosdevicea.so

    echo "Preparing to compile ${_lib_uos}.so..."
    mv "${_lib_uos}".Makefile Makefile

    echo 'Stripping executable permission of non-ELF files...'
    cd "${_upstream_name}"
    local _file
    find . -type f -perm /111 | while read _file; do
        if [[ $(file --brief "${_file}") == 'ELF '* ]]; then
            continue
        fi
        stat --printf '  %A => ' "${_file}"
        chmod u-x,g-x,o-x "${_file}"
        stat --format '%A %n' "${_file}"
    done

    echo 'Patching rpath...'
    patchelf --set-rpath '$ORIGIN' 'libwxtrans.so'
    echo "  '\$ORIGIN' <= libwxtrans.so"
    cd vlc_plugins
    find . -type f | while read _file; do
        echo "  '\$ORIGIN:\$ORIGIN/../..' <= vlc_plugins/${_file}"
        patchelf --set-rpath '$ORIGIN:$ORIGIN/../..' "${_file}"
    done
}

build() {
    echo "Building ${_lib_uos}.so stub by Zephyr Lykos..."
    make
}

package() {
    echo 'Populating pkgdir with earlier extracted data...'
    mkdir -p "${pkgdir}"/opt
    cp -r --preserve=mode "${_upstream_name}" "${pkgdir}/opt/${_pkgname}"

    echo 'Installing icons...'
    for res in 16 32 48 64 128 256; do
        install -Dm644 \
            "icons/${res}x${res}/apps/${_upstream_name}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
    done

    local _wechat_root="${pkgdir}/usr/lib/${_pkgname}"

    echo 'Fixing licenses...'
    install -dm755 "${pkgdir}"/usr/lib/license # This is needed if /usr/lib/license/${_lib_uos}.so needs to be mounted in sandbox
    install -Dm755 {,"${_wechat_root}"/usr/lib/license/}"${_lib_uos}.so"
    echo 'DISTRIB_ID=uos' |
        install -Dm755 /dev/stdin "${_wechat_root}"/etc/lsb-release

    echo 'Installing scripts...'
    install -Dm755 wechat-universal.sh "${_wechat_root}"/common.sh
    ln -s common.sh "${_wechat_root}"/start.sh
    ln -s common.sh "${_wechat_root}"/stop.sh
    ln -s common.sh "${_wechat_root}"/pdfjsfix.sh
    mkdir -p "${pkgdir}"/usr/bin
    ln -s ../lib/"${_pkgname}"/common.sh "${pkgdir}"/usr/bin/"${_pkgname}"

    echo 'Installing desktop files...'
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    if [[ "${WECHAT_ALIAS_ICON}" == 'yes' ]]; then
        # Plasma resolves WeChat's hardcoded desktop-entry=wechat to get the app icon.
        # This however conflicts with non-wrap version, so don't install the icon by default
        install -Dm644 "${_pkgname}-alias-icon.desktop" "${pkgdir}/usr/share/applications/${_upstream_name}.desktop"
        # Addtional "fixup" for tray / window icon for built-in browser and official accounts
        install -Dm644 "${_pkgname}-alias-browser.desktop" "${pkgdir}/usr/share/applications/com.tencent.wechatappex.desktop"
        ln -s common.sh "${_wechat_root}"/wechatappex.sh
    else # Strip out the wechatappex applet that we never need
        sed '
            /^applet_wechatappex() {$/,/^$/d
            /^'"    'wechatappex.sh'|'wechatappex')"'$/,/;;/d
            s/, wechatappex.sh (alias wechatappex)//
        ' -i "${_wechat_root}"/common.sh
    fi
    echo 'Installing license...'
    install -Dm644 {,"${pkgdir}/usr/share/licenses/${_pkgname}/"}wechat-license
}
