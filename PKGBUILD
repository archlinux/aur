# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Xyne
# Maintainer: netcrusher < firstname AT miglix DOT eu >
# Category: multimedia

pkgname=festival-hts-voices-patched
provides=('festival-hts-voices')
conflicts=('festival-hts-voices')
pkgver=2.1
pkgrel=1
pkgdesc="Festival voices based on the HMM-Based Speech Synthesis System (HTS). With compatibility patches to work with Festival 2.1."
url="http://hts.sp.nitech.ac.jp/"
depends=('festival-patched-hts' 'sox')
arch=('i686' 'x86_64')
license=('custom')
install=festival-hts-voices-patched.install
source=(
  "http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_awb_arctic_hts-${pkgver}.tar.bz2"
  "http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_bdl_arctic_hts-${pkgver}.tar.bz2"
  "http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_clb_arctic_hts-${pkgver}.tar.bz2"
  "http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_jmk_arctic_hts-${pkgver}.tar.bz2"
  "http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_rms_arctic_hts-${pkgver}.tar.bz2"
  "http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_slt_arctic_hts-${pkgver}.tar.bz2"
)
sha256sums=('7aea67674661d29ee8686b45af38f4f090204e101abaead04aa731bdb7635569'
            '5133aebf7a620e577f01a5e7669c7da95fb527071902eb8364d0b40f0be47835'
            '4cf35b17d2db5b92498a0a371ed61330ce57d57b97f40803653fee8a77e2b338'
            'e86e57c8a8361693671343473f68790160a3b69ccc7b906eb2cd1f5855d35ce3'
            '845ae4ff9d7afed0b8270ab71d0709136f4a648ba67b66caecdb71d9bf1e993c'
            '0aff67531eb9575f3204ad516a1fa81fe2356873e3567d0ee3dba94565eea47d')

prepare() {
  cd "$srcdir/lib/voices/us"

  for voice in awb bdl clb jmk rms slt
  do
    voicefile="$srcdir/lib/voices/us/nitech_us_${voice}_arctic_hts/festvox/nitech_us_${voice}_arctic_hts.scm"
    sed "s@(require 'hts)@(require 'hts21compat)@g" ${voicefile} -i
    sed "s@(Parameter.set 'Synth_Method 'HTS)@(Parameter.set 'Synth_Method 'HTS21)@g" ${voicefile} -i
  done
}

package() {
  cd "$srcdir/lib/voices/us"

  mkdir -p "$pkgdir/usr/share/festival/voices/english"
  cp -Rt "$pkgdir/usr/share/festival/voices/english" *
  install -D -m644 \
    "$srcdir/lib/voices/us/nitech_us_awb_arctic_hts/hts/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
