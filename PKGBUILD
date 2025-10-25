# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=sunshine-beta-bin
_pkgname=sunshine-beta-bin
pkgver=2025.1025.34515
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight"
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://raw.githubusercontent.com/LizardByte/Sunshine/$_gittag/packaging/linux/dev.lizardbyte.app.Sunshine.desktop"
)
arch=('x86_64')
license=('GPL3')
depends=(
    'avahi'
    'curl'
    'libayatana-appindicator'
    'libcap'
    'libdrm'
    'libevdev'
    'libmfx'
    'libnotify'
    'libpulse'
    'libva'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'miniupnpc'
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
conflicts=('sunshine' 'sunshine-git' 'sunshine-bin')
replaces=('sunshine-bin')
makedepends=('patchelf')
provides=('sunshine-bin')
sha256sums=(
    '0230cfba9b45cbe2a417910890a28815c0a39dd5c9d719162423c0ad687cdcd9'
    '733594073f27c818f89ae1b065943384806811f02048376b76f64ce9c8768229'
)

prepare() {
    sed -i "s/@PROJECT_NAME@/$_pkgname/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_DESCRIPTION@/$pkgdesc/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_VERSION@/$_gittag/g" "$_pkgname-$pkgver.desktop"

    patchelf \
    --replace-needed libminiupnpc.so.1{8,9} \
    --replace-needed libicuuc.so.7{5,6} \
    "usr/bin/sunshine"
    # --replace-needed libboost_locale.so.1.8{3,6}.0 \
    # --replace-needed libboost_log.so.1.8{3,6}.0 \
    # --replace-needed libboost_filesystem.so.1.8{3,6}.0 \
    # --replace-needed libboost_program_options.so.1.8{3,6}.0 \
    # --replace-needed libboost_thread.so.1.8{3,6}.0 \
}

package() {
  if [[ -f "usr/bin/sunshine-v$pkgver" ]]; then
    install -Dm755 "usr/bin/sunshine-v$pkgver" "$pkgdir/usr/bin/sunshine"
  elif [[ -f "usr/bin/sunshine-$pkgver" ]]; then
    install -Dm755 "usr/bin/sunshine-$pkgver" "$pkgdir/usr/bin/sunshine"
  else
    install -Dm755 "usr/bin/sunshine" "$pkgdir/usr/bin/sunshine"
  fi

  cp -r "usr/lib" "$pkgdir/usr"
  cp -r "usr/share" "$pkgdir/usr" 2>/dev/null || true
}
