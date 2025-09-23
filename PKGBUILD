

pkgname=voicevox-bin
pkgver=0.24.2
pkgrel=1
pkgdesc='Frontend for VOICEVOX TTS Engine'
arch=('x86_64')
license=('nonfree+GPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
replaces=(voicevox-appimage)
source=(voicevox.{desktop,sh.in}
${url}/releases/download/${pkgver}/voicevox-linux-cpu-x64-${pkgver}.tar.gz)
noextract=(voicevox-linux-cpu-x64-${pkgver}.tar.gz)
sha256sums=('8b7c50e71175dd35e286ab2f672ff3dd137669d2cda4c556febcf9c6f005c148'
            'e77f4d2a733e28026e86d4425cd0fefa8b920584f3033437ec6045fb4862fa81'
            'aae06c0a90e565e102e67e3823323a445bede5b525cbdc507bc87c12aea74390')
# see https://raw.githubusercontent.com/VOICEVOX/voicevox/refs/tags/${pkgver}/package.json
_electron=electron36
options=(!debug)

package() {
  depends=(glibc gcc-libs zlib bash libsndfile $_electron) #onnxruntime
  tar -xf ${noextract[0]} VOICEVOX/{resources,vv-engine,7zzs,README.txt} \
    --exclude VOICEVOX/vv-engine/libgcc_s.so* \
    --exclude VOICEVOX/vv-engine/libmvec.so* \
    --exclude VOICEVOX/vv-engine/libz.so* \
    --exclude VOICEVOX/vv-engine/libstdc++.so* #libonnxruntime.so*
  ln -sf /usr/lib/libgfortran.so VOICEVOX/vv-engine/libgfortran-*.so*
  ln -sf /usr/lib/libquadmath.so VOICEVOX/vv-engine/libquadmath-*.so*
  ln -sf /usr/lib/libsndfile.so VOICEVOX/vv-engine/_soundfile_data/libsndfile*.so*

  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 VOICEVOX/vv-engine/resources/engine_manifest_assets/icon.png "$pkgdir"/usr/share/pixmaps/voicevox.png
  install -d "$pkgdir"/usr/lib
  chmod 755 -R VOICEVOX
  mv VOICEVOX "$pkgdir"/usr/lib/voicevox
  sed "s/@ELECTRON@/${_electron}/" voicevox.sh.in | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/voicevox
  # workaround
  install -d "$pkgdir"/usr/lib/${_electron}
  ln -sf /usr/lib/voicevox/vv-engine -t "$pkgdir"/usr/lib/${_electron}
}
