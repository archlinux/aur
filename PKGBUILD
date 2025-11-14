# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.7.3
pkgrel=1
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
_baseurl=https://github.com/janhq/jan/releases/download/v$pkgver
source=("$_appimage::$_baseurl/Jan_${pkgver}_amd64.AppImage"
        "$pkgname-$pkgver-latest.json::$_baseurl/latest.json"
        "$pkgname-$pkgver-tauri.conf.json::https://raw.githubusercontent.com/janhq/jan/refs/tags/v$pkgver/src-tauri/tauri.conf.json")
sha256sums=('1d4ea8396817cfcb2c0fa3d53407769ffeeeae9734a694104f9d7c845e26b757'
            'e767bf5b7739e1de66b9e7381b8af9dc0a5aa2ccf859abe190e5ed745c320c0b'
            '882ce976cb1cb3322f690092efb52ba27ecb4663119d241e32273067acce1033')
b2sums=('9ae8b17659f851a5c52b0e8f27e63b4b9f50d06b9e5d6728b13a3e353919c5ac35fe6d79a0d407e581d0a145eb1bf02205f7f4300b2a5333d4ff00d4faf5b262'
        'bbe4fc0685e888627df061c23cc5320f4f1423f153123e158f9f40e02b58e89e526bcf90e465703413bf8676d02d9651a1f142be0c3d8e21fe95d8c3b501b883'
        '44851de89a120261b5c26e7ef1f0e65d8c91ac1901b34e1d881c5a326159953a07841fed0595b79ef04b0b3f8c2c30bb83c1395da03196fbc226f5d1a3b48217')

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
