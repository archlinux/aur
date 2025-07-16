# Maintainer: aequabit <aequabit@gmail.com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-emulator-canary
pkgver=36.1.4
pkgrel=1
pkgdesc='Google Android Emulator (Canary channel)'
arch=('x86_64')
url='https://developer.android.com/studio/emulator_archive'
provides=('android-emulator')
conflicts=('android-emulator')
license=('custom')
depends=('alsa-lib' 'dbus' 'expat' 'gcc-libs' 'glibc' 'libpulse'
         'libutil-linux' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor'
         'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrender' 'libxtst'
         'nspr' 'nss' 'zlib')
makedepends=('xmlstarlet')
install="${pkgname}.install"
source=('https://dl.google.com/android/repository/emulator-linux_x64-13605811.zip'
        'https://dl.google.com/android/repository/repository2-1.xml'
        "${pkgname}.sh"
        "${pkgname}.csh"
        'package.xml')
sha256sums=('666dc8011a78c9371725ec3e385e18ffdd3dea664c59fda576ef86ebcf2e3b3c'
            'SKIP'
            '2d7cd6457bc848c369ee215783146da7dce71d7c7f7043f944700f0a7b0d587d'
            '630ea153f52154ac51b3e76357c8a123bea9ed0c910c64b8585775a345834803'
            'ef07b897f75504b31ad4e0d094a682e209a75f3ef1345c7ac99b52030554621d')

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"

  install -d "${pkgdir}/opt/android-sdk/"
  cp -a emulator "${pkgdir}/opt/android-sdk/"
  install -Dm755 'package.xml' "${pkgdir}/opt/android-sdk/emulator/package.xml"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  xml sel -t -v '/sdk:sdk-repository/license[@id="android-sdk-preview-license"]' repository2-1.xml > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix broken permissions
  chmod -R o=g "${pkgdir}/opt/android-sdk/emulator"
  find "${pkgdir}/opt/android-sdk/emulator" -perm 744 -exec chmod 755 {} +
}

# see https://dl.google.com/android/repository/repository2-1.xml for new versions
# vim:set ts=2 sw=2 et:
