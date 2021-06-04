# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Daniel Peukert <dan.peukert@gmail.com> (itch.io download method from after-school by dcelasun)

pkgname='ravenfield'
pkgver=b5_1
pkgrel=4
pkgdesc='A singleplayer battlefield style game.'
arch=('x86_64' 'i686')
url='https://steelraven7.itch.io/ravenfield'
license=('unknown')
depends=('libgl')
makedepends=('unzip')
options=(!emptydirs)
source=(
	"$pkgname"
	"$pkgname.desktop"
	"$pkgname.png"
)
sha256sums=(
	'21800c3e8accb4aa6bf0d154bd9665b161a66f386a3fc50c83dfcb4e62f3b344'
	'9aa7c7df11d2cb58c4804e88b10d146f557a6586ecc23aeeef95233896cdb2a0'
	'2e8ee67e8146270d89ee1ab69265e2a2a2d12b7ea9ebbe26fc8284afaa831935'
)
[[ "$CARCH" == 'x86_64' ]] && _arch='x86_64' || _arch='x86'

package() {
	cd "$srcdir"
	curl -o 'ravenfield.zip' "$(curl -s -XPOST 'https://steelraven7.itch.io/ravenfield/file/336753?after_download_lightbox=true' | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')"
	echo '413dde97082929c53a9cdbc069ddf5915f7d36803009cf5ec41db626a5caa405 ravenfield.zip' > 'ravenfield.zip.sha256'
	if ! sha256sum -c 'ravenfield.zip.sha256'; then
		exit 1
	fi
	
	unzip -o 'ravenfield.zip'

	mkdir -p "$pkgdir/usr/share/"{"$pkgname",'applications','icons'} "$pkgdir/usr/bin/"
	cp -R "$srcdir/Ravenfield Linux/Ravenfield_Data/" "$pkgdir/usr/share/$pkgname/"

	install -Dm755 "$srcdir/Ravenfield Linux/Ravenfield.$_arch" "$pkgdir/usr/share/$pkgname/Ravenfield"
	install -Dm755 "$srcdir/ravenfield" -t "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname.png" -t "$pkgdir/usr/share/pixmaps"
}
