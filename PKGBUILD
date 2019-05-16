# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on thunderbird-bin

pkgname=thunderbird-52-bin
_pkgname=thunderbird
pkgver=52.9.1
pkgrel=2
pkgdesc="Standalone Mail/News reader - Version 52.9.1 (en-GB)"
arch=('x86_64' 'i686')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=(
  'hunspell: Spell checking'
  'hyphen: Hyphenation'
  'libcanberra: Sound support'
)
provides=("thunderbird=$pkgver")
conflicts=('thunderbird' 'thunderbird-bin')
source=('thunderbird-52-bin.desktop')
source_x86_64=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/en-GB/thunderbird-$pkgver.tar.bz2")
source_i686=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-GB/thunderbird-$pkgver.tar.bz2")

sha512sums=('83a77090a91a0b6ccaa5ddb56ac10389a4bfa58a09465fa38b94a2cc9b641c2d70e73783968f197f5b692f80df51362724666bc4d956b3d6a9783d2abcc3b58a')
sha512sums_x86_64=('a713653bc7da8347d2897ff522c8cb13983fd913ec987a81b9bcb1242dac14c0cd875e7bb5dfda14938953af0a526d24a54d40e1b88e31107498baf00aaeb6c9')
sha512sums_i686=('53e66c5e9c98a6af311732341073b553c577dcfe35178996c7a27ee0cc0dddfc7774a065fdebbfa0a4cd4f6f3f422e9fe67fac07a586342e9dde33b59d6bd17a<Paste>')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  # Install
  msg2 "Moving stuff in place..."
  cp -r thunderbird/ "$pkgdir"/opt/$_pkgname

  # Launchers
  ln -s /opt/$_pkgname/thunderbird "$pkgdir"/usr/bin/$_pkgname
  ln -sf thunderbird "$pkgdir"/opt/$_pkgname/thunderbird-bin

  # Desktop
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16 22 24 32 48 256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
          "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  rm -fr "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$_pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so
}

