# Maintainer: Mihail G. <misho88@gmail.com>

# based on community/nemo:
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

rootname='nemo'
pkgname=${rootname}-chdir
pkgver=5.2.4
pkgrel=1
pkgdesc="Nemo patched so /proc/PID/cwd matches its cwd"
arch=(x86_64)
url="https://github.com/linuxmint/${rootname}"
license=(GPL)
provides=('nemo')
conflicts=('nemo')
depends=(cinnamon-desktop dconf gvfs exempi libexif libnotify libxml2
         python xapp)
optdepends=('cinnamon-translations: i18n'
            'ffmpegthumbnailer: support for video thumbnails'
            'catdoc: search helpers support for legacy MS Office files'
            'ghostscript: search helpers support for PostScript files'
            'libgsf: search helpers support for MS Office files'
            'libreoffice: search helpers support for legacy MS Office powerpoint files'
            'odt2txt: search helpers support for LibreOffice files'
            'poppler: search helpers support for PDF')
makedepends=(meson samurai gobject-introspection intltool libgsf)
source=(${url}/archive/${pkgver}/${rootname}-${pkgver}.tar.gz)
sha512sums=('0aa3f7e0c2bdb9d7f1874c17caea0e4a3da062fc243de1f1657bdb83090a1afb099baa404f211092f83cf6852c423b244482faf0ad6beaaddc072cbce17cc6d4')
b2sums=('dc6efb24921d5408938ff5b8660653789a77d6607e2e023d73eb5722a0a8bc75cd22d1241f5e852d0429d05f6ec4fd1abb798b8be1ecf513eeed108a256e506c')

prepare() {
  cd ${rootname}-${pkgver}

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i '/^\[Desktop Entry/,/^\[Desktop Action/ s/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in

  patch -u src/nemo-window-manage-views.c -i ../../chdir.patch
}

build() {
  mkdir -p ${rootname}-${pkgver}/build
  cd ${rootname}-${pkgver}/build

  meson --prefix=/usr \
        --libexecdir=lib/${rootname} \
        --buildtype=plain \
        ..
  samu
}

package() {
  cd ${rootname}-${pkgver}/build

  DESTDIR="${pkgdir}" samu install
}
