# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.7.4
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
sha256sums=('7781852221a4755dfa09fa6fe8b4eb140cea98532897215db5dab50232ad78cd'
            'd352ee34cacbacfe3fa38f77f3daf03c69560dcb14fc8da17bf2cea583edf11b'
            'ac982d729e5d173d8303e7405be656ae7b4de7e4833f63d7d9e1a685e17e864d')
b2sums=('646b893df8baf5e0e8fc985b16a2c6f06962d39f3ad5bad016f8522ffd7276e3d25feafe1aab3c970909a5b9d12ad570dbdbc564612e59788aa65b06893f10cc'
        'de360b0b4ddb606ba3ec83e9fba916e705982716faa9f39c193e237ca9caa1ac8b6367a17ae881a23413faa032082f1fbfc8e742f9254ef3645c3820b9060f9c'
        '2d5a9ad0aeb96ebf7d8cfab9f1a72994f5cda5259362bf563956032c0051db01bf5fb8ea5412059f97d8b11d5fa0ab92dcba13e627616fee477bfedf6550fb78')

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
