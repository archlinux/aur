# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=2025.122.141614
_gittag=v$pkgver
pkgrel=2
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://raw.githubusercontent.com/LizardByte/Sunshine/$_gittag/packaging/linux/sunshine.desktop"
)
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
install=sunshine.install
depends=(
    'avahi'
    'curl'
    'libayatana-appindicator'
    'libcap'
    'libdrm'
    'libevdev'
    'libicuuc.so'  # icu
    'libminiupnpc.so'  # miniupnpc
    'libmfx'
    'libnotify'
    'libpulse'
    'libva'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'numactl'
    'openssl'
    'opus'
    'udev'
)
optdepends=(
    'cuda: Nvidia GPU encoding support'
    'libva-mesa-driver: AMD GPU encoding support'
    'xorg-server-xvfb: Virtual X server for headless testing'
)
makedepends=('patchelf')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('bd022ee27d9f28e5cb19a90db84a3230f5e8160d634bb5ac32354a2b8bd79a7c8902ec08dbdda670c54829fe68d0267ce619da32d23537160d207d78da2b9abc'
        'ed6cac298a7a42bcee3bc653834f1ff017732cc2e26b5fb845ef4af77d4153a573943acc41b92bb65c8a7140117f5ab38759e1e5c31d64ad2f745ba508b6e0c8')

prepare() {
    sed -i "s/@PROJECT_NAME@/$_pkgname/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_DESCRIPTION@/$pkgdesc/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_VERSION@/$_gittag/g" "$_pkgname-$pkgver.desktop"

    patchelf \
    --replace-needed libminiupnpc.so.{18,21} \
    --replace-needed libicuuc.so.7{5,6} \
    "usr/bin/sunshine"
    # --replace-needed libboost_locale.so.1.8{3,6}.0 \
    # --replace-needed libboost_log.so.1.8{3,6}.0 \
    # --replace-needed libboost_filesystem.so.1.8{3,6}.0 \
    # --replace-needed libboost_program_options.so.1.8{3,6}.0 \
    # --replace-needed libboost_thread.so.1.8{3,6}.0 \
}

package() {
    install -Dm755 "usr/bin/sunshine-v$pkgver" "$pkgdir/usr/bin/sunshine"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    cp -r "usr/lib" "usr/share" "$pkgdir/usr"
}
