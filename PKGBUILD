#
# Maintainer: Chris Cromer <chris@cromer.cl>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>
#

pkgname=plymouth-nosystemd
_pkgname=plymouth
pkgver=0.9.2
pkgrel=1
pkgdesc="A graphical boot splash screen with kernel mode-setting support for non systemd setups"
url="http://www.freedesktop.org/wiki/Software/Plymouth/"

arch=('i686' 'x86_64')
license=('GPL')

depends=('libdrm' 'pango' 'elogind')
makedepends=('docbook-xsl')
optdepends=('ttf-dejavu')

options=('!libtool' '!emptydirs')

provides=('plymouth')
conflicts=('plymouth' 'plymouth-git')
replaces=('plymouth' 'plymouth-git')
backup=('etc/plymouth/plymouthd.conf')

source=("http://www.freedesktop.org/software/${_pkgname}/releases/${_pkgname}-${pkgver}.tar.bz2"
        'arch-logo.png'
	'plymouth.encrypt_hook'
	'plymouth.encrypt_install'
	'plymouth-start.path'
	'plymouth.initcpio_hook'
	'plymouth.initcpio_install'
	'plymouth-quit.service.in.patch'
	'plymouth-set-default-theme.in.patch'
	'plymouth-update-initrd.patch')

md5sums=('ff420994deb7ea203df678df92e7ab7d'
         '65fa2763d5c9bb9f80973ea5e6e3db3e'
         'fbdd5d04e3089a214b9056357434df86'
         '65eb269910f1b81e3f0970af456394ca'
         '672ad913e2383483bcb4599a0a6bee48'
         '32f04fdbd1eb94ade30d1e63fdcdd9b5'
         'a6dca3d57fd38b875d0520ec033dbf66'
         '165a39dbedcc6e123c8ca05d5b4b2e25'
         'f79edbbb30c71b0dbcd102c7dd31660b'
         '0357775c16b5f90f1af485e6a4c80a9e')

prepare() {
	cd "$srcdir"/${_pkgname}-${pkgver}
	patch -p1 -i $srcdir/plymouth-set-default-theme.in.patch
	patch -p1 -i $srcdir/plymouth-update-initrd.patch
	patch -p1 -i $srcdir/plymouth-quit.service.in.patch
}

build() {
	cd "$srcdir"/${_pkgname}-${pkgver}

	LDFLAGS="$LDFLAGS -ludev" ./configure --prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--sbindir=/usr/bin \
		--enable-drm \
		--enable-tracing \
		--enable-pango \
		--enable-gtk=no \
		--with-release-file=/etc/os-release \
		--with-logo=/usr/share/plymouth/arch-logo.png \
		--with-background-color=0x000000 \
		--with-background-start-color-stop=0x000000 \
		--with-background-end-color-stop=0x4D4D4D \
		--without-rhgb-compat-link \
		--without-system-root-install

	make
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/arch-logo.png"             "$pkgdir/usr/share/plymouth/arch-logo.png"

  install -Dm644 "$srcdir/plymouth.encrypt_hook"     "$pkgdir/usr/lib/initcpio/hooks/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.encrypt_install"  "$pkgdir/usr/lib/initcpio/install/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.initcpio_hook"    "$pkgdir/usr/lib/initcpio/hooks/plymouth"
  install -Dm644 "$srcdir/plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/plymouth"

  install -Dm644 "$pkgdir/usr/share/plymouth/plymouthd.defaults" "$pkgdir/etc/plymouth/plymouthd.conf"
}

