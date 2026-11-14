# Maintainer: Snowy-Fluffy <snowy.lnnk@gmail.com>

pkgname=exdesktop-bin
_pkgname=exdesktop
pkgver=7.4.3.1
pkgrel=1
pkgdesc='Unofficial Telegram Desktop fork with exteraGram features, channel feed and Python plugins (prebuilt)'
arch=('x86_64')
url='https://github.com/metawka/exDesktop'
license=('GPL-3.0-or-later WITH OpenSSL-exception')
depends=(
	'cairo'
	'fontconfig'
	'freetype2'
	'gcc-libs'
	'glib2'
	'glibc'
	'hicolor-icon-theme'
	'libx11'
	'libxcb'
	'pango'
)
optdepends=('xdg-desktop-portal: file dialogs and screen sharing')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("exDesktop-linux-x64-$pkgver.tar.gz::$url/releases/download/v$pkgver/exDesktop-linux-x64.$pkgver.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/metawka/exDesktop/v$pkgver/LICENSE"
        "icon16-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon16.png"
        "icon32-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon32.png"
        "icon48-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon48.png"
        "icon64-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon64.png"
        "icon128-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon128.png"
        "icon256-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon256.png"
        "icon512-$pkgver.png::$url/raw/v$pkgver/Telegram/Resources/art/icon512.png"
        "$_pkgname.desktop"
        "$_pkgname.sh")
noextract=("exDesktop-linux-x64-$pkgver.tar.gz")
sha256sums=('06926a5594239d7721031d565d6acdecafbe345b745cbcfad2f82e2098d6c03a'
            'a728b65d02eeaf6b50c075a33b76107c652c3e5a12ff67f53682c83d47a23e1e'
            'f6ef428025d0edccb48197dd83b8b8aa0e27be368007bfc564b9e7684e888ce4'
            'd20934cdcf9cc29f30b8755f2bdd12185fa3b09fcce50327c7f4530f2ab76dff'
            '11793d28bd83d2b6db9500344ddb214dd65f95aced3390885fd0cfb73c8edbc4'
            'dc3f0816be0b74c3efebc39f0fac5239e29b3f657a6fcba84e742b951e80d734'
            'aeee85d1c0bfc65ef53e32196cad863c4e9a1adbe7812e3573f414c96803b3f3'
            '80929ac218d762ebafdbda5c39ab986165b06ab03c8c68712183abf6b5051659'
            '73e8714701523e34c47c351b2e3c7fdeedfef2325d8c312302cc847e29ff2ec6'
            'fade5899ee7b0afc4a08ad4d65d21541fbe5c55cc312ba409900039a375b6799'
            'e5739f2edfd73df1576417c6e2ad8cf0e4413c9425ae9e18a8f454fb4d6954a3')

package() {
	# The bundle (binary, libpython and the embedded Python runtime) has to stay
	# together: the application looks for ./python next to its own executable.
	install -d "$pkgdir/opt/$_pkgname"
	bsdtar -xf "$srcdir/exDesktop-linux-x64-$pkgver.tar.gz" --no-same-owner \
		--strip-components=1 -C "$pkgdir/opt/$_pkgname"
	# Replace the bundled launcher with the one below, which survives symlinks.
	rm "$pkgdir/opt/$_pkgname/exDesktop"

	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	local size
	for size in 16 32 48 64 128 256 512; do
		install -Dm644 "$srcdir/icon$size-$pkgver.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
	done

	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
