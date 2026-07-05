# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=sunshine-beta-bin
_pkgname=sunshine-beta-bin
pkgver=2026.704.34109
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight"
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine-$pkgver-1-x86_64.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://github.com/LizardByte/Sunshine/blob/master/packaging/linux/dev.lizardbyte.app.Sunshine.desktop"
    "sunshine-capabilities.hook"
    "sunshine-beta-bin.install"
)
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    'avahi'
    'curl'
    'libayatana-appindicator'
    'libcap'
    'libdrm'
    'libevdev'
    'libpipewire'
    'miniupnpc'
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
    'vulkan-icd-loader'
    'which'
    'qt6-base'
)
optdepends=(
    'cuda: Nvidia GPU encoding support'
    'libva-mesa-driver: AMD GPU encoding support'
    'xorg-server-xvfb: Virtual X server for headless testing'
)
install=sunshine-beta-bin.install
conflicts=('sunshine' 'sunshine-git' 'sunshine-bin')
replaces=('sunshine-bin')
#makedepends=('patchelf')
provides=('sunshine-bin')
sha256sums=('b9d97189238043f05fe48aca6b4800127a81fc8279c8f6929ba67f2074c0b8ee'
            'SKIP'
            'SKIP'
            'SKIP')

# prepare() {
#     patchelf \
#     "usr/bin/sunshine"
#     --replace-needed libminiupnpc.so.{18,21} \
#     --replace-needed libicuuc.so.7{5,6} \
#     --replace-needed libboost_locale.so.1.8{3,6}.0 \
#     --replace-needed libboost_log.so.1.8{3,6}.0 \
#     --replace-needed libboost_filesystem.so.1.8{3,6}.0 \
#     --replace-needed libboost_program_options.so.1.8{3,6}.0 \
#     --replace-needed libboost_thread.so.1.8{3,6}.0 \
# }

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
