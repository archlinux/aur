# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=NeuralRack
pkgbase=${_name,,}
pkgname=($pkgbase $pkgbase-{clap,lv2,standalone,vst})
pkgver=0.3.1
pkgrel=1
pkgdesc='A neural model and impulse response file loader'
arch=(aarch64 x86_64)
url="https://github.com/brummer10/$_name"
license=(BSD-3-Clause)
groups=(pro-audio)
depends=(glibc gcc-libs libx11)
makedepends=(cairo jack libsndfile lv2 portaudio xxd)
checkdepends=(lv2lint)
source=("https://github.com/brummer10/$_name/releases/download/v$pkgver/$_name-v$pkgver-src.tar.xz")
sha256sums=('d1c491531274e4bf0cbccfc43298b6b2b6980fbb0d3538eac015edb606d481d5')
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

prepare() {
  cd $_name-v$pkgver
  sed -i 's/egrep/grep -E/' makefile
}

build() {
  cd $_name-v$pkgver
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

  echo "Checking $pkgbase.lv2 with lv2lint ..."
  ln -vsf "../bin/${pkgbase^}.lv2" .lv2
  LV2_PATH="${PWD}/.lv2" lv2lint -s '_Z*' "$_plugin_uri"
}

package_neuralrack() {
  arch=(any)
  depends+=($pkgbase-{clap,lv2,standalone,vst})
  cd $_name-v$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  cd "$pkgdir"
  rm -rf $pkgbase-{clap,lv2,standalone,vst}
  _pick $pkgbase-clap usr/lib/clap/*
  _pick $pkgbase-lv2 usr/lib/lv2/*
  _pick $pkgbase-standalone usr/bin/*
  _pick $pkgbase-standalone usr/share/{applications,pixmaps}
  _pick $pkgbase-vst usr/lib/vst/*
}

package_neuralrack-clap() {
  pkgdesc+=" – CLAP"
  depends+=(libcairo.so libsndfile.so)
  optdepends=('clap-host: for loading the CLAP plugin')
  groups+=(clap-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_neuralrack-lv2() {
  pkgdesc+=" – LV2"
  depends+=(libcairo.so libsndfile.so)
  optdepends=('lv2-host: for loading the LV2 plugin')
  groups+=(lv2-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_neuralrack-standalone() {
  pkgdesc+=" – JACK standalone"
  depends+=(libasound.so libcairo.so libjack.so libportaudio.so libsndfile.so)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_neuralrack-vst() {
  pkgdesc+=" – VST2"
  depends+=(libcairo.so libsndfile.so)
  optdepends=('vst-host: for loading the VST2 plugin')
  groups+=(vst-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm 644 README.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
