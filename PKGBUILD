# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=Ratatouille.lv2
pkgbase=ratatouille
pkgname=(ratatouille ratatouille-{clap,docs,lv2,standalone,vst})
pkgver=0.9.11
pkgrel=2
pkgdesc='Guitar amp neural model and impulse response loader and mixer'
arch=(aarch64 x86_64)
url="https://github.com/brummer10/$_name"
license=(BSD-3-Clause)
groups=(pro-audio)
depends=(glibc gcc-libs libx11)
makedepends=(cairo jack libsndfile lv2 portaudio xxd)
checkdepends=(lv2lint)
source=("https://github.com/brummer10/$_name/releases/download/v$pkgver/$_name-v$pkgver-src.tar.xz")
sha256sums=('9a8134a056b6ba62144dd49ba73b1acc9ae1015868d735ba2da4b94feeb707a1')
_plugin_uri="urn:brummer:ratatouille"

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
  # https://github.com/brummer10/Ratatouille.lv2/issues/42
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}"
  make CXX=g++ STRIP=:
}

check() {
  cd $_name-v$pkgver
  lv2lint -M pack -s '_Z*' -I bin/$_name "$_plugin_uri"
}

package_ratatouille() {
  arch=(any)
  depends+=(ratatouille-{clap,lv2,standalone,vst})
  optdepends=('ratatouille-docs: for documentation')
  cd $_name-v$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  cd "$pkgdir"
  _pick $pkgbase-clap usr/lib/clap/*
  _pick $pkgbase-lv2 usr/lib/lv2/*
  _pick $pkgbase-standalone usr/bin/*
  _pick $pkgbase-standalone usr/share/{applications,pixmaps}
  _pick $pkgbase-vst usr/lib/vst/*
}

package_ratatouille-clap() {
  pkgdesc+=" – CLAP"
  depends+=(libcairo.so libsndfile.so)
  optdepends=('clap-host: for loading the CLAP plugin')
  groups+=(clap-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ratatouille-docs() {
  arch=(any)
  pkgdesc+=" (documentation)"
  cd $_name-v$pkgver
  install -vDm 644 README.md Ratatouille.png -t "$pkgdir"/usr/share/doc/$pkgbase
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ratatouille-lv2() {
  pkgdesc+=" – LV2"
  conflicts=(ratatouille.lv2)
  replaces=(ratatouille.lv2)
  depends+=(libcairo.so libsndfile.so)
  optdepends=('lv2-host: for loading the LV2 plugin')
  groups+=(lv2-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ratatouille-standalone() {
  pkgdesc+=" – JACK standalone"
  depends+=(libasound.so libcairo.so libjack.so libportaudio.so libsndfile.so)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ratatouille-vst() {
  pkgdesc+=" – VST2"
  depends+=(libcairo.so libsndfile.so)
  optdepends=('vst-host: for loading the VST2 plugin')
  groups+=(vst-plugins)
  mv -v $pkgname/* "$pkgdir"
  cd $_name-v$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
