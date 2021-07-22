pkgname=vgmstream-git
pkgver=r1050.3828.g54f06ba6
pkgrel=1
pkgdesc='Library for playback of various streamed audio formats used in video games'
arch=(x86_64)
url='https://github.com/vgmstream/vgmstream'
license=(BSD)
depends=(ffmpeg libao libatrac9-git libogg libvorbis mpg123 speex)
makedepends=(audacious git gtk2)
optdepends=('audacious: for using the bundled plugin')
conflicts=(vgmstream-kode54-git)
replaces=(vgmstream-kode54-git)
source=(${pkgname}::git+https://github.com/vgmstream/vgmstream.git
        https://downloads.xiph.org/releases/celt/celt-0.6.1.tar.gz
        https://downloads.xiph.org/releases/celt/celt-0.11.0.tar.gz
        install-headers.patch)
sha256sums=('SKIP'
            'a991dff4a9e0772ede0881d81cdc7ac559148c2194885cbdd534fe4af43779da'
            'c94d4d34f5a2caa1574b1a94869202cacd959b55f643a8bafe0660008acad9c3'
            'e3e94769b6545e2c8c0b60ffda684b659bb8db06f3fb9d7645fd4a734d115bac')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --tags --exact-match 2>/dev/null | tr - . ||
      git describe --long | tr - . ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p0 < "$srcdir"/install-headers.patch
}

celt_symbols=(
  alg_quant
  alg_unquant
  celt_decode
  celt_decoder_create
  celt_decoder_create_custom
  celt_decoder_destroy
  celt_mode_create
  celt_mode_destroy
  celt_mode_info
  celt_encoder_destroy
  celt_encoder_create
  celt_encode
  celt_encode_float
  celt_encoder_ctl
  celt_decode_float
  celt_decoder_ctl
  compute_allocation
  compute_band_energies
  denormalise_bands
  ec_dec_init
  ec_decode
  ec_decode_bin
  ec_dec_update
  ec_dec_uint
  ec_dec_bits
  ec_enc_init
  ec_encode
  ec_encode_bin
  ec_enc_uint
  ec_enc_bits
  ec_enc_done
  normalise_bands
  renormalise_vector
  quant_coarse_energy
  quant_fine_energy
  quant_energy_finalise
  unquant_coarse_energy
  unquant_energy_finalise
  unquant_fine_energy)

build() {
  celt06_cflags="$CFLAGS -fPIC"
  for sym in ${celt_symbols[@]}; do
    celt06_cflags+=" -D$sym=$(sed 's/[^_]\+/&_0061/' <<< $sym)"
  done
  celt11_cflags="${celt06_cflags//_0061/_0110} -DCUSTOM_MODES=1"

  make -f /dev/stdin <<EOF
all .PHONY: $srcdir/celt-0.6.1 $srcdir/celt-0.11.0
$srcdir/celt-0.6.1:
	cd "\$@" && CFLAGS="$celt06_cflags" ./configure
	\$(MAKE) -C "\$@"
$srcdir/celt-0.11.0:
	cd "\$@" && CFLAGS="$celt11_cflags" ./configure
	\$(MAKE) -C "\$@"
EOF

  cd "$srcdir/$pkgname"
  ./bootstrap
  CFLAGS="$CFLAGS -DVGM_USE_FFMPEG -DVGM_USE_MPEG -DVGM_USE_VORBIS -DVGM_USE_G7221 -DVGM_USE_ATRAC9 -DVGM_USE_CELT -DVGM_USE_SPEEX" \
    LIBS="-lavcodec -lavformat -lavutil -latrac9 $srcdir/celt-0.6.1/libcelt/.libs/libcelt.a $srcdir/celt-0.11.0/libcelt/.libs/libcelt0.a -lm" \
    ./configure --prefix=/usr
  make -f Makefile.autotools
}

package() {
  cd "$srcdir/$pkgname"
  make -f Makefile.autotools install DESTDIR="$pkgdir"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}

# vim:set sw=2 et:
