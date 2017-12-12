# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Gordin <9ordin@gmail.com>
# Maintainer: farwayer <farwayer@gmail.com>

_pkg=android-sdk
pkgname=$_pkg-25.2.5
pkgver=25.2.5
pkgrel=3
pkgdesc='Google Android SDK'
arch=('x86_64' 'i686')
url='https://developer.android.com/studio/releases/sdk-tools.html'
license=('custom')
provides=('android-sdk=25.2.5')
conflicts=('android-sdk')
depends_x86_64=('java-environment' 'lib32-alsa-lib' 'lib32-openal'
  'lib32-libstdc++5' 'lib32-libxv' 'lib32-mesa' 'lib32-ncurses' 'lib32-sdl'
  'lib32-zlib' 'lib32-fontconfig' 'lib32-libpulse' 'swt')
depends_i686=('java-environment' 'alsa-lib' 'openal' 'libstdc++5' 'libxv' 'sdl'
              'ncurses' 'swt' 'zlib')
install="$_pkg.install"
optdepends=('android-udev: udev rules for Android devices'
            'android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx')
source=("https://dl.google.com/android/repository/tools_r${pkgver}-linux.zip"
        'Android_Robot_100.png'
        "$_pkg.desktop"
        "$_pkg.sh"
        "$_pkg.csh"
        "$_pkg.conf"
        'license.html')
sha1sums=('72df3aa1988c0a9003ccdfd7a13a7b8bd0f47fc1'
          '94fda24e92c949e1d09ce3495fa9775f92867b68'
          '8f886de363ad91a7f93a0c6ded993e99bef3e1a7'
          '30a6ed281d54f8b7be08663a18c367f79c0d8d47'
          '1bd09bf137fd09171cb426daa5748f117cfb3c25'
          '145bdf3eb41a56574b289c1577a24bc47097ec83'
          'bfb91be7e0b602d765b7a1fcaf0ce1b7e1a93faa')

package() {
  install -Dm755 "$_pkg.sh" "$pkgdir/etc/profile.d/$_pkg.sh"
  install -Dm755 "$_pkg.csh" "$pkgdir/etc/profile.d/$_pkg.csh"
  install -Dm644 "$_pkg.conf" "$pkgdir/etc/ld.so.conf.d/$_pkg.conf"
  install -Dm644 Android_Robot_100.png "$pkgdir/usr/share/pixmaps/$_pkg.png"
  install -Dm644 "$_pkg.desktop" \
    "$pkgdir/usr/share/applications/$_pkg.desktop"
  install -Dm644 license.html \
    "$pkgdir/usr/share/licenses/$_pkg/license.html"
  install -d "$pkgdir/opt/$_pkg/platforms"
  install -d "$pkgdir/opt/$_pkg/add-ons"

  cp -a tools "$pkgdir/opt/$_pkg"

  if [[ $CARCH = i686 ]]; then
    rm -rf \
      "${pkgdir}"/opt/android-sdk/tools/lib/{monitor-,}x86_64 \
      "${pkgdir}"/opt/android-sdk/tools/lib/lib64* \
      "${pkgdir}"/opt/android-sdk/tools/emulator64-*
  fi

  # Fix broken permissions
  chmod -R o=g "$pkgdir/opt/$_pkg"
  find "$pkgdir/opt/$_pkg" -perm 744 -exec chmod 755 {} +

  # Remove libstd* from the tools directory
  for kw in libstd; do
    find "$pkgdir/opt/$_pkg/tools" -name "$kw*" -type f -delete
  done
}

# getver: developer.android.com/tools/sdk/tools-notes.html
# see https://dl.google.com/android/repository/repository-12.xml for new versions
# vim:set ts=2 sw=2 et:
