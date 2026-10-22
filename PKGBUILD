# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.8.7
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
source=($_appimage::$_baseurl/Jan_${pkgver}_amd64.AppImage
        $pkgname-$pkgver-latest.json::$_baseurl/latest.json
        $pkgname-$pkgver-tauri.conf.json::https://raw.githubusercontent.com/janhq/jan/refs/tags/v$pkgver/src-tauri/tauri.conf.json)
b2sums=('1e21a2e49cd32a4ae23e32f0d355e1b2cf774225f9dbbc0151e2929c33f08852aa16c05ebfb815605c352c125afb4b7c8cc2e5b828cafbdd938bfa147abc8c7e'
        'b434294cbdeee3fad41965376e2d27cbe0a05d218c64e9cfc62aade84e0a7478d8362e7b197d715e276be4d8936d4b94b6149d30d8dd95b94ffb4abeaa6f5729'
        'd2975b35011e825e0df80b930aa7f93105395298b241be0cbe35d5e45c15c13899b1c27b8204d3041c758cb2e78301f77af9f7482c07b27e6e57f65c3c20924c')

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

    sed -i -e 's|^Exec=Jan-Desktop$|Exec=env DESKTOPINTEGRATION=false /usr/bin/Jan|' \
        -e 's|^Icon=Jan-Desktop$|Icon=Jan|' \
        squashfs-root/Jan.desktop

    find squashfs-root/usr/share/icons -type f -name 'Jan-Desktop.png' -execdir mv '{}' Jan.png \;

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
