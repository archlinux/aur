# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=recstar
pkgver=1.2.0
pkgrel=1
pkgdesc="Reclist recorder app"
arch=('i686' 'x86_64')
url="https://github.com/sdercolin/$pkgname"
license=('Apache-2.0')
groups=($pkgname)
depends=('alsa-lib' 'binutils' 'fontconfig' 'libglvnd' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.deb::https://github.com/sdercolin/recstar/releases/download/$pkgver/$pkgname-$pkgver-amd64.deb"
        "$pkgname-wrapper.sh"
        "RecStar.png"
        "$pkgname.desktop"
        "LICENSE.txt")
md5sums=('f89a007e01ff824e3e40a4d80a1b145e'
         '5fb85b2b726a8a095309eaca33a91a25'
         '2863044d5a3a13dbfdfb158b3dad72d8'
         '2768514f09569aea400f87fb68ab49ec'
         '7929726c8d528b99c2bfcf7b7f163235')
sha512sums=('7a6d35f8f232366a85e1ca9832d8bbb4aa8d539603b872425c30f5583da34e4f74042256a07c60e5d4d7be97d861c3dc76daa98119b00b8739f4b85599a7b156'
            '222426b30893535e194024a8d3b81808fe5e7e821e3ffb17699b400f1e36ab6ac417444a1318e5b15ab9769a72340bd0a54b26995455cd6bc91cbf9f8e56ba5a'
            'd6107a773e66fcbf7a5ad0cd45de4e588114fc72c55d993788ae4b2afccc6c645ee4a37f5909a3701ad8befb91bd694bdd9cdfa8e11301faf0352781db6fc45d'
            '6afab82b5db491ce1ad15a9fbf3741dedaf0eef5db325d9ac94fbd566943e3048853bc47725240ad9734c0c6c8505e1ba6be9c7bc5870d457b2d1be6ed97b13b'
            '0880eda249fbf5c5cd28224d3c21bb76ec8559b25e20f2866a0ccaeffbe6a3eed99916d939b2d49e5ab6cbaabaa7f65824155109d8ebd33ae3a210ecaaf4854a')

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
    install -Dm755 "$srcdir/$pkgname-wrapper.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 RecStar.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/RecStar.png"

    # Install custom .desktop file (since the pre-built one isn't optimized for Arch Linux)
    install -Dm644 "$srcdir/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"

    # Install LICENSE
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
