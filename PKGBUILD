# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=recstar
pkgver=1.1.2
pkgrel=1
pkgdesc="Reclist recorder app"
arch=('i686' 'x86_64')
url="https://github.com/sdercolin/recstar"
license=('Apache')
groups=('recstar')
depends=('alsa-lib' 'binutils' 'fontconfig' 'libglvnd' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.deb::https://github.com/sdercolin/recstar/releases/download/$pkgver/recstar-$pkgver-amd64.deb"
        "recstar-wrapper.sh"
        "recstar.desktop")
sha512sums=('56861d38cabb2872504a21df5c23d646d7bfe453491429fbd2f12ce9fa7a1d84b20f7f955eab9f620be2642bb1d5c24fc4dd41ce9d36ad6e07835ff28710f50b' '222426b30893535e194024a8d3b81808fe5e7e821e3ffb17699b400f1e36ab6ac417444a1318e5b15ab9769a72340bd0a54b26995455cd6bc91cbf9f8e56ba5a' '6afab82b5db491ce1ad15a9fbf3741dedaf0eef5db325d9ac94fbd566943e3048853bc47725240ad9734c0c6c8505e1ba6be9c7bc5870d457b2d1be6ed97b13b')
md5sums=('c0029bdde56e7ced49a09a07c02a4079' '5fb85b2b726a8a095309eaca33a91a25' '2768514f09569aea400f87fb68ab49ec')

package() {
    cd "$srcdir"

    # We're using the .deb file as a base since it contains a binary
    local_deb_file="$pkgname-$pkgver.deb"

    # Extract data archive from .deb
    ar x "$local_deb_file" data.tar.zst

    bsdtar -xf data.tar.zst -C "$pkgdir"

    # Remove .deb data archive since we no longer need it
    rm data.tar.zst

    # Make folder for special wrapper script
    install -d "${pkgdir}/usr/bin"

    # Install wrapper script
    # This wrapper script preloads libfreetype.so to fix a font rendering issue on Linux
    install -Dm755 "$srcdir/recstar-wrapper.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Move icon over to proper location
    local deb_icon_path="$pkgdir/opt/recstar/lib/RecStar.png"
    local arch_icon_dir="$pkgdir/usr/share/icons/hicolor/512x512/apps"

    mkdir -p "$arch_icon_dir"

    if [ -f "$deb_icon_path" ]; then
        echo "Copying icon from Debian path to Arch path..."
        cp "$deb_icon_path" "$arch_icon_dir/"

        # c) OPTIONAL: Remove the (now empty) Debian directory structure
        echo "Icon copied successfully."
    else
        echo "Warning: Icon file not found at $deb_icon_path. Skipping move."
    fi

    # Install custom .desktop file (since the pre-built one isn't optimized for Arch Linux)
    install -Dm644 "$srcdir/recstar.desktop" "${pkgdir}/usr/share/applications/recstar.desktop"
}
