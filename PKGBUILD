# Maintainer: detian <dehe_tian at outlook dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=audiorelay
pkgver=0.27.5
pkgrel=4
_jre_ver=17
pkgdesc="Stream your PC audio to your phone"
arch=('x86_64')
url="https://$pkgname.net"
license=('unknown')
depends=('alsa-lib' 'flac' 'harfbuzz' 'libogg' 'libpulse' "java-runtime>=${_jre_ver}" 'archlinux-java-run'
         'libvorbis' 'libxau' 'libxcb' 'systemd-libs' 'xdg-utils') # 'opus' 'portaudio' 'rtaudio' 'libsamplerate'
source=("https://dl.audiorelay.net/setups/linux/$pkgname-$pkgver.tar.gz" "$pkgname.sh" "$pkgname.desktop")
install='audiorelay.install'
_install_path="/usr/share/java/audiorelay"
sha256sums=('c4854139a4bd21e7bf7881a7b6e21ebc4cfe823286783d4fb9ad4bf4edf8e8c7'
            'd8c6b6b7bc4c5d84fcf2e6f7243401199e5ef6a18b1f5b22570560dbb3f59734'
            '0f792da4cf7ffb28a9067af349cf2d6dd631f71a1f69784e8f61d09fd83ed97f')

package() {
  # install assets
  install -d "$pkgdir"/usr/{bin,/share/{applications,pixmaps}}
  install -Dm755 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/lib/AudioRelay.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # install startup script
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  # set APPDIR var for runtime
  sed -i 's|APPDIR=|APPDIR=\"'$_install_path'\"|' "$pkgdir/usr/bin/$pkgname"

  # install without bundled JVM
  install -d "$pkgdir/$_install_path/misc"
  install -Dm644 "$srcdir/lib/app/$pkgname.jar" "$pkgdir/$_install_path/"
  install -Dm644 "$srcdir/lib/app/AudioRelay.cfg" "$pkgdir/$_install_path/misc"

  # but install bundled native library
  find "$srcdir/lib/runtime/lib/" \
    -name 'libnative-*' \
    -type f \
    -exec install -Dm644 {} "$pkgdir/$_install_path/misc" \;
}
