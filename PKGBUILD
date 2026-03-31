# Maintainer: John Fritz P. Antipuesto <johnfritzantipuesto2020@gmail.com>

pkgname=zerochan-downloader-bin
_pkgname=ZerochanDownloader
pkgver=1.0.2
pkgrel=1  # Bumped the release number since we are fixing the package
pkgdesc="A clean, native desktop client for browsing and downloading from Zerochan"
arch=('x86_64')
url="https://github.com/jp319/ZerochanDownloader"
license=('MIT')
provides=('zerochan-downloader')
conflicts=('zerochan-downloader')

depends=('glibc' 'hicolor-icon-theme' 'libx11' 'libxrender' 'libxtst' 'libxi' 'alsa-lib')

source=("${url}/releases/download/v${pkgver}/zerochan-downloader_${pkgver}_amd64.deb")
sha256sums=('91b10ff473743390dfe80c9b6775f3bccedfbab798f79b0032cda26b4447e81e')

package() {
    msg2 "Extracting application data..."
    tar -xf data.tar.* -C "${pkgdir}"

    # 1. Find where the app was actually installed in /opt/
    local _optdir=$(find "${pkgdir}/opt" -mindepth 1 -maxdepth 1 -type d -print -quit)
    local _app_path=${_optdir#${pkgdir}} # Gives the path without the pkgdir prefix (e.g., /opt/zerochan-downloader)

    # 2. Find the executable binary inside the bin folder
    local _binary_path=$(find "${_optdir}/bin" -mindepth 1 -maxdepth 1 -type f -print -quit)
    local _binary_name=$(basename "${_binary_path}")

    # 3. Create the terminal command symlink
    msg2 "Setting up executable symlink..."
    install -d "${pkgdir}/usr/bin"
    ln -s "${_app_path}/bin/${_binary_name}" "${pkgdir}/usr/bin/zerochan-downloader"

    # 4. Create the .desktop file manually
    msg2 "Setting up desktop entry..."
    install -d "${pkgdir}/usr/share/applications"

    # Compose Multiplatform bundles the icon in the lib/ folder inside /opt/
    local _icon_path=$(find "${_optdir}/lib" -name "*.png" -print -quit)
    local _final_icon_path=${_icon_path#${pkgdir}}

    cat > "${pkgdir}/usr/share/applications/zerochan-downloader.desktop" <<EOF
[Desktop Entry]
Name=Zerochan Downloader
Comment=A clean, native desktop client for browsing and downloading from Zerochan
Exec=/usr/bin/zerochan-downloader
Icon=${_final_icon_path}
Terminal=false
Type=Application
Categories=Network;Utility;
EOF
}
