# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.7.2
pkgrel=2
pkgdesc='An open source alternative to ChatGPT that runs 100% offline on your computer'
arch=('x86_64')
url='https://jan.ai/'
license=('Apache-2.0')
makedepends=('jq' 'minisign')
depends=('fontconfig' 'fribidi' 'fuse2' 'harfbuzz' 'hicolor-icon-theme' 'libx11' 'mesa' 'wayland')
provides=('jan')
conflicts=('jan')
options=(!strip)
_appimage=$pkgname-$pkgver.AppImage
_baseurl=https://github.com/menloresearch/jan/releases/download/v$pkgver
source=("$_appimage::$_baseurl/Jan_${pkgver}_amd64.AppImage"
        "$pkgname-$pkgver-latest.json::$_baseurl/latest.json"
        "$pkgname-$pkgver-tauri.conf.json::https://raw.githubusercontent.com/menloresearch/jan/refs/tags/v$pkgver/src-tauri/tauri.conf.json")
sha256sums=('b73d22b7d3584fe1ce8c9d31c6cc5f4e1d15c34a7e31fa754996d3e4ce4333ed'
            '04acb3f5e827268540bf8dad7a519ac979d5e33aeb15f07dee25507c7cc9f557'
            '394084759ccc705ae65dbc6acdd6e7465828cb863dcec48aecc069cb6904fbb2')
b2sums=('a44a0c6ad83e388f2dc02f69b1d04e5d5abe9a6a72857c6231f26cd7009fd5e2645647d5442aa11c2e0a7a7b1148ea0345b98b21dfc93e206e81302b589e979f'
        'a6302ae3d0292c9178ea82458ec64baf1b4890404e770a6a0fa0498a0b04c5d6fa0b7a821c20692fed4b3dc4216f74ba4426727e08288935ce9b354719d30467'
        '8fdbf5e43bc9701d0ee1e339683cc17992090dd63ddcb9463e6a9dfec48afd2f7149eac398fb3e436a65342b60b926e0f75c1fba5bae18d00a3421d8c9a0871f')

verify() {
    jq -r '.platforms["linux-x86_64"].signature' $pkgname-$pkgver-latest.json \
        | base64 -d > $_appimage.minisig

    jq -r '.plugins.updater.pubkey' $pkgname-$pkgver-tauri.conf.json | base64 -d > Jan.pubkey

    minisign -Vm "$_appimage" -p Jan.pubkey
}

prepare() {
    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $_appimage $_appimage.copy
    chmod +x $_appimage.copy
    ./$_appimage.copy --appimage-extract
    rm $_appimage.copy
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/Jan|" \
        "squashfs-root/Jan.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 $_appimage "$pkgdir/opt/Jan/$_appimage"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Jan/$_appimage "$pkgdir/usr/bin/Jan"

    # Install desktop entry and icon
    install -Dm644 squashfs-root/Jan.desktop "$pkgdir/usr/share/applications/Jan.desktop"
    install -dm755 "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"
    find "$pkgdir/usr/share/icons" -type d -empty -delete
}
