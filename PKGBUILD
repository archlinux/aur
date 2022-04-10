# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=audiorelay
pkgver=0.24.2
pkgrel=1
_jre_ver=18
pkgdesc="Stream your PC audio to your phone"
arch=('x86_64')
url="https://audiorelay.net"
license=('unknown')
depends=('alsa-lib' 'harfbuzz' "java-runtime=${_jre_ver}" 'libpulse' 'opus')
source=("https://dl.audiorelay.net/setups/linux/$pkgname-$pkgver.deb")
sha256sums=('683e53f068f0450edb834676c91585bf167e84e788b57ac26143265067a3c6ad')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  install -d "$pkgdir"/usr/{bin,/share/{pixmaps,applications}}
  ln -s "/opt/$pkgname/bin/AudioRelay" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$pkgname/lib/$pkgname-AudioRelay.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  ln -s "/opt/$pkgname/lib/AudioRelay.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Install bundled libs
  install -Dm644 "$pkgdir/opt/$pkgname/lib/runtime/lib/libnative-portaudio.so" -t "$pkgdir/usr/lib/"
  install -Dm644 "$pkgdir/opt/$pkgname/lib/runtime/lib/libnative-opus.so" -t "$pkgdir/usr/lib/"

  # Remove bundled JVM
  rm -rf "$pkgdir/opt/$pkgname/lib/runtime/"*

  # Symlink system JVM
  ln -s "/usr/lib/jvm/java-${_jre_ver}-openjdk/"* "$pkgdir/opt/$pkgname/lib/runtime/"
}
