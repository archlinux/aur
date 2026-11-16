# Maintainer: Your Name <you@example.com>
pkgname=shortwave-electron
_pkgname=shortwave
pkgver=2026.11.1
pkgrel=2
_electron=electron43
pkgdesc="AI-native email for teams (Shortwave desktop app, using system Electron)"
arch=('any')
url="https://www.shortwave.com"
license=('LicenseRef-Shortwave')
depends=("$_electron" 'hicolor-icon-theme' 'xdg-utils' 'bash')
makedepends=('7zip' 'libarchive')
provides=('shortwave-desktop')
conflicts=('shortwave-desktop')
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-setup.exe::https://storage.googleapis.com/shortwave-downloads/desktop_app/win32/x64/Shortwave%20Setup.exe"
        'shortwave-linux.patch'
        'shortwave.sh'
        'shortwave.desktop'
        'shortwave.png'
        'LICENSE')
noextract=("$_pkgname-$pkgver-setup.exe")
sha256sums=('4e1a8cce59b7149f1c375b6adb65835e74ec3ef25a48ad23b11e4ced52484488'
            '74254912650b29f3d01ce0fc46263fc0112701e433c91027f8b08eb28ceac610'
            'e56f0c483442114097a26f2516f02e2d37542a953ead0225f7847de1cc3f47de'
            '17255ce51a7453d2975e940de60d8f6ebecff24abfc38f066c0e8397ae730341'
            '6d0db3133d685114d6e8284d0e6e4a8377891d699ab5fa93e77863759a186436'
            '0f2743c264ffc03a8880bfe803deab4eb29082f7661aeebc2c91a01085dbda52')

prepare() {
  rm -rf app "$_pkgname-$pkgver-full.nupkg"
  # Squirrel installer: the nupkg is embedded as a PE resource
  7z e -y "$_pkgname-$pkgver-setup.exe" "$_pkgname-$pkgver-full.nupkg" >/dev/null
  bsdtar -xf "$_pkgname-$pkgver-full.nupkg" --strip-components 3 'lib/net45/resources/app/*'
  # Linux support: platform detection, no Squirrel updater, shortwave:// deep links,
  # desktopName for xdg-settings / Wayland app_id
  patch -d app -p1 < shortwave-linux.patch
}

package() {
  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -r --no-preserve=ownership app "$pkgdir/usr/lib/$_pkgname/"
  find "$pkgdir/usr/lib/$_pkgname" -name '*.map' -delete

  install -Dm755 shortwave.sh "$pkgdir/usr/bin/$_pkgname"
  sed -i "s/electron43/$_electron/" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 shortwave.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 shortwave.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
