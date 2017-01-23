# Maintainer: Det <nimetonmaili g-mail>

pkgname=google-earth-pro-wine
pkgver=7.1.8.3036
pkgrel=1
pkgdesc="A 3D interface to view satellite images of Earth and other objects - Pro (Wine)"
arch=('i686' 'x86_64')
url="https://www.google.com/earth/index.html"
license=('custom:earth')
# depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'wine')
makedepends=('xdotool')
options=('!strip')
install=$pkgname.install
source=("GoogleEarthProWin-$pkgver.exe::https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe"
        'google-earth-pro-wine.sh'
        'google-earth-pro-wine.desktop'
         google-earth-pro-wine_{16,24,32,48,128,256}.png
        'Google-Terms-of-Service.html::https://www.google.com/intl/ALL/policies/terms/index.html'
        'Google-Earth-Additional-Terms-of-Service.html::https://www.google.com/help/terms_maps.html'
        'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html::https://www.google.com/help/legalnotices_maps.html'
        'Google-Privacy-Policy.html::https://www.google.com/intl/ALL/policies/privacy/index.html')
md5sums=('41b63fa5269e432df536c7540196bad9'
         'a5492ca9317d9f9f3a28f6e1c663676a'
         '9be557dbe2950f8adae14ed0b036a218'
         'ec5de2f7743a06a5b4acbbb853e03f9b'
         '392333988b71073344fd8b3094230ff1'
         '42d0b9edff7f5f5e16b09d61874729ff'
         '1d787a950e91d08a1e0de0f09289468d'
         '3da321dbcb9a54a460ec8273bdd7e022'
         '01b4492e92a9c9e9abf187037a80d67a'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

build() {
  msg2 "Auto-installing (no interaction required)..."
  # Launch installer
  wine GoogleEarthProWin-$pkgver.exe &

  # Loop until found
  until [[ $_wineid ]]; do
    sleep 0.5

    # Installer window id
    _wineid=$(xdotool search --desktop 0 --classname GoogleEarthProWin-$pkgver.exe) || true
  done

  # Send "Enter" to installer to install in default location
  xdotool windowactivate --sync $_wineid key Return

  # Wait for installation to finish
  until [[ ! $(pgrep -f GoogleEarthProWin-$pkgver.exe) ]]; do
    sleep 0.5
  done
}

package() {
  msg2 "Installing system-wide..."
  # Program Files ((x86)) location
  Program_Files=$(winepath -u "$(wine cmd.exe /c 'echo %ProgramFiles%' | tr -d '\r')")

  # Copy recursively
  install -d "$pkgdir"/opt/google/earth/
  cp -r "$Program_Files/Google/Google Earth Pro/client/" "$pkgdir"/opt/google/earth/pro-wine/

  msg2 "Cleaning up..."
  # Installation GUID
  _GUID=$(wine uninstaller --list | grep "Google Earth Pro" | cut -d "|" -f1)

  # Uninstall
  wine uninstaller --remove $_GUID

  msg2 "Installing launcher..."
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  msg2 "Installing .desktop..."
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  msg2 "Installing icons..."
  for i in 16x16 24x24 32x32 48x48 128x128 256x256; do
    install -Dm644 ${pkgname}_${i/x*}.png "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done
}
