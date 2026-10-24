# Maintainer: Yueyuri <lxf74663@gmail.com>
pkgname=mcloud-electron
pkgver=1.1.2
kylinv=112
pkgrel=1
pkgdesc="中国移动云盘 (麒麟桌面版)"
arch=('x86_64')
url="https://yun.139.com/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
provides=('mcloud-bin')
conflicts=('mcloud-bin')
source=("https://yun.mcloud.139.com/mCloudPc/kylinV${kylinv}/com.cmic.mcloud_${pkgver}_amd64.deb"
        "com.cmic.mcloud.desktop")
sha256sums=('11c74e59cd2b43985d0bdf013ee553b1442c0f733748fe8673eba7bc54899485'
            '07b9790021968e4372018ac925e13c38780dab20c472adf24fccbe9238a13299')

prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}" --exclude="*icons_mac*"
}

package() {
    local _app_dir="${pkgdir}/opt/mcloud"
    install -d "$_app_dir"
    cp -a "${srcdir}/opt/apps/com.cmic.mcloud/"* "$_app_dir/"

    local _process_dir="$_app_dir/processes"
    local _unpacked_dir="$_app_dir/resources/app.asar.unpacked"

    rm -f "$_process_dir"/libQt5*.so*
    rm -f "$_process_dir"/libicu*.so*
    rm -rf "$_unpacked_dir/node_modules/phantomjs-prebuilt"
    rm -rf "$_unpacked_dir/node_modules/zip-7z/bin/MacOS"
    rm -rf "$_unpacked_dir/node_modules/zip-7z/src"
    rm -rf "$_unpacked_dir/resources/icons_mac"
    rm -rf "$_unpacked_dir/resources/uos"*
    rm -f "$_app_dir"/plugins/*.dll "$_app_dir"/plugins/*.exp "$_app_dir"/plugins/*.lib

    chmod -R 755 "$_process_dir"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/com.cmic.mcloud.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.cmic.mcloud.png"

    install -Dm644 "${srcdir}/com.cmic.mcloud.desktop" \
        "${pkgdir}/usr/share/applications/com.cmic.mcloud.desktop"

    install -Dm644 "${srcdir}/opt/apps/com.cmic.mcloud/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/bin"
    cat << 'EOF' > "${pkgdir}/usr/bin/mcloud"
#!/bin/bash

# 禁用 core dump
ulimit -c 0

REAL_HOME="${HOME}"
DATA_DIR="${XDG_DATA_HOME:-$REAL_HOME/.local/share}"
MCLOUD_SANDBOX="$DATA_DIR/mcloud_env"
RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
TMP_LOG_DIR="$RUNTIME_DIR/mcloud-logs"

mkdir -p "$MCLOUD_SANDBOX/mCloud"
mkdir -p "$TMP_LOG_DIR"

LOG_DIR="$MCLOUD_SANDBOX/mCloud/log"
if [ -d "$LOG_DIR" ] && [ ! -L "$LOG_DIR" ]; then
    rm -rf "$LOG_DIR"
fi
ln -sfn "$TMP_LOG_DIR" "$LOG_DIR"

export HOME="$MCLOUD_SANDBOX"
export XDG_CONFIG_HOME="$MCLOUD_SANDBOX/.config"
export XDG_DATA_HOME="$MCLOUD_SANDBOX/.local/share"
export XDG_CACHE_HOME="$MCLOUD_SANDBOX/.cache"

exec /opt/mcloud/mcloud "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/mcloud"
}
