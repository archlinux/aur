# $Id$
# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>
# Contributor: netcrusher < tobias AT miglix DOT eu >

pkgname=festival-patched-hts
provides=('festival')
conflicts=('festival')
pkgver=2.4
_suffix=release
pkgrel=5
pkgdesc="Multi-lingual speech synthesis system (with HTS 2.1 compatibility patches)"
arch=('i686' 'x86_64')
url="http://www.cstr.ed.ac.uk/projects/festival/"
license=('BSD' 'GPL' 'custom')
depends=('perl' 'gcc-libs' 'alsa-lib' 'ncurses')
options=('!makeflags')
optdepends=('festival-hts-voices-patched: HTS voices')
source=("http://www.cstr.ed.ac.uk/downloads/${provides}/${pkgver}/${provides}-${pkgver}-${_suffix}.tar.gz"
	"http://www.cstr.ed.ac.uk/downloads/${provides}/${pkgver}/speech_tools-${pkgver}-${_suffix}.tar.gz"
	"http://www.cstr.ed.ac.uk/downloads/${provides}/${pkgver}/festlex_CMU.tar.gz"
	"http://www.cstr.ed.ac.uk/downloads/${provides}/${pkgver}/festlex_OALD.tar.gz"
	"http://www.cstr.ed.ac.uk/downloads/${provides}/${pkgver}/festlex_POSLEX.tar.gz"
	'speechconfig.patch'
	'festconfig.patch'
	'festival-gcc47.patch'
	'festival-shared-build.patch'
	'festival-2.1-hts21compat.patch'
	'festival-2.1-hts21compat-config.patch'
	'festival-2.4-compat.patch'
	'festival-pulseaudio.patch')
sha256sums=('1e47f293e0857ffde2bccead97947c040ea0b35ea12dd5796edb51583e5e5d84'
            'fbc2482c443919aa79d2e599d6a5faee4e793df55a79ef377f1dc7e8ba237010'
            'c19430919bca45d5368cd4c82af6153fbcc96a487ebd30b78b5f3c08718b7c07'
            'e33a345390d4c76f8b987b06a5332bcdd0b168cf67c95ddc3270f9163cbe61f8'
            'e7c6e3642dbd5b0d64942bc015a986fdd6244a79e51ec2e8309e63d569e49ea3'
            'a412ba7f5b21344f7b1d71020b2d7e5c51650712d98caf4926ab3b6edc7858ca'
            'a2e33b86841fecc8c147a2a822119d23668275645eb40ab2e55e119d8a01220c'
            '9d90e91e29928ccaec3b988bedc8711e0d2cb3c4eee659fbe28f8631ca0d3b4d'
            '9dd97abd02e1fe78f0eaf83a22a1be896e19246700e0bfa2860e0025f0d58c42'
            'e218aa005dcaa03e39a1d6c026efccab7a2f288dc09e3ceb1ec4786d16f3f295'
            '10b32baf49638199aee0b3687ff9dd34e44b12812c0d55ddf52dc212891f11b4'
            '146bc3aa86862478a32ea994da7e72963f0d08c267a179209eb91a7b46e61c14'
            '2c353cdeb34804516f54acbc792918a57f35bdbd8cda5f6c8c8b928c94ad750d')

prepare() {
  patch -Np0 -i ${srcdir}/speechconfig.patch
  patch -Np0 -i ${srcdir}/festconfig.patch

  # fix build with new gcc versions and build shared libs - taken from Mageia
  patch -Np0 -i ${srcdir}/festival-shared-build.patch
  patch -Np0 -i ${srcdir}/festival-gcc47.patch

  patch -Np0 -i ${srcdir}/festival-2.1-hts21compat.patch
  patch -Np0 -i ${srcdir}/festival-2.1-hts21compat-config.patch

  patch -Np0 -i ${srcdir}/festival-2.4-compat.patch

  patch -Np1 -d ${srcdir}/speech_tools -i ${srcdir}/festival-pulseaudio.patch

  # Avoid make failure on making scripts and docs
  sed -i "s#examples bin doc#examples#" festival/Makefile
}

build() {
  # Build Speech Tools first
  cd "$srcdir/speech_tools"
  ./configure --prefix=/usr --sysconfdir=/etc
  make OPTIMISE_CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing -fno-delete-null-pointer-checks -std=gnu++98 -fPIC" OPTIMISE_CCFLAGS="${CFLAGS} -fno-strict-aliasing"

  # Build Festival itself
  cd "$srcdir/festival"
  ./configure --prefix=/usr --sysconfdir=/etc
  make OPTIMISE_CXXFLAGS="${CXXFLAGS} -fno-delete-null-pointer-checks -std=gnu++98 -fPIC" OPTIMISE_CCFLAGS="${CFLAGS}"
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
  install -m755 -t "$pkgdir"/usr/bin bin/[a-z]*
  rm -f "$pkgdir"/usr/bin/{est_gdb,est_examples,est_program}

  #libraries
  install -m755 -t "$pkgdir"/usr/lib lib/lib*.so.*
  ln -sf libestbase.so.${pkgver}.1 "$pkgdir"/usr/lib/libestbase.so
  ln -sf libestools.so.${pkgver}.1 "$pkgdir"/usr/lib/libestools.so
  ln -sf libeststring.so.1.2 "$pkgdir"/usr/lib/libeststring.so

  #headers
  for dir in {.,instantiate,ling_class,rxp,sigpr,unix}; do
    install -m644 -t "${pkgdir}"/usr/include/speech_tools/$dir include/$dir/*.h
  done

  # Install Festival itself
  cd "$srcdir"/festival

  #binaries
  install -m755 -t "$pkgdir/usr/bin/" src/main/festival
  install -m755 -t "$pkgdir/usr/bin/" src/main/festival_client
  install -m755 -t "$pkgdir/usr/bin/" examples/{benchmark,dumpfeats,durmeanstd,latest,make_utts,powmeanstd,run-festival-script,saytime,scfg_parse_text,text2pos,text2wave}
  install -m755 -t "$pkgdir/usr/bin/" lib/etc/Linux/audsp
  install -m755 -t "$pkgdir/usr/bin/" lib/etc/email_filter

  #libraries
  install -m755 src/lib/libFestival.so.* "$pkgdir"/usr/lib/
  ln -sf libFestival.so.2.4.0 "$pkgdir"/usr/lib/libFestival.so

  #headers
  install -dm755 "$pkgdir"/usr/include/festival
  install -m644 -t "$pkgdir"/usr/include/festival src/include/*.h

  mkdir -p "$pkgdir"/usr/share/festival
  cp -aR lib/* "$pkgdir"/usr/share/festival
  rm -rf "$pkgdir"/usr/share/festival/etc
  rm -fv $(find "$pkgdir"/usr/share/festival -name Makefile)
  rm -fv $(find "$pkgdir"/usr/bin -name Makefile)

  #create voices directory
  install -dm755 "$pkgdir"/usr/share/festival/voices

  #licenses
  install -D -m644 "$srcdir"/festival/COPYING \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 "$srcdir"/speech_tools/README \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.other

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
