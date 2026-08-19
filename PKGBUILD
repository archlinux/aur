# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=ToneShiftEQ
pkgbase=${_name,,}
pkgname=($pkgbase $pkgbase-{clap,lv2,standalone,vst3})
pkgver=0.9.0
pkgrel=1
pkgdesc='A dynamic 12-band equalizer for mixing and mastering'
arch=(aarch64 x86_64)
url="https://github.com/brummer10/$_name"
license=(BSD-3-Clause)
groups=(pro-audio)
depends=()
makedepends=(cairo fftw freetype2 jack libsndfile lv2 xxd)
checkdepends=(lv2lint)
source=("https://github.com/brummer10/$_name/releases/download/v$pkgver/$_name-v$pkgver-src.tar.xz")
sha256sums=('e065747958f436cf623faddd3139f93b0af49c5e0a523bfc5d1175bf79f83801')
_plugin_uri="urn:brummer:$pkgbase"

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  cd $_name-v$pkgver
  export CFLAGS+=" -Wno-unused-result"
  export CXXFLAGS+=" -Wno-unused-result"
  make CXX=g++ STRIP=:
}

check() {
  cd $_name-v$pkgver

  local lv2specs=(
    atom buf-size core data-access dynmanifest event instance-access log midi
    morph options parameters patch port-groups port-props resize-port schemas
    state time ui units uri-map urid worker kx-programs kx-properties)

  mkdir -p .lv2

  for spec in ${lv2specs[@]}; do
    ln -vsf /usr/lib/lv2/$spec.lv2 .lv2
  done

  echo "Checking $_name.lv2 with lv2lint ..."
  ln -vsf "../bin/$_name.lv2" .lv2
  LV2_PATH="${PWD}/.lv2" lv2lint -s '_Z*' "$_plugin_uri"
}

package_toneshifteq() {
  arch=(any)
  depends+=($pkgbase-{clap,lv2,standalone,vst3})
  cd $_name-v$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  cd "$pkgdir"
  rm -rf $pkgbase-{clap,lv2,standalone,vst,vst3}
  _pick $pkgbase-clap usr/lib/clap/*
  _pick $pkgbase-lv2 usr/lib/lv2/*
  _pick $pkgbase-standalone usr/bin/*
  _pick $pkgbase-standalone usr/share/{applications,pixmaps}
  _pick $pkgbase-vst3 usr/lib/vst3/*
}

package_toneshifteq-clap() {
  pkgdesc+=" – CLAP"
  depends+=(glibc libcairo.so libfftw3.so libfftw3f.so libfreetype.so libgcc
            libsndfile.so libstdc++ libx11)
  optdepends=('clap-host: for loading the CLAP plugin')
  groups+=(clap-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md Manual.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_toneshifteq-lv2() {
  pkgdesc+=" – LV2"
  depends+=(glibc libcairo.so libfftw3.so libfftw3f.so libfreetype.so libgcc
            libstdc++ libx11)
  optdepends=('lv2-host: for loading the LV2 plugin')
  groups+=(lv2-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md Manual.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_toneshifteq-standalone() {
  pkgdesc+=" – JACK standalone"
  depends+=(glibc libcairo.so libfftw3.so libfftw3f.so libfreetype.so libgcc
            libjack.so libsndfile.so libstdc++ libx11)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md Manual.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_toneshifteq-vst3() {
  pkgdesc+=" – VST3"
  depends+=(glibc libcairo.so libfftw3.so libfftw3f.so libfreetype.so libgcc
            libsndfile.so libstdc++ libx11)
  optdepends=('vst3-host: for loading the VST3 plugin')
  groups+=(vst3-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md Manual.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
