# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=0.23.1
_gittag=v$pkgver
pkgrel=3
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
makedepends=('patchelf')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('1c357d77a1b24e70b122f34e14b3a54e57270f4ccbf2f2b6f9afc8b54e59ed4e9096bb8b9c7257d4ff93f2e8783763f8298b2461470d2e4bb149e070ea6b0238'
        '6d8d4bdbf645258545e50d01ea5a2a6ea85ba937bd6adaa659cb4106531b76613915ac24f54e60546c77e07b9b01ed702c441556c75080f0d29ef3005b7763d8')

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
