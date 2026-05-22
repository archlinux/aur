# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.8.0
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
sha256sums=('74a2d8c80bce0101fbbce6e966c8b7d378b80cb310bbde34497d77c10e2692b1'
            '66cd03ea3bf3d0466d0b7143879f9638ef89a9117b219f17b694cd377b22fa7f'
            'a4a08aac54436ab2645c008a0bc7532f06e9c86595ae5aab6c653a17919799d1')
b2sums=('74a29a3787b9b33e54567b37bbab90a2006386f5320b21fae3ff17136d041ec5acb8706d1433101e12a801ff291377de261c668da298f02349a63c696b4c3d6d'
        'd79a45b541659f40e6d9a02a54914bbefafc642404170553cc6c2b5180a8e2bf7bf3f520c0de82303b5b6786f07efb805d14253eef47bd4dcc1475e4fa337542'
        '49cff6d893f19ac9a0ae54e75b90de3b556408329eb763a211469f092b255e87590501a1368a972e1b85fedbe4b6080fa1c543b7ffeb878ef9fb9a6798c4f64a')

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
