# Maintainer : Brian Bidulock <bidulock@openss7.org>
# Contributor : Laurent Carlier <lordheavym@gmail.com>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=xsensors-gtk2
_pkgname=xsensors
pkgver=0.70
pkgrel=7
pkgdesc="X11 interface to lm_sensors (gtk2)"
arch=('x86_64' 'i686')
url="http://www.linuxhardware.org/xsensors/"
license=('GPL')
depends=('gtk2' 'lm_sensors')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
makedepends=('imagemagick' 'gendesk')
changelog=$_pkgname.changelog
source=(http://www.linuxhardware.org/xsensors/$_pkgname-$pkgver.tar.gz
	remove-unused-variables.patch
	replace-deprecated-gtk.patch)
sha512sums=('34f038b192f3cecb2e7587e19c4837b795a2705e6d0e9ea2bd3ead6d3259a1dded364fcfc70fa5e37d64f32c879e1dd9c6e43dcf32fa9aeb73ee5cc49bf290a4'
            'ec81d48f16fb0b9b425247e3e2c56ef6f71acb8da5228bc72438aa33da86e2beb8d4d88c6e1ea8aa95e9db4b19a8939410b6693be61eba4e469686e20108adff'
            '008ea330c74b7f373cd637e3fc57e8ce2a9e8271f517d569be251c86f87593db081622b6df3f2970b741f407d51f4f348fe0dc102927d7289b0309288c3a70f6')

build() {
  cd "$srcdir"
  gendesk -n --pkgname "$_pkgname" --genericname="Hardware Monitor" \
          --comment="View hardware health" --categories="System;Monitor;GTK"

  cd "$_pkgname-$pkgver"

  # patches from debian
  patch -Np1 -i ${srcdir}/remove-unused-variables.patch
  patch -Np1 -i ${srcdir}/replace-deprecated-gtk.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  convert +set date:create +set date:modify "$pkgdir/usr/share/pixmaps/xsensors/default.xpm" \
    "$pkgdir/usr/share/pixmaps/xsensors.png"
  install -Dm644 "$srcdir/xsensors.desktop" \
    "$pkgdir/usr/share/applications/xsensors.desktop"
}
