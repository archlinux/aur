# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>

pkgname=guayadeque
pkgver=0.3.7
pkgrel=8
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
depends=('curl' 'libgpod' 'taglib' 'wxgtk')
makedepends=('cmake')
optdepends=('gstreamer0.10-good-plugins: Support for additional file formats'
			'gstreamer0.10-bad-plugins: Support for additional file formats'
			'gstreamer0.10-ugly-plugins: Support for additional file formats'
			'gvfs: Support for external devices')
source=("https://github.com/anonbeat/guayadeque/archive/v${pkgver}.tar.gz"
        'guayadeque_01a_rev1891.patch'
        'guayadeque_01b_rev1892.patch'
        'guayadeque_01c_rev1893.patch'
        'guayadeque_01d_rev1894.patch'
        'guayadeque_02_pause_crash.patch'
        'guayadeque_03_wx30.patch'
        'guayadeque_04_wxcurl.patch'
        'guayadeque_05_wxSqlite_upgrade.patch'
        'guayadeque_06_pixbuf_link.patch'
        'guayadeque_07_player_display_fix.patch'
        'guayadeque_08_EditCrash.patch'
        'guayadeque_09_gstreamer_deprecated.patch')
sha256sums=('b56e924de172652ed7c1fb7b0551609567d36bdcf1938c68226d5acde1fc5169'
            '56ff5fae064fa421cb951a7c664550861e04ae4df8b692044e2a4785f238ce24'
            '15b49c58be40a57ecb1d38e7055c1edc5aaf71e0164062cc5f2b8fb589530377'
            '11f51be56bff7b3f1572df9e701ae4ee0c9f7d6324b9b78e0ab93da185eefad2'
            'b4101860ee371f3d37329267ff71efcb2f3b117399997209197687d1864c6716'
            'b0a17d8a4b69e5559966d84f9a517e268198a62ccbb178db78a4772b52d62e8f'
            '52bc278567abbd88fc281cdbaa10427be2e28028cd8c307d58a718c061607f45'
            'f6e8faedeac2ff47f6f2ea0ef3cb7737aafb9f7179b49313aac0f07b63783506'
            '6bd07e63afe0aa7baf30b616d701e234fd1c304897053e3eb466acb2db818071'
            '23d388711a17dc7e1487c740fd961ceb563a967d5866c5d5508865252be2d645'
            'e2dbb71fc1d6118fa31d30f49382c16bb306130fc94118f3df9f0ea64c27ca0f'
            'aaf355a3df930128da5c165b6ff07d06c3aa8ed4514522cc6a71e78634b5ee14'
            'b9df9aad73ef4b78850dea00d1f123770b0b139eddeba614bc662756ebfc4c6e')
BUILDFLDR='buildlocal'

prepare() {
  cd guayadeque-${pkgver}
  patch -Np0 -i ../guayadeque_01a_rev1891.patch
  patch -Np0 -i ../guayadeque_01b_rev1892.patch
  patch -Np0 -i ../guayadeque_01c_rev1893.patch
  patch -Np0 -i ../guayadeque_01d_rev1894.patch
  patch -Np0 -i ../guayadeque_02_pause_crash.patch
  patch -Np0 -i ../guayadeque_03_wx30.patch
  patch -Np0 -i ../guayadeque_04_wxcurl.patch
  patch -Np0 -i ../guayadeque_05_wxSqlite_upgrade.patch
  patch -Np0 -i ../guayadeque_06_pixbuf_link.patch
  patch -Np0 -i ../guayadeque_07_player_display_fix.patch
  patch -Np0 -i ../guayadeque_08_EditCrash.patch
  patch -Np0 -i ../guayadeque_09_gstreamer_deprecated.patch
}

build() {
  cd guayadeque-${pkgver}
  mkdir -p ${BUILDFLDR}
  cd ${BUILDFLDR}

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc' \
    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations" \
    -D_GUREVISION_:STRING="${pkgrel}"
  make
}

package() {
  cd guayadeque-${pkgver}/${BUILDFLDR}
  make DESTDIR="${pkgdir}" install
}
