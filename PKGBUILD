# Maintainer: Collide <three-dim-sky@foxmail.com>
# Contributor: Kimiblock Moe <kimiblock@icloud.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=feishu-portable
pkgver=7.46.12
_pkghash_x64=72e0cee3
_pkghash_arm64=ea20b00e
pkgrel=1
epoch=1
pkgdesc="Linux client of Feishu (Lark) from Bytedance. Sandboxed by portable."
arch=('x86_64' 'aarch64')
url="https://www.feishu.cn/"
license=('LicenseRef-feishu')
options=(!debug !strip !emptydirs)
provides+=('feishu-bin' 'feishu')
conflicts=('feishu' 'feishu-bin')
makedepends+=(xdg-utils)
source_x86_64=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_x64}/Feishu-linux_x64-${pkgver}.deb")
source_aarch64=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_arm64}/Feishu-linux_arm64-${pkgver}.deb")
source=(
    portable-config
    com.bytedance.feishu.desktop
    feishu.sh
)
sha256sums_x86_64=('a9d696c78bd041626d117fb7c68ea81a9f36b1b96c59bd6307deb0f1d8dcef03')
sha256sums_aarch64=('ce1eb9faff49591bfadf58500d29cac07d42f08df975d469abc91c9e145ee30a')
sha256sums=(
    '9b1af79bfa82138525d98b5fc1c6be9fc177b866de13f19bc6580b8be1cca1bd'
    '6c96e320a3203642798d4e52262c01740e8adcd5f7bc613b5bfa2c13b9cb9606'
    'c445a576126f6a7b33e9a35b472d33bcb7d2e56bcf2c99de7551b8c48bb52f8d'
)

function package() {
    depends+=(ca-certificates gtk3 nss xdg-utils dnsmasq portable libmfx libpulse alsa-lib xwaylandvideobridge)

    tar -xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/menu" "${pkgdir}/usr/bin"
    install -Dm755 portable-config "${pkgdir}/usr/lib/portable/info/com.bytedance.feishu/config"
    install -Dm644 com.bytedance.feishu.desktop "${pkgdir}/usr/share/applications/com.bytedance.feishu.desktop"
    install -Dm755 feishu.sh "${pkgdir}/usr/bin/feishu-portable"
    install -Dm755 feishu.sh "${pkgdir}/usr/bin/feishu"

    # This is from the original feishu PKGBUILD, I have no idea why it's there
    sed -i 's/bytedance-feishu/feishu/g' "${pkgdir}/usr/share/appdata/bytedance-feishu.appdata.xml"
    sed -i 's/bytedance-feishu/feishu/g' "${pkgdir}/opt/bytedance/feishu/bytedance-feishu"

    # From feishu-bin PKGBUILD
    # Fix directory permissions
    find "${pkgdir}" -type d | xargs chmod 755

    mkdir -p "${pkgdir}/usr/share/icons"
    # From original .install
    export HOME="${srcdir}/icon-gen"
    export XDG_DATA_HOME="${srcdir}/icon-gen"
    rm -rf "${srcdir}/icon-gen"
    mkdir "${srcdir}/icon-gen"

    # From feishu-bin.install {{
    # Add icons to the system icons
    local icons="product_logo_48.png product_logo_24.png product_logo_256.png product_logo_16.png product_logo_64.png product_logo_128.png product_logo_32.png"
    for icon in $icons; do
        local size="$(echo ${icon} | sed 's/[^0-9]//g')"
        xdg-icon-resource install --size "${size}" --mode "user" "${pkgdir}/opt/bytedance/feishu/${icon}" "bytedance-feishu"
    done

    # install_svg_icons
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    cp -r "${XDG_DATA_HOME}/icons/hicolor"/* -t "${pkgdir}/usr/share/icons/hicolor"
    # Fix directory permissions
    chmod 755 -R "${pkgdir}/usr/share/icons"

    # add_nss_symlinks
    local nss_files="libnspr4.so.0 libplds4.so.0 libplc4.so.0 libssl3.so.1 libnss3.so.1 libsmime3.so.1 libnssutil3.so.1"
    for f in $nss_files; do
        ln -sf "/usr/lib/${f%.*}" "${pkgdir}/opt/bytedance/feishu/${f}"
    done
    # }}

    # license
    install -d "${pkgdir}/usr/share/licenses/feishu-portable"
    echo 'https://www.feishu.cn/terms' >"${pkgdir}/usr/share/licenses/feishu-portable/terms.url"
}
