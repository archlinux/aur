# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-beta-bin
_pkgname=thunderbird-beta
pkgver=45.1.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk-update-icon-cache'
         'gtk2' 'hicolor-icon-theme' 'libnotify' 'libpng' 'libvpx' 'libxt' 'mime-types' 'nss' 'pixman'
         'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta')
install=$pkgname.install
source=("$pkgname.desktop"
        "$pkgname-safe.desktop"
        'vendor.js')
source_i686=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/en-US/thunderbird-$pkgver.tar.bz2")
sha512sums=('fc83c23f67cc5d399bc655d2486936db3ab500bafe399a905a17a0b0f63ad9befb782fc9c07d467a65a80a00e3ce984700ec3cf60e4cb3e1b29b20954c6fa775'
            '3cf4194575041bbe344d6cd17e473eb78caf7e2e1aa8b1309151f7e4677c33571014ba6d7aba267398c3ba69c825c64363272b82b15f7dbb8ae5e3e825f439b7'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_i686=('e30f11ffbf7ade1e46923a52bccbbfc3722229d15a323cd5f812f1287004f7d2f09a688c29205de3baa06c9314bed892747ed8a6a15eacd36fb1b8494b78965b')
sha512sums_x86_64=('53dc9169aeb45fde1bf96897dc49e113a24bf851cf19b9d428d4362856267a4974dd06c1ffaebc1b0a4db120175677dd3867dcff66be98c2aa4815f89910f5a7')
# RC
if [[ $_build = ? ]]; then
  source_i686=("https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-i686/en-US/thunderbird-$_major.tar.bz2")
  source_x86_64=("https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/thunderbird-$_major.tar.bz2")
fi

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r thunderbird/ "$pkgdir"/opt/$_pkgname
  install -m644 vendor.js "$pkgdir"/opt/$_pkgname/defaults/pref/

  # /usr/bin symlink
  ln -s /opt/$_pkgname/thunderbird "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done
}
