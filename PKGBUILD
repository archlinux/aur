# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gnome-alsamixer
pkgver=0.9.7
pkgrel=4
pkgdesc="Gnome ALSA mixer"
arch=('x86_64')
url="https://launchpad.net/gnome-alsamixer"
license=('GPL')
depends=('alsa-lib' 'gconf' 'gtk2')
options=('!emptydirs')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/gnome-alsamixer_0.9.7~cvs.20060916.ds.1.orig.tar.gz
        02_change_gconf-keys_path.patch
        03_gnome-alsamixer.schemas.patch
        04_ignore-delimiters.patch
        05-remove-G_CONST_RETURN.patch
        06-drop-libgnomeui.patch
        gnome-alsamixer.desktop)
sha1sums=('98e716cd14fe46cb9c77034de7558ef113da26f5'
          'ee7743abfc8d6005be6fcb0fb47b45e636db5fdc'
          '6b3148bab4ed53bc9a0a123b33585cd81b138225'
          'd4a7f9a5868c5af52f9b3c7a146ae34ddc45adf7'
          '6b19224d0346cf53b864333b191fa99fc8e7ebdc'
          'f3b72ae8d83e482573e78f48125367e9bf8c6cd2'
          '31639f7932d088ca76a18c79839682be811f23d0')

prepare() {
  cd ${pkgname}-${pkgver}~cvs.20060916
  patch -Np1 -i ../02_change_gconf-keys_path.patch
  patch -Np1 -i ../03_gnome-alsamixer.schemas.patch
  patch -Np1 -i ../04_ignore-delimiters.patch
  patch -Np1 -i ../05-remove-G_CONST_RETURN.patch
  patch -Np1 -i ../06-drop-libgnomeui.patch

  ln -sf /usr/share/automake-*/mkinstalldirs mkinstalldirs
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgver}~cvs.20060916
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-schemas-install \
      --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make MSGFMT_OPTS="-c" LIBS+="-lm"
}

package() {
  cd ${pkgname}-${pkgver}~cvs.20060916
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/gnome-alsamixer.desktop" "${pkgdir}/usr/share/applications/gnome-alsamixer.desktop"
}
