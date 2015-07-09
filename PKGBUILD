pkgname=file-roller2-nn
pkgver=2.32.2
pkgrel=5
provides=('file-roller')
conflicts=('file-roller' 'nautilus')
pkgdesc="Archive manipulator for GNOME without nautilus dependency. (no nautilus)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gconf>=2.32.0' 'hicolor-icon-theme' 'dconf')
makedepends=('gnome-doc-utils' 'intltool')
optdepends=('unrar: the RAR uncompression program'
            'zip: creates PKZIP-compatible .zip files'
            'unzip: unpacks .zip archives'
            'p7zip: 7zip compression utility'
            'xz: managing LZMA and XZ compressed files'
            'arj: ARJ archiver'
            'unace: extraction tool for the proprietary ace archive format')
options=('!libtool' '!emptydirs')
install=file-roller.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/file-roller/${pkgver%.*}/file-roller-${pkgver}.tar.bz2
        org.gnome.nautilus.gschema.xml.in)


build() {
  cd "${srcdir}/file-roller-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/file-roller \
      --localstatedir=/var --disable-static \
      --disable-scrollkeeper \
      --disable-nautilus-actions
      # Configure file-roller without nautilus-actions
  make
}

package() {
    cd "${srcdir}/file-roller-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # Hack to run file-roller without nautilus
    sed -i 's/_summary/summary/g;s/_description/description/g;' ${srcdir}/org.gnome.nautilus.gschema.xml.in
    install -Dm755 ${srcdir}/org.gnome.nautilus.gschema.xml.in ${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.nautilus.gschema.xml
}

md5sums=('2ec596e237c2f3af1d7d3f5b9c12884f'
         '8d419450010031aa29a07505d83bab78')
