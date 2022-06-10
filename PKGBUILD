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
source=(${url}/archive/${pkgver}/${rootname}-${pkgver}.tar.gz 'chdir.patch' 'chdir_callback.patch')
sha512sums=('0aa3f7e0c2bdb9d7f1874c17caea0e4a3da062fc243de1f1657bdb83090a1afb099baa404f211092f83cf6852c423b244482faf0ad6beaaddc072cbce17cc6d4'
            '961ce77990518f9b3a839e8dda34e98ba852e0cba089c252bbf999306aa5b631971cb1f4f4f1706054008ca6ff926091e87ebdf412fff1aed74c1f8f931061de'
            '79062ab77a61bfa33d61492e4c4dcda33df7eaad924db2bedfac2cb2f19ba2f3427a1ccb18e26e2a1a0afc6fa3217948ad57cf67bd1c2a390f4c66df540c537f')
b2sums=('dc6efb24921d5408938ff5b8660653789a77d6607e2e023d73eb5722a0a8bc75cd22d1241f5e852d0429d05f6ec4fd1abb798b8be1ecf513eeed108a256e506c'
        '0e006868e9c7557fc54bc350896a184567a3066e1a89bfab53ee0155f9fc2b9f2061e515887ece6001c9cd857058b509c576cddfc82b883b9ea9013f1c928e6b'
        '2c6b79c39d1a9147b6dfc96da1ce2295108993d55e9973ea9e7e07ad80f88740e56dc6492f3b4e4c427fc6cefad8d0a376db4e16b0b92885709b0b8117705be1')

prepare() {
  cd ${rootname}-${pkgver}

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i '/^\[Desktop Entry/,/^\[Desktop Action/ s/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in

  patch -u src/nemo-window-manage-views.c -i ../chdir.patch
  patch -u src/nemo-window.c -i ../chdir_callback.patch
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
