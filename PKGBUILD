# Maintainer : Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

_name=CinelerraCV
pkgname=cinelerra-cv
pkgver=2.3
pkgrel=8
epoch=1
pkgdesc="Professional video editing and compositing environment"
arch=('x86_64')
url="https://github.com/cinelerra-gg/cinelerra-cv/"
license=('GPL')
depends=('e2fsprogs' 'libavc1394' 'libiec61883' 'libxv'
         'libtiff' 'mjpegtools' 'fftw' 'a52dec' 'glu'
         'ffmpeg' 'faad2' 'faac' 'openexr>=2.0.0' 'libxft')
makedepends=('git' 'nasm' 'mesa')
source=("https://github.com/cinelerra-gg/${pkgname}/archive/v${pkgver}.tar.gz"
        'v4l1_removal.patch'
        'ffmpeg_api.patch'
        'ffmpeg2.0.patch'
        'gcc5fix.patch'
        'cinelerra-cv-ffmpeg3.patch'
        'ffmpeg-link.patch'
        'cinelerra-cv-ffmpeg4.patch')
sha512sums=('87134c7f88650df622963108352004cc71a5a515a832dafd15f926906e9ac73d162639857e6c46c85b01f2c48d4d47b5d8c602cb8e1b1514108a174c662ec5c7'
            '0295d71dd4b17051288778f54c57babd4fbfab5be29b71c47caf2bbac614898a7c2c7cb6cb1d093e6237f929f4e765a2fbed363cc34a3481d628ccdda19fe83e'
            '0882e87b3d8bd99de6c08d61a2569dd4595a90066ee6f697fddedb9f863f4ba3bcfb2b986e7ffeef369151cebf326a128f322d86c3c84602f7b35252f91a9bdb'
            '5313820d0030c216710654cb4ba17d33478e7f1d644c668d64e74c0d580d04ba658e68302a85311b2d2792c05a943a546b620ec680847d0324d335b168ba69c7'
            'b81bc1c5794003486f0ca1f8e5172ed4b0d1b06d2b3c00d5fc665a00b921e128d83e321fd0c41f9508f9f3726908b1f3876b45d4ecc4a32e7ec5e95ede564495'
            'e7f7c4058e4ea5cd21ed9abcb8383828aef181474b373051a23cbf31e6a68ba728c392fda93c301fd299facfe13e398ad1ccb990fc9ab3a3e4f4fd6238fea905'
            'bc3729d9a61b9734356162acdcf3c055b2a3fdb162686db9267da97a7e8b28f39637abd8524a6b2e286fbe99bd89d45e1df857048125286fbe6262e470ba6124'
            '39af2d3b1e1ce0faaef63db23bebc5466b7ac15a75da58c7119f443ec6c4b06ec9118cea21fa2d5ff98031b7399f24e0a5d2280ebd01dea534377f685e0492de')

prepare() {
  cd "${pkgname}-${pkgver}"

  ## Patches (oldest first) ##
  # v4l1 removal patch
  patch -Np1 -i "$srcdir/v4l1_removal.patch"
  # ffmpeg api patch update for 0.11
  patch -Np1 -i "$srcdir/ffmpeg_api.patch"
  # fix avcodec_alloc_context and alloc_open
  patch -Np1 -i "$srcdir/ffmpeg2.0.patch"
  # gcc 5.x fix
  patch -Np1 -i "$srcdir/gcc5fix.patch"
  # fix build with ffmpeg 3.0
  patch -p1 -i ../cinelerra-cv-ffmpeg3.patch
  patch -p0 -i ../ffmpeg-link.patch
  # fix build with ffmpeg 4.0 (Gentoo)
  patch -p1 -i ../cinelerra-cv-ffmpeg4.patch
  # gcc 4.6 workaround
  export CFLAGS+=" -Wwrite-strings -D__STDC_CONSTANT_MACROS"
  export CPPFLAGS="$CFLAGS"
  # remove executable stack
  export LDFLAGS+=" -Wl,-z,noexecstack"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  # disable mmx due to improper use of registers in asm
  # - possibly a new problem since gcc 4.9
  ./configure --prefix=/usr \
              --with-buildinfo=git/recompile \
              --with-external-ffmpeg \
              --enable-opengl \
              --disable-mmx \
              --disable-esd
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {AUTHORS,ChangeLog,NEWS,README.BUILD,TODO}
}

# vim:set ts=2 sw=2 et:
