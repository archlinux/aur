# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.7.6
pkgrel=1
pkgdesc='An open source alternative to ChatGPT that runs 100% offline on your computer'
arch=(x86_64)
url='https://jan.ai/'
license=(Apache-2.0)
makedepends=(jq minisign)
depends=(fuse2 hicolor-icon-theme)
provides=(jan)
conflicts=(jan)
options=(!strip !debug)
_appimage=$pkgname-$pkgver.AppImage
_baseurl=https://github.com/janhq/jan/releases/download/v$pkgver
source=("$_appimage::$_baseurl/Jan_${pkgver}_amd64.AppImage"
        "$pkgname-$pkgver-latest.json::$_baseurl/latest.json"
        "$pkgname-$pkgver-tauri.conf.json::https://raw.githubusercontent.com/janhq/jan/refs/tags/v$pkgver/src-tauri/tauri.conf.json")
sha256sums=('5633a054dd0ebf063b297dcf5960fb31e7843dca5568bc401186d94dda455677'
            '8ef4190cf36bd014ebe299085611b1786da1b3a7cad27abd74b9f26a19f4a4d5'
            '72e8efe6d15d54748ea59c9d555e29bcaa8c1ed47ca803142f6cb22e1610cfd5')
b2sums=('2e097c989981a08c9b2b1673bdd337c8d0cfd92c1a570d91b14405b866b81fbe0ab54d8d777fc38522b67ec068820e1f6c25c0a150936ebab77e68bc9567236f'
        '686fa2a42b412f50111a7edc15691aa318f5fe0933d47baaab8962f8cd5e5d6fbce8b8fd2e93d0fc4252f73d92cf5e90713039f150e7fd59a09b51de3d2d7d67'
        '08ba324b472c7fb92dc36442d48c46245e16b1e8192c25877f5c7bf183cb79fd5b9357ca563b98ba17cd9685f31b70344ab96070ca63724e8dc6c40bce4b944f')

prepare() {
    # XXX: move to verify() when devtools supports it
    # https://gitlab.archlinux.org/archlinux/devtools/-/issues/224
    jq -r '.platforms["linux-x86_64"].signature' $pkgname-$pkgver-latest.json \
        | base64 -d > $_appimage.minisig

    jq -r '.plugins.updater.pubkey' $pkgname-$pkgver-tauri.conf.json | base64 -d > Jan.pubkey

    minisign -Vm "$_appimage" -p Jan.pubkey

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
    install -Dm755 $_appimage "$pkgdir/opt/Jan/Jan.AppImage"

    # Symlink executable
    install -d "$pkgdir/usr/bin"
    ln -s /opt/Jan/Jan.AppImage "$pkgdir/usr/bin/Jan"

    # Install desktop entry and icon
    install -Dm644 squashfs-root/Jan.desktop -t "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"
    find "$pkgdir/usr/share/icons" -type d -empty -delete
}
