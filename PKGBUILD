# $Id$
# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>
# Contributor: netcrusher < tobias AT miglix DOT eu >

pkgname=festival-patched-hts
provides=('festival')
conflicts=('festival')
pkgver=2.1
_suffix=release
pkgrel=2
pkgdesc="A general multi-lingual speech synthesis system. With HTS compatibility and GCC 4.7 patches to support HTS 2.1 voices."
arch=('i686' 'x86_64')
url="http://www.cstr.ed.ac.uk/projects/festival/"
license=('BSD' 'GPL' 'custom')
depends=('perl')
options=('!makeflags')
optdepends=('festival-hts-voices-patched: HTS voices')
source=("http://www.festvox.org/packed/${provides}/${pkgver}/${provides}-${pkgver}-${_suffix}.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/speech_tools-${pkgver}-${_suffix}.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festlex_CMU.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festlex_OALD.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festlex_POSLEX.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festvox_cmu_us_awb_cg.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festvox_cmu_us_rms_cg.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festvox_cmu_us_slt_arctic_hts.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festvox_kallpc16k.tar.gz"
	"http://www.festvox.org/packed/${provides}/${pkgver}/festvox_rablpc16k.tar.gz"
	'speechconfig.patch'
	'festconfig.patch'
	'festival-shared-build.patch'
	'festival-2.1-hts21compat.patch'
	'festival-2.1-hts21compat-config.patch'
	'festival.gcc47.patch'
	'unqualifiedmethods.diff')
sha256sums=('06f3dcbad9d26e27443fc66947a0faf0c6679482220df4b5f42a261adf758080'
            'ff6167cd929a88e2f91b47191c6c4dae87c9c06ba39fccc4465af9d79e9b2be9'
            'c19430919bca45d5368cd4c82af6153fbcc96a487ebd30b78b5f3c08718b7c07'
            'e33a345390d4c76f8b987b06a5332bcdd0b168cf67c95ddc3270f9163cbe61f8'
            'e7c6e3642dbd5b0d64942bc015a986fdd6244a79e51ec2e8309e63d569e49ea3'
            'f6010538b3e2f32152cc75741a62b8c7eecfaa3e51153c9db735723002807264'
            '5f0ffc3181df76b63f3c13db3cdc6e67e02639a3982c6b6fa55bbbd2fe1cbc30'
            '642e2d659fd7f30396343394a62a3643d0714a5c0e6a1491063b841fd053a0cc'
            '7a357c34086fbba8b813f9750f6b5ba13e2a00478a0a2e78a97981cb76395578'
            'a017ef70f6d3e64d51d3772ab438eb47a26b529b456dae3cea18936925ec20e8'
            '6574cb9774aff2a45c4db14b5836d0750abd8abfed9258fc36bfe6487bf128d2'
            'eebf246aff1ca39cd157ae2fbbba874e52c581c3f2d4e5623b16e897e7a03d96'
            '180d52885bdc49f9c07fcfe96191afccd0afbca477876bd89bcc09ca1a9afb0f'
            'e218aa005dcaa03e39a1d6c026efccab7a2f288dc09e3ceb1ec4786d16f3f295'
            '10b32baf49638199aee0b3687ff9dd34e44b12812c0d55ddf52dc212891f11b4'
            'a5ebcfd29691c7d63b4b2be24a16caaabfccad5ae8b7978dbf5bd0607737fced'
            '7d42150a63a1d9c22a49801d41a7c07687b53cf48608367c023ef80662a05817')

prepare() {
  cd "$srcdir"

#  patch -Np0 -i "$srcdir/festival.gcc47.patch"
#  patch -Np0 -i "$srcdir/unqualifiedmethods.diff"

  patch -Np0 -i "$srcdir/festival-shared-build.patch"

  patch -Np0 -i "$srcdir/festival-2.1-hts21compat.patch"
  patch -Np0 -i "$srcdir/festival-2.1-hts21compat-config.patch"

  patch -Np0 -i "$srcdir/unqualifiedmethods.diff"

  cd "$srcdir/speech_tools"

  patch -Np1 -i "$srcdir/speechconfig.patch"

  cd "$srcdir/festival"

  patch -Np1 -i "$srcdir/festconfig.patch"
  # Avoid make failure on making scripts and docs
  sed -i "s#examples bin doc#examples#" Makefile
}

build() {
  # Build Speech Tools first
  cd "$srcdir/speech_tools"

  ./configure --prefix=/usr --sysconfdir=/etc
  make OPTIMISE_CXXFLAGS="${CXXFLAGS}" OPTIMISE_CCFLAGS="${CFLAGS}"

  # Build Festival itself
  cd "$srcdir/festival"

  ./configure --prefix=/usr --sysconfdir=/etc
  make OPTIMISE_CXXFLAGS="${CXXFLAGS}" OPTIMISE_CCFLAGS="${CFLAGS}"
}

package() {
 # Install Speech Tools first
  cd "$srcdir/speech_tools"
  install -dm755 "$pkgdir"/usr/{bin,lib,include/speech_tools/{,instantiate,ling_class,rxp,sigpr,unix}}

  #binaries
  #move binaries over wrappers (FS#7864)
  for i in $(grep -l 'EST shared script' bin/*); do
    cp -f main/$(basename $i) bin;
  done
  install -m755 -t "$pkgdir/usr/bin" bin/[a-z]*
  rm -f "$pkgdir/usr/bin/{est_gdb,est_examples,est_program}"

  #libraries
  install -m755 -t "$pkgdir/usr/lib" lib/lib*.so.*
  ln -sf libestbase.so.${pkgver}.1 "$pkgdir/usr/lib/libestbase.so"
  ln -sf libestools.so.${pkgver}.1 "$pkgdir/usr/lib/libestools.so"
  ln -sf libeststring.so.1.2 "$pkgdir/usr/lib/libeststring.so"
  install -m644 -t "$pkgdir/usr/lib" lib/lib*.a

  #headers
  for dir in {.,instantiate,ling_class,rxp,sigpr,unix}; do
    install -m644 -t "${pkgdir}/usr/include/speech_tools/$dir" include/$dir/*.h
  done

  # Install Festival itself
  cd "$srcdir/festival"

  #binaries
  install -m755 -t "$pkgdir/usr/bin/" src/main/festival
  install -m755 -t "$pkgdir/usr/bin/" src/main/festival_client
  install -m755 -t "$pkgdir/usr/bin/" examples/{benchmark,dumpfeats,durmeanstd,latest,make_utts,powmeanstd,run-festival-script,saytime,scfg_parse_text,text2pos,text2wave}

  #libraries
  install -m644 src/lib/libFestival.a "$pkgdir/usr/lib/"
  install -m755 src/lib/libFestival.so.* "$pkgdir/usr/lib/"
  ln -sf libFestival.so.2.1.0 "$pkgdir/usr/lib/libFestival.so"

  #headers
  install -dm755 "$pkgdir"/usr/include/festival
  install -m644 -t "$pkgdir"/usr/include/festival src/include/*.h

  mkdir -p "$pkgdir/usr/share/festival"
  cp -aR lib/* "$pkgdir/usr/share/festival"
  rm -f $(find "$pkgdir/usr/share/festival" -name Makefile)
  rm -f $(find "$pkgdir/usr/bin" -name Makefile)

  #create voices directory
  install -dm755 "$pkgdir/usr/share/festival/voices"

  #licenses
  install -D -m644 "$srcdir/festival/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/speech_tools/README" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.other"

  # Ok now some general cleanups
  for i in $(find "$pkgdir"/usr/include/ -type f); do
    sed -i -e 's,"EST.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/\",speech_tools/,g' \
      -e 's,"siod.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/\",speech_tools/,g' \
      -e 's,"instantiate/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/instantiate/\",speech_tools/instantiate/,g' -e 's,"instantiate,instantiate,g' \
      -e 's,"ling_class/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/ling_class/\",speech_tools/ling_class/,g' -e 's,"ling_class,ling_class,g' \
      -e 's,"rxp/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/rxp/\",speech_tools/rxp/,g' -e 's,"rxp,rxp,g' \
      -e 's,"sigpr/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/sigpr/\",speech_tools/sigpr/,g' -e 's,"sigpr,sigpr,g' \
      -e 's,"unix/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/unix/\",speech_tools/unix/,g' -e 's,\.h\">,.h\>,g' -e 's,"unix,unix,g' \
      -e 's,"festival\.h",\<festival/festival.h\>,g' \
      -e 's,"ModuleDescription\.h",\<festival/ModuleDescription.h\>,g' \
      -e 's,"Phone\.h",\<festival/Phone.h\>,g' $i
  done
}
