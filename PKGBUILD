# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=sunshine-beta-bin
_pkgname=sunshine-beta-bin
pkgver=2026.402.184413
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight"
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine-$pkgver-1-x86_64.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://github.com/LizardByte/Sunshine/blob/master/packaging/linux/dev.lizardbyte.app.Sunshine.desktop"
    "sunshine-capabilities.hook"
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
    '6d38c810d8d8a13d402e3f28943e508dcef8d47b4d70716c8363e20fb55952aa'
    'SKIP'
    'SKIP'
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

  # pacman hook to reapply file capabilities after install/upgrade
  install -Dm644 sunshine-capabilities.hook \
      "$pkgdir/usr/share/libalpm/hooks/sunshine-capabilities.hook"
}
