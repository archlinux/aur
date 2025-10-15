pkgname=clash-verge-rev-autobuild-latest-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1015.ef9ccaf
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri (auto-updates from latest.json)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
makedepends=('jq' 'curl')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "$_pkgname-bin" "$_pkgname-autobuild-bin")
options=(!strip)
install=.install

source=("latest.json::${url}/releases/download/autobuild/latest.json")
sha512sums=('SKIP')

pkgver() {
    jq -r '.version' latest.json
}

prepare() {
    # Extract version from latest.json and construct the download URL for the current architecture
    local arch_key=""
    case "$CARCH" in
        x86_64)
            # Build the .deb file URL from version string
            local version=$(jq -r '.version' latest.json)
            local deb_url="${url}/releases/download/autobuild/Clash.Verge_${version}_amd64.deb"
            ;;
        aarch64)
            local version=$(jq -r '.version' latest.json)
            local deb_url="${url}/releases/download/autobuild/Clash.Verge_${version}_arm64.deb"
            ;;
        armv7h)
            local version=$(jq -r '.version' latest.json)
            local deb_url="${url}/releases/download/autobuild/Clash.Verge_${version}_armhf.deb"
            ;;
    esac

    # Download the .deb file for the current architecture
    msg2 "Downloading ${deb_url}..."
    curl -L -o "${_pkgname}.deb" "${deb_url}"
}

package() {
    # Extract the .deb file
    bsdtar -xf "${_pkgname}.deb" data.tar.gz
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
