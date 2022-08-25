# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=terrafire
pkgver=2.0.5
pkgrel=1
pkgdesc="Award-winning arcade game featuring rendered 3D graphics, realistic gravitational physics and 360 degree parallax scrolling from ORT Software."
arch=('i686' 'x86_64')
url="https://www.ortsoftware.com/tf.html"
license=('freeware')
provides=('terrafire')
source=('terrafire.desktop')
depends=('dosbox')
makedepends=('innoextract' 'imagemagick')
sha256sums=('f7489700fe3a3795a599b1bedeef3eb279b9949ae7725ec8d924312419113b71')

prepare() {
	#workaround for curl http 406 error
  cd "${srcdir}"
  curl --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36" 'https://www.ortsoftware.com/exe/tf_full.exe' -o tf_full.exe
}

build() {
	cd "${srcdir}"
	innoextract "tf_full.exe" || return 1
	convert "app/tf.ico" "terrafire.png" || return 1
}

package() {
	install -Dm644 ${srcdir}/terrafire.desktop ${pkgdir}/usr/share/applications/terrafire.desktop
	install -Dm644 ${srcdir}/terrafire.png ${pkgdir}/usr/share/pixmaps/terrafire.png

	cd "${srcdir}/app"
	mkdir -p "${pkgdir}/opt/terrafire"
	mkdir -p "${pkgdir}/usr/bin/"

	cp -ar * "${pkgdir}/opt/terrafire"

	cat << EOF > "${pkgdir}/usr/bin/terrafire"
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
chmod +x "${pkgdir}/usr/bin/terrafire"
}
