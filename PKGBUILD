# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=launcherx-bin-fix-sums
pkgver=2025.8.17
pkgrel=1
pkgdesc="LauncherX is a cross-platform minecraft launcher for next generation(fixed checksums)"
arch=('x86_64' 'aarch64')
url="https://corona.studio/lx"
provides=("launcherx")
conflicts=("launcherx" "launcherx-bin")
makedepends=('jq' 'libarchive' 'curl')
options=('!strip')
source=(
        "LauncherX.desktop"
        "LauncherX.png")
sha256sums=(
            'b8eead686e80061adeff1cc5af92e18ecedcd3e4dbc39c86b5db5276f9ee0473'
            '9408fdaf9db619d4c50f35de6d6bce81abbd718ecc1bfd9b4e4d5ad6a095d2f9')
prepare() {
    # 选择正确的 runtime
    echo "Determining runtime for arch: $CARCH"
    case "$CARCH" in
        x86_64)  _runtime='linux-x64' ;;
        aarch64) _runtime='linux-arm64' ;;
        *)       error "Unsupported arch: $CARCH" ;;
    esac

    # 获取版本信息
    echo "Fetching build info for runtime: $_runtime"
    _json=$(curl -s 'https://api.corona.studio/Build/get/latest/all/stable')
    _id=$(jq -r --arg rt "$_runtime" '.[] | select(.runtime==$rt) | .id' <<< "$_json")
    _hash=$(jq -r --arg rt "$_runtime" '.[] | select(.runtime==$rt) | .fileHash' <<< "$_json")

    [[ -z $_id ]] && error "Failed to find build id for $_runtime"

    # 下载
    echo "Downloading LauncherX build id: $_id"
    _url="https://api.corona.studio/Build/get/${_id}/net9.0-linux.${_runtime}.zip"
    curl -L "$_url" -o launcherx.zip
    
    # 解压并改名
    echo "Extracting and renaming binary..."
    bsdtar -xf launcherx.zip

    # 校验
    echo "Verifying checksum..."
    echo "$_hash  LauncherX.Avalonia" | sha256sum -c -
}

package() {
    install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/launcherx"
    install -Dm644 "${srcdir}/LauncherX.desktop"  "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "${srcdir}/LauncherX.png"      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}