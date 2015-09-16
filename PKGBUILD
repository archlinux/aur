# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Robin Hahling <firstnameDOTlasnameATgw-computingDOTnet>

set -u
pkgname='jm'
pkgver='19.0'
pkgrel='1'
pkgdesc='H.264/AVC reference software'
arch=('i686' 'x86_64')
url='http://iphome.hhi.de/suehring/tml/'
license=('Custom')
depends=('gcc-libs')
makedepends=('gcc' 'unzip' 'sed') # 'unzip'
source=("http://iphome.hhi.de/suehring/tml/download/jm${pkgver}.zip"
        'http://iphome.hhi.de/suehring/tml/download/COPYRIGHT_ITU.txt'
        'http://iphome.hhi.de/suehring/tml/download/COPYRIGHT_ISO_IEC.txt')
#noextract=("${source[0]##*/}")
sha256sums=('5a87ec1b112423748897fb771f249ac6b7cc8a50c3b56350275857346eed9e1f'
            '0c1a2d8d08247b183d80bb16d4db45a3b74c3421acacd68ff4e1c3163e6cf761'
            'f021ad7806bcaa9f12145384688e88fdb8e74003052fa29e5d52509bd2c1794d')

prepare() {
  set -u
  # These text files are marked as binary so unzip won't convert them
  #unzip -oaq "${noextract[0]}"
  cd 'JM'
  rm -rf 'JM.xcodeproj'
  find -type f '(' -name '*.sln' -o -name '*vc*proj*' ')' -delete
  sed -i -e 's:\r:\\r:g' \
         -e 's:^which:#&:g' \
         -e 's:< $f >$f.tmp && mv $f.tmp $f:-i "$f":g' \
    'unixprep.sh'
  #sh './unixprep.sh'
  find -type f '(' -name '*.[ch]' -o -name '*.cpp' -o -iname '*.TXT' -o -name '*.dox' -o -name '*.html' -o -name '*.cfg' -o -iname 'Makefile' ')' -exec sed -i -e 's:\r::g' '{}' ';'
  find -type f -iname 'Makefile' -exec sed -i -e 's/-march=pentium4//g' '{}' ';'
  set +u
}

build() {
  set -u
  cd 'JM'
  local tomake=( 'ldecod' 'lencod' 'rtpdump' 'rtp_loss' )
  local _prog
  for _prog in "${tomake[@]}"; do
    make -s -j "$(nproc)" -C "${_prog}" CFLAGS="${CFLAGS} -Wno-unused-but-set-variable"
  done
  set +u
}

package() {
  set -u
  cd 'JM'
  install -Dpm644 'Readme.txt' 'CHANGES.TXT' 'Changes_detail.txt' 'FREXT_changes.txt' 'disclaimer.txt' 'doc/JM Reference Software Manual.pdf' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 "${srcdir}/COPYRIGHT_ITU.txt" "${srcdir}/COPYRIGHT_ISO_IEC.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 COPYRIGHT*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd 'bin'

  local _prog
  for _prog in *.exe; do
    install -Dpm755 "${_prog}" "${pkgdir}/usr/bin/${_prog%.exe}"
  done
  #local cfgs=( 'decoder' 'decoder_stereo' 'encoder' 'encoder_baseline' 'encoder_extended' 'encoder_main' 'encoder_max_performance' 'encoder_stereo' 'encoder_tonemapping' 'encoder_view1' 'encoder_yuv422' 'explicit_seq' 'leakybucketrate' 'q_matrix' 'q_matrix2' 'q_matrix_def' 'q_offset' 'sg0conf' 'sg2conf' 'sg6conf' )
  #install -Dpm644 "${cfgs[@]/%/.cfg}" -t "${pkgdir}/usr/share/doc/${pkgname}/cfg/"

  find -type f -name '*.cfg' -exec install -Dpm644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/cfg/{}" ';'
  set +u
}
set +u
