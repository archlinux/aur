# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Maxthon Inc. <maxthon AT maxthon a-dot net>
# Contributor: dongfengweixiao <dongfengweixiao at gmail a-dot com>
# Contributor: erayaydin <eray at labkod a-dot com>

pkgname=maxthon-browser
pkgver=1.0.5.3
pkgrel=1
pkgdesc="A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=('i686' 'x86_64')
url="http://www.maxthon.cn/"
license=('Custom')
depends=('gtkhotkey' 'libgcrypt15' 'libxrandr' 'libxrender' 'libxss' 'libxext' 'glibc' 'glib2' 'atk' 'pango' 'gdk-pixbuf2' 'cairo' 'freetype2' 'fontconfig' 'nss' 'nspr' 'gconf' 'dbus' 
'libxcomposite' 'alsa-lib' 'libxdamage' 'libxfixes' 'libcups' 'libgcrypt' 'expat' 'gcc-libs' 'pcre' 'libffi' 'libxinerama' 'libxi' 'libxcursor' 'harfbuzz' 'libpng' 'pixman' 'zlib' 
'bzip2' 'dbus-glib' 'krb5' 'e2fsprogs' 'gnutls' 'avahi' 'libgpg-error' 'libxau' 'libxdmcp' 'graphite' 'libx11' 'wayland' 'mesa' 'systemd' 'libdrm' 'libxcb' 'libxxf86vm' 'keyutils' 
'p11-kit' 'libtasn1' 'nettle' 'gmp')
optdepends=('ttf-tahoma: default Maxthon browser font')
options=('!emptydirs' '!strip')
install=$pkgname.install
if [ "$CARCH" = "x86_64" ]; then
  source=("http://dl.maxthon.com/linux/tars/$pkgname-stable-$pkgver-x86_64.tgz")
  sha512sums=('86f33307bd6360ee4b70942320f10ab75053abb0b25d4d548c52aa92dbb19193854ea9615d1a29312151ee6a909ac4ab5d8c702e5e64793b50b498d1850d6f32')
else
  source=("http://dl.maxthon.com/linux/tars/$pkgname-stable-$pkgver-i386.tgz")
  sha512sums=('ad0d4905ef0b6e0152a3165a290ac788d5283ee17f1409e2eca3d7680b251bd8711922b0b15caee3482f598be09005f77179e16172c5b5df2631f413c8162b0e')
fi

package() {
	cd $srcdir

	install -dm775 $pkgdir/opt

	cp -r maxthon $pkgdir/opt/

	msg2 "Setting system permissions..."
	chown root:root $pkgdir/opt/maxthon/maxthon_sandbox
	chmod 4755 $pkgdir/opt/maxthon/maxthon_sandbox

	msg2 "Icons and desktop file..."
	for i in 22 24 32 48 64 128 256; do
		install -Dm644 $pkgdir/opt/maxthon/product_logo_$i.png $pkgdir/usr/share/icons/hicolor/${i}x$i/apps/maxthon-browser.png
	done

	install -D $pkgdir/opt/maxthon/maxthon.desktop $pkgdir/usr/share/applications/maxthon.desktop
	install -d $pkgdir/usr/bin/
	ln -s /opt/maxthon/maxthon-browser $pkgdir/usr/bin/maxthon
	install -D $pkgdir/opt/maxthon/conf.d/pn $pkgdir/etc/default/maxthon.d/pn

	msg2 "Symlinking libudev"
	ln -s /usr/lib/libudev.so.1 $pkgdir/opt/maxthon/libudev.so.0

	msg2 "Removing the duplicated files"
	rm $pkgdir/opt/maxthon/maxthon.desktop
	rm $pkgdir/opt/maxthon/product_logo_*.png
}
