# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: redponike <proton (dot) me>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
pkgver=0.8.1
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
sha256sums=('5219e06097861f4cea2751827b2052e38ba9c7f7a2afeb6a489855961f7eff17'
            '02bc950d1c9870a5a7c9bf897874f6b6406630c2e92488e353a3122133082fc0'
            'a4a08aac54436ab2645c008a0bc7532f06e9c86595ae5aab6c653a17919799d1')
b2sums=('4e861444c562b509e0bb6d591d9a9cf682a51c554e6fe788814db3af2f71f950755e02915578e3c95a571aa4d2039f030eee12139de69c5874f7750708f350c5'
        'ef1c97c0f3b5c7dbec22e93416fda92a43c50a596deb3fe5ab9e95fed0d4c409343487f3f3e97910b50861bdda766147da1d05f6cee61306e9a4f0eba5f98e20'
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
