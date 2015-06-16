pkgname=terrafire
pkgver=2.0
pkgrel=7
pkgdesc="Award-winning arcade game featuring rendered 3D graphics, realistic gravitational physics and 360 degree parallax scrolling from ORT Software."
arch=('i686' 'x86_64')
url="http://www.ortsoftware.com/tf.html"
license=('freeware')
provides=('terrafire')
source=('terrafire.desktop' 'http://www.ortsoftware.com/tf_full.exe')
depends=('dosbox')
makedepends=('innoextract' 'imagemagick')
md5sums=('c144a31089faabfe183fff15a0c3b373' 'cf078359a989aca11f85ddd3aca9276b')


build() {
	cd "$srcdir"
	msg "Extracting installer contents..."

	# Extract all files from the setup program
	innoextract "tf_full.exe" || return 1

	# Create a png icon out of the .ico
	convert "app/tf.ico" "terrafire.png" || return 1

}

package() {
	# Install the shortcut and icon into /usr/share
	install -Dm644 ${srcdir}/terrafire.desktop ${pkgdir}/usr/share/applications/terrafire.desktop
	install -Dm644 ${srcdir}/terrafire.png ${pkgdir}/usr/share/pixmaps/terrafire.png

	cd "$srcdir"
	cd "app"
	mkdir -p "$pkgdir/opt/terrafire"
	mkdir -p "$pkgdir/usr/bin/"

	# Copy all extracted files to the destination folder
	cp -ar * "$pkgdir/opt/terrafire"


	# Create a command-line script for launching the game
	cat << EOF > "$pkgdir/usr/bin/terrafire"
#!/bin/bash
# Let us create a hidden folder in the home
mkdir -p "\$HOME/.terrafire"
if [ ! -f "\$HOME/.terrafire/settings.cfg" ]; then
	cp "/opt/terrafire/settings.cfg" "\$HOME/.terrafire/"
fi
FILES=\$(ls /opt/terrafire)

# Checking/preparing environment
for f in \$FILES; do
	if [ ! -e "\$HOME/.terrafire/\$f" ]; then
		ln -s "/opt/terrafire/\$f" "\$HOME/.terrafire/"
	fi
done

dosbox -exit "\$HOME/.terrafire/tf.exe"
EOF
	chmod +x "$pkgdir/usr/bin/terrafire"

}
