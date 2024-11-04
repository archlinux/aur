# Maintainer: Hajos Attila <linux.alucard@gmail.com>

pkgname=sunshine-beta-bin
_pkgname=sunshine-beta-bin
pkgver=2024.1104.132957
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://raw.githubusercontent.com/LizardByte/Sunshine/$_gittag/packaging/linux/sunshine.desktop"
)
arch=('x86_64')
license=('GPL3')
depends=('avahi'
         'boost-libs'
         'curl'
         'libayatana-appindicator'
         'libevdev'
         'libmfx'
         'libnotify'
         'libpulse'
         'libva'
         'libvdpau'
         'libx11'
         'libxcb'
         'libxfixes'
         'libxrandr'
         'libxtst'
         'miniupnpc'
         'numactl'
         'openssl'
         'opus'
         'udev')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')
conflicts=(sunshine sunshine-git sunshine-bin)
makedepends=('patchelf')
provides=('sunshine-bin')
sha256sums=('SKIP'
        '3a78c9ceb45dca435d3542c6416b511293743b32c7f384a3689d4addf3653989')

prepare() {
    sed -i "s/@PROJECT_NAME@/$_pkgname/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_DESCRIPTION@/$pkgdesc/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_VERSION@/$_gittag/g" "$_pkgname-$pkgver.desktop"

    patchelf \
    --replace-needed libminiupnpc.so.1{7,8} \
    --replace-needed libboost_locale.so.1.8{3,6}.0 \
    --replace-needed libboost_log.so.1.8{3,6}.0 \
    --replace-needed libboost_filesystem.so.1.8{3,6}.0 \
    --replace-needed libboost_program_options.so.1.8{3,6}.0 \
    --replace-needed libboost_thread.so.1.8{3,6}.0 \
    "usr/bin/sunshine"
}

package() {
    install -Dm755 "usr/bin/sunshine-v$pkgver" "$pkgdir/usr/bin/sunshine"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    cp -r "usr/lib" "usr/share" "$pkgdir/usr"
}
