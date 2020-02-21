# Maintainer: Mirko Scholz

pkgname=ccdc-mercury
pkgver=4.3.1
pkgrel=1
pkgdesc="Crystal Structure Visualisation, Exploration and Analysis Made Easy"
arch=(x86_64)
url="https://www.ccdc.cam.ac.uk/solutions/csd-system/components/mercury/"
license=(unknown)
depends=(glib2 opengl-driver libx11)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(fakechroot)

_installer="mercurystandalone-${pkgver}-linux-x64-installer.run"

source=("https://downloads.ccdc.cam.ac.uk/Mercury/$pkgver/$_installer")

sha256sums=('142b412754c6756a0c6ad662b7d24ccd1690eb3544dce158265cfa1f424f46a3')
options=(!strip)


prepare() 
{
	cd $srcdir/
	chmod +x "$_installer"
}

package()
{
	local _prefix="/opt/Mercury-$pkgver"

	# follows https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=microchip-mplabx-bin
	mkdir -p "$pkgdir"/{etc,tmp,opt}
	mkdir -p "$pkgdir"/usr/bin
	ln -s /usr/bin "$pkgdir"
	echo "root:x:0:0:root:/root:/bin/bash" > "${pkgdir}/etc/passwd"
	echo "root:x:0:root" > "${pkgdir}/etc/group"
	cp --reflink=auto --dereference "$srcdir/$_installer" "$pkgdir/tmp"
	cat << EOF > "$pkgdir/tmp/install.sh"
#!/bin/sh
PATH=/bin
echo Running Mercury installer...	
"/tmp/$_installer" \
	--mode unattended \
	--debuglevel 4 \
	--materials false \
	--prefix "$_prefix"
EOF
	chmod 0755 "$pkgdir/tmp/install.sh"

	fakechroot chroot "$pkgdir" /tmp/install.sh

	rm -f $pkgdir/$_prefix/autoupdate
	rm -f $pkgdir/$_prefix/uninstall
	rm -f $pkgdir/$_prefix/uninstall.dat
	
	sed -i 's/^check_for_updates *= *1/check_for_updates = 0/' "$pkgdir/$_prefix/update_software.ini"
	rm -rf "$pkgdir"/{etc,tmp,bin}
	
	cat << EOF > "$pkgdir/usr/bin/Mercury"
#!/bin/sh
exec "$_prefix/bin/mercury" "\$@"
EOF
	cat << EOF > "$pkgdir/usr/bin/encifer"
#!/bin/sh
exec "$_prefix/bin/encifer" "\$@"
EOF
	chmod 0755 "$pkgdir/usr/bin/Mercury" "$pkgdir/usr/bin/encifer" 

}
