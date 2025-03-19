# Maintainer: Luis Vervaet <luisvervaet@gmail.com>
# Maintainer: Peter Jung <admin@ptr1337.dev>
# Contributor: NextWorks <nextworks@protonmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: Det <nimetonmaili g-mail>, Achilleas Pipinellis, speed145a, Schnouki, aus

pkgname=zen-browser-bin
_pkgname=zen-browser
_desktopname=zen
pkgver=1.10b
pkgrel=2
pkgdesc="Performance oriented Firefox-based web browser"
arch=('x86_64' 'aarch64')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulse-native-provider: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("zen-browser=$pkgver")
conflicts=('zen-browser')

source_x86_64=("zen-browser-$pkgver-x86_64.tar.bz2::https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.linux-x86_64.tar.xz")
source_aarch64=("zen-browser-$pkgver-aarch64.tar.bz2::https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.linux-aarch64.tar.xz")

source=("$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('642bcde5b15fddb712d10ed53299781108a265432237ab27a96c5c5c489718db'
            'a6371aa853b095d1c223f955e97a390b905abe5bcba38bbddd17408dd46fec94'
            'f93eb77db526147a8a20744905923a6eda79e2fbcc9f282e2f9228a7a995c798')
sha256sums_x86_64=('8bf868b1bc00569dff61a9d617d21d44f69ec954314d52906f8830b6130ee0b5')
sha256sums_aarch64=('d39709413fcb5cdbb03c48e78e72bba291147dd484618446a350f6aeb9317152')


package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r zen/ "$pkgdir"/opt/$pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so

  # Disable update checks (managed by pacman)
  mkdir "$pkgdir"/opt/$pkgname/distribution
  install -m644 "$srcdir"/policies.json "$pkgdir"/opt/$pkgname/distribution/
}
