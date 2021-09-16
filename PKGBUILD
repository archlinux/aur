# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
pkgname=discord-electron
_pkgname=discord
_Pkgname=Discord
pkgver=0.0.15
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
depends=("$_electron" 'libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
makedepends=('asar')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
conflicts=(discord)
source=("https://dl.discordapp.net/apps/linux/$pkgver/$_pkgname-$pkgver.tar.gz"
				'discord.sh'
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('4f220ecd0e0c9fcd793ed065055479391506d9401b75ca541cde4136d0290f2720fccca87139091faf269fdb2c020adb5b7333710a31ca603ce8552f3dd4841b'
            'b5fe7bfd31ae1867f3392605bd52ac155c6c02c4a2a132419d9806c08e61715461818919c2e480ba8e7f14b51aefcd588dcaa247f15d24286e177e45f43e17f9'
            '6a2ebf7aadf06ba804c1c6f10677a014b2b9eb17a2bb34538426bf4c76686c4c11976bd682610965535f7a5d4a2f6b36dfa5aa875578defef1213ed866acb530'
            'f6d46b7a2dd6c8475625a988f36419788ab90149317c9a4e5e8ffea8613f27d0746c1557467332770c033349abd370bf721990ecadc383b4aee63cb8b74a280c')

prepare() {
  cd "$_Pkgname"

	# Change exec entry for desktop file
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" "$_pkgname.desktop"
	sed -i "s|Icon=.*|Icon=$pkgname|" "$_pkgname.desktop"
  echo 'Path=/usr/bin' >> "$_pkgname.desktop"

	# Change resource path in asar archive
	asar extract resources/app.asar resources/app.asar.dest
	sed -i "s|process\.resourcesPath|'/', 'opt', '$pkgname'|" resources/app.asar.dest/app_bootstrap/buildInfo.js
	asar pack resources/app.asar.dest resources/app.asar
	# Cleanup unpacked files
	rm -r resources/app.asar.dest

	cd "$srcdir"

	# Set electron version in startup script
	sed -i "s|@ELECTRON@|$_electron|" "$_pkgname.sh"
}

package() {
  # Install the app
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$_Pkgname/resources/." "$pkgdir/opt/$pkgname"

	# Install startup script
	install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Install icon and desktop file
	install -Dm644 "$_Pkgname/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$_Pkgname/$_pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Licenses
  install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
  install -Dm644 OSS-LICENSES.html "$pkgdir/usr/share/licenses/$pkgname/OSS-LICENSES.html"
}

