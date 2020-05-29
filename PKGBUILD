# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libva-vdpau-driver-chromium
pkgver=0.7.4
pkgrel=7
pkgdesc="VDPAU backend for VA API. (special version for chromium)"
arch=('x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('GPL')
depends=('libva'
         'libvdpau'
         'libgl'
         )
makedepends=('mesa'
             'xorgproto'
             )
replaces=('vdpau-video')
provides=('libva-vdpau-driver')
conflicts=('libva-vdpau-driver')
source=("https://freedesktop.org/software/vaapi/releases/libva-vdpau-driver/libva-vdpau-driver-${pkgver}.tar.bz2"
        'libva-vdpau-driver-0.7.4-glext-missing-definition.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/libva-vdpau-driver-0.7.4-glext-missing-definition.patch?h=packages/libva-vdpau-driver'
        'libva-vdpau-driver-0.7.4-libvdpau-0.8.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/libva-vdpau-driver-0.7.4-libvdpau-0.8.patch?h=packages/libva-vdpau-driver'
        'libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch?h=packages/libva-vdpau-driver'
        'sigfpe-crash.patch::https://bugs.freedesktop.org/attachment.cgi?id=142296'
        'libva-vdpau-driver-0.7.4-fallback-x.patch::https://raw.githubusercontent.com/sjnewbury/gentoo-playground/0999f9c8544ba29c012dd5d5e5c45a6235c3721a/x11-libs/libva-vdpau-driver/files/libva-vdpau-driver-0.7.4-fallback-x.patch'
        'implement-vaquerysurfaceattributes.patch'
        'libva-vdpau-driver-0.7.4-include-linux-videodev2.h.patch::https://raw.githubusercontent.com/gentoo/gentoo/34d5cc6fcf1d76c1c2833cb534717246c221214c/x11-libs/libva-vdpau-driver/files/libva-vdpau-driver-0.7.4-include-linux-videodev2.h.patch'
        'https://raw.githubusercontent.com/jstkdng/libva-vdpau-driver-chromium/master/vdpau-driver-template.patch'
        )
sha256sums=('155c1982f0ac3f5435ba20b221bcaa11be212c37db548cd1f2a030ffa17e9bb9'
            '776bfe4c101cdde396d8783029b288c6cd825d0cdbc782ca3d94a5f9ffb4558c'
            '5e567b026b97dc0e207b6c05410cc1b7b77a58ceb5046801d0ea1a321cba3b9d'
            '1ae32b8e5cca1717be4a63f09e8c6bd84a3e9b712b933816cdb32bb315dbda98'
            'ef21397b0ed55f170e57fa1afef42b8b491491149af09b151f97ef3cc20ed0b7'
            'b923dc60ad49459ca480a56af075d954b2678a8c7f433fd03f1aa49e58cfe838'
            'a91e11d2826715b29c2a08036f0e70ed45df7139987ff37c84b5c04c4a9c132f'
            '0ddf889850c54ccace8ec61a232f04ab77495c495949f952363ad28e2fc9891d'
            '5684b9520bbbe232322b33b313dff9457e339019c3f7e551b78e92adcd354902'
            )

prepare() {
  mkdir -p build

  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/libva-vdpau-driver-0.7.4-glext-missing-definition.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/libva-vdpau-driver-0.7.4-libvdpau-0.8.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/sigfpe-crash.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/libva-vdpau-driver-0.7.4-include-linux-videodev2.h.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/implement-vaquerysurfaceattributes.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p1 -i "${srcdir}/libva-vdpau-driver-0.7.4-fallback-x.patch"
  patch -d "libva-vdpau-driver-${pkgver}" -p2 -i "${srcdir}/vdpau-driver-template.patch"

  # https://bbs.archlinux.org/viewtopic.php?id=247933
  sed -e '/v4l2_buffer/d' \
      -e '/v4l2_format/d' \
      -i "${srcdir}/libva-vdpau-driver-${pkgver}/src/"vdpau_video.{h,c}

  # https://gitlab.freedesktop.org/lima/mesa/commit/1edaa33135feffe1082bf491e098224121615b08
  sed 's|Baseline|ConstrainedBaseline|g' -i "${srcdir}/libva-vdpau-driver-${pkgver}/src/vdpau_decode.c"
}

build() {
  cd build
  ../"libva-vdpau-driver-${pkgver}"/configure \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

