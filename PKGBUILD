# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ninjas2
pkgver=0.1
pkgrel=1
pkgdesc="A sample slicer audio plugin"
arch=('x86_64')
url="https://github.com/rghvdberg/ninjas2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gcc-libs' 'glibc' 'libaubio.so' 'libglvnd' 'libsamplerate' 'libsndfile' 'libx11')
makedepends=('gendesk' 'libjack.so')
checkdepends=('lv2lint' 'sord')
optdepends=('libjack.so: for standalone application')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rghvdberg/ninjas2/releases/download/v${pkgver}/ninjas2_source.tar.gz")
sha512sums=('3aaf6657d9446c13ef889eb26eabf2918040db7b5289ff1b5a10e5cc55557db90af41c2815dc9c5fed9077b8e51c56ba02f378e6d28474fc722f436ec62a9694')

prepare() {
  mv -v "$pkgname" "$pkgname-$pkgver"
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
  sord_validate "bin/${pkgname}.lv2/"*.ttl || echo "Known to fail: https://github.com/rghvdberg/ninjas2/issues/76"
  LV2_PATH="${PWD}/bin" lv2lint "https://github.com/rghvdberg/ninjas2" || echo "Known to fail: https://github.com/rghvdberg/ninjas2/issues/76"
}

package() {
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
