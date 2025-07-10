# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=2025.628.4510
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://github.com/LizardByte/Sunshine/raw/refs/tags/$_gittag/packaging/linux/dev.lizardbyte.app.Sunshine.desktop"
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
# makedepends=('patchelf')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('9ab9bf8d357142fd3eb6f3c8a85a52bb80c25ead7d3c0f54d21d0c2215827def50bf52b8a9925a774718c7028d1cbef56a78a183b165fa0bca56b6ff08eb8b2f'
        '83ead21583339cb9d5a9ce19c96697079b8c7c3be3c3a9f1d7090e9b1b979b37478ac28cfe3c9a6c9d171560e987ea627351bd8dddb8c6fae59c7ae794462fd0')

prepare() {
    sed -i "s/@PROJECT_NAME@/$_pkgname/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_DESCRIPTION@/$pkgdesc/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_VERSION@/$_gittag/g" "$_pkgname-$pkgver.desktop"

    # patchelf \
    # "usr/bin/sunshine"
    # --replace-needed libminiupnpc.so.{18,21} \
    # --replace-needed libicuuc.so.7{5,6} \
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
