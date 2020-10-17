# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ninjas2
pkgver=0.2.0
pkgrel=2
pkgdesc="A sample slicer audio plugin"
arch=('x86_64')
url="https://github.com/rghvdberg/ninjas2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio' 'vst-plugins')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libx11')
makedepends=('aubio' 'gendesk' 'jack' 'libsamplerate' 'libsndfile')
checkdepends=('lv2lint')
optdepends=('jack: for standalone application'
            'lv2-host: for LV2 plugin'
            'vst-host: for VST plugin')
source=("https://github.com/rghvdberg/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-source.zip")
sha512sums=('b05c4d2eaba91a1104cb2700b857e0b428a9bb574973616c1477a6c993c6290bb31343f071d0607c0d6c21830fd29523d814aff2bb12442a8ca45e06efd75506')
b2sums=('aac12947bbb217b22a81a6c53801cfd39e11ed37fbc63b5882825b918d5033517f62cd1c8479cd87e6af5410f78e1481eb28e0b73f6afa21c49a837829fdb218')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
  cd "$pkgname-$pkgver"
  # Removing the local aubio version from the plugin Makefile
  sed -e '/libaubio.a/d' \
      -e 's|-I../../aubio/src||' \
      -e 's/sndfile/aubio sndfile/g' \
      -i plugins/Ninjas2/Makefile
  # adding the system headers for aubio
  sed -e 's|"aubio.h"|<aubio/aubio.h>|g' \
      -i plugins/Ninjas2/*.{c,h}pp
  gendesk -n \
          --pkgname "${pkgname}" \
          --name "Ninjas2" \
          --genericname "Sample Slicer" \
          --categories "AudioVideo;Audio"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  # lv2lint segfaults on the plugin :(
  # https://github.com/clearly-broken-software/ninjas2/issues/76
  # lv2lint -Mpack -I "${PWD}/bin/${pkgname}.lv2/" "https://github.com/rghvdberg/ninjas2"
}

package() {
  depends+=('libaubio.so' 'libsamplerate.so' 'libsndfile.so')
  cd "$pkgname-$pkgver"
  install -vDm 755 "bin/${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm 755 "bin/${pkgname}-vst.so" -t "${pkgdir}/usr/lib/vst"
  install -vDm 755 "bin/${pkgname}.lv2/"*.so \
    -t "${pkgdir}/usr/lib/lv2/${pkgname}.lv2"
  install -vDm 644 "bin/${pkgname}.lv2/"*.ttl \
    -t "${pkgdir}/usr/lib/lv2/${pkgname}.lv2"
  install -vDm 644 "${pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 {AUTHORS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
