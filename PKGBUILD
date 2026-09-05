# Maintainer: Hashim Karim <hashimkarim168@gmail.com>
pkgname=android-agent-lab-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Shared Android devices, scrcpy video, and visible agent cursors'
arch=('x86_64' 'aarch64')
url='https://github.com/Hashim-K/android-agent-lab'
license=('MIT')
depends=('python' 'android-tools' 'gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret' 'libglvnd' 'mesa' 'alsa-lib')
optdepends=('docker: bundled Android 16 emulator on x86_64'
            'docker-compose: bundled emulator orchestration')
provides=('android-agent-lab')
conflicts=('android-agent-lab')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/Android-Agent-Lab-$pkgver-x64.pkg.tar.zst")
source_aarch64=("$url/releases/download/v$pkgver/Android-Agent-Lab-$pkgver-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a9551dc2335d18071562f70c4a476b99019534f6bfdc6298c86376a32a10666e')
sha256sums_aarch64=('485c2b4c487526a272b05ff2b8dc52ed97923386c5a41b5c4bd7a3047430d22e')
noextract=("Android-Agent-Lab-$pkgver-x64.pkg.tar.zst"
           "Android-Agent-Lab-$pkgver-aarch64.pkg.tar.zst")

package() {
  local release_arch=x64
  [[ $CARCH == aarch64 ]] && release_arch=aarch64
  bsdtar -xf "Android-Agent-Lab-$pkgver-$release_arch.pkg.tar.zst" -C "$pkgdir" opt usr
  install -d "$pkgdir/usr/lib"
  mv "$pkgdir/opt/Android Agent Lab" "$pkgdir/usr/lib/android-agent-lab"
  rmdir "$pkgdir/opt"
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/android-agent-lab" <<'LAUNCHER'
#!/bin/sh
unset ELECTRON_RUN_AS_NODE
exec /usr/lib/android-agent-lab/android-agent-lab "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/android-agent-lab"
  chmod 4755 "$pkgdir/usr/lib/android-agent-lab/chrome-sandbox"
  sed -i 's|^Exec=.*|Exec=android-agent-lab %U|' \
    "$pkgdir/usr/share/applications/android-agent-lab.desktop"
  install -Dm644 "$pkgdir/usr/lib/android-agent-lab/resources/runtime/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
