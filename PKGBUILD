# Maintainer: onurmercury <onurmercury at proton dot me>
# Contributor: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario


# More details about the builds can be found at:
# https://github.com/RobRich999/Chromium_Clang
#
# Check for new releases (Linux & Windows, AVX & AVX2) at:
# https://github.com/RobRich999/Chromium_Clang/releases
#
# or use this (for Linux AVX):
# $ curl -sf https://api.github.com/repos/RobRich999/Chromium_Clang/releases | grep -Em1 '.*\"name\"\:\ \"v.*-linux64-deb-avx\",' 2>/dev/null | awk '{print substr($0, 14, length($0) - 15)}'
#
# or use this (for Linux AVX2):
# $ curl -sf https://api.github.com/repos/RobRich999/Chromium_Clang/releases | grep -Em1 '.*\"name\"\:\ \"v.*-linux64-deb-avx2\",' 2>/dev/null | awk '{print substr($0, 14, length($0) - 15)}'
#
# Based on aur/google-chrome-dev


_pkgname=chromium-unstable
_debname=chromium-browser-unstable
_pkgver=v118.0.5968.0-r1187677-linux64-deb-avx

pkgname=${_pkgname}-bin
pkgver=118.0.5968.0
pkgrel=1
pkgdesc="The Chromium web browser for Linux built with the open source Clang compiler, LLD linker and Widevine (Unstable Channel)"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD' 'custom:Widevine')
depends=('alsa-lib'
         'gtk3'
         'libcups'
         'libxss'
         'libxtst'
         'nss'
         'ttf-liberation'
         'xdg-utils')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
provides=('chromium-browser-unstable')
conflicts=('chromium-unstable' 'chromium-unstable-avx2' 'chromium-unstable-avx2-bin')
options=('!emptydirs' '!strip')
install=$_debname.install
source=("https://github.com/RobRich999/Chromium_Clang/releases/download/${_pkgver}/${_debname}_${pkgver}-1_amd64.deb"
        "$_debname.sh")
sha1sums=('507608f23b022b132d48a796a767dd942d6d2151'
          '15076d85845422ff05386fd918cb64f2cd3112ac')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # Launcher
  install -m755 $_debname.sh "$pkgdir"/usr/bin/$_debname

  # Icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "$pkgdir"/opt/chromium.org/$_pkgname/product_logo_${i}.png \
    "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_debname.png
  done

  # Fix the Chromium desktop entry
  sed -i \
    -e "/Exec=/i\StartupWMClass=${_pkgname^}" \
    "$pkgdir"/usr/share/applications/$_debname.desktop

  # Remove the Debian Cron job, duplicate product logos and menu directory
  rm -r \
    "$pkgdir"/etc/cron.daily/ \
    "$pkgdir"/opt/chromium.org/$_pkgname/cron/ \
    "$pkgdir"/opt/chromium.org/$_pkgname/product_logo_*.{png,xpm} \
    "$pkgdir"/usr/share/menu/
}
