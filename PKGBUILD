# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-beta-bin
_pkgname=thunderbird-beta
pkgver=52.0rc1
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta')
install=$pkgname.install
source=("$pkgname.desktop"
        'vendor.js')
source_i686=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/en-US/thunderbird-$pkgver.tar.bz2")
sha512sums=('abb7ef2be514fd721d33291d9010461796f3adb42b340d0452c98daa9f29c58d7c149439b336c88e0688122ac4d024810baa2f69857559322ac5f4c6e0f2d0fb'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_i686=('e1922d86e30b388e502bd992351104d27c7c150cc99032e41a4ab21905b6147e61a05f9e6aac9028c52c5302b53d683ba409b32d5f98d36a7cdf91f0d6537f2f')
sha512sums_x86_64=('bfa576f1c4ac081c234a10cee10f7708830796e38057c2dfaeae45ac14ab09279f15d554f7d2fe3d183b62167855e7a52e9f1e65f8ce18d29d032ca63f7b9ca0')
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
