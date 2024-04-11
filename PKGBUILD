# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-mda-lv2
pkgname=$_pkgname-git
pkgver=1.1.0.r217.b2df88c
pkgrel=4
pkgdesc='MOD fork of the LV2 port of the MDA plugins (git version)'
arch=(x86_64)
url='https://github.com/moddevices/mda-lv2'
license=(GPL-3.0-or-later)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(git lv2 python2)
checkdepends=(lv2lint mod-lv2-extensions)
optdepends=('lv2-host: to load the LV2 plugins')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/moddevices/mda-lv2.git"
        'ttl-fixes.patch::https://patch-diff.githubusercontent.com/raw/moddevices/mda-lv2/pull/9.patch'
        'polyphony-param.patch')
sha256sums=('SKIP'
            'd65b3202225da4bb57611ec0f53b038386ae3f58d91fdbc7502c1ab032e62e80'
            'ca15c7b115f73e0ddca0c7835e3bcb874747130a465c1e994a7187f4efca4b24')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E '^MDA_VERSION =' wscript | cut -d "'" -f 2)
  printf "$ver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 -N -r - -i "$srcdir"/ttl-fixes.patch
  patch -p1 -N -r - -i "$srcdir"/polyphony-param.patch
}

build() {
  cd $_pkgname
  python2 waf configure --prefix=/usr
  python2 waf -v
}

check() {
  local _plugin
  local _plugins=(Ambience Bandisto BeatBox Combo DX10 DeEss Degrade Delay Detune
  Dither DubDelay Dynamics EPiano Image JX10 Leslie Limiter Loudness MultiBand
  Overdrive Piano RePsycho RezFilter RingMod RoundPan Shepard Splitter Stereo
  SubSynth TalkBox TestTone ThruZero Tracker Transient VocInput Vocoder)

  cd $_pkgname
  for _plugin in "${_plugins[@]}"; do
    # NOTE: whitelist globally visible library: https://gitlab.com/drobilla/mda-lv2/-/issues/2
    lv2lint -q -Mpack \
      -s epianoData \
      -s loudness \
      -s lvz_new_audioeffectx \
      -s lvz_translate_parameter \
      -s pianoData \
      -s '_Z*' \
      -I "build/mod-mda-$_plugin.lv2" \
      "http://moddevices.com/plugins/mda/$_plugin"
  done
}

package() {
  cd $_pkgname
  python2 waf install --destdir "$pkgdir"
  install -vDm 644 NEWS README -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
