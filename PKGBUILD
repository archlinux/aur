# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mda-lv2
pkgname=$_pkgname-git
pkgver=1.2.10.r273.3af080f
pkgrel=1
pkgdesc='A port of the MDA VST plugins to the LV2 format (git version)'
arch=(x86_64)
url='http://drobilla.net/software/mda-lv2.html'
license=(0BSD GPL-2.0-or-later MIT)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(git lv2 meson python)
checkdepends=(lv2lint)
provides=($_pkgname "${_pkgname//-/.}")
conflicts=($_pkgname $_pkgname-svn "${_pkgname//-/.}")
source=("$_pkgname::git+https://gitlab.com/drobilla/mda-lv2.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson --reconfigure -D tests=disabled $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}

check() {
  local _plugins _plugin
  _plugins=(Ambience Bandisto BeatBox Combo DX10 DeEss Degrade Delay Detune
  Dither DubDelay Dynamics EPiano Image JX10 Leslie Limiter Loudness MultiBand
  Overdrive Piano RePsycho RezFilter RingMod RoundPan Shepard Splitter Stereo
  SubSynth TalkBox TestTone ThruZero Tracker Transient VocInput Vocoder)

  for _plugin in "${_plugins[@]}"; do
    # NOTE: whitelist globally visible library: https://gitlab.com/drobilla/mda-lv2/-/issues/2
    lv2lint -Mpack -s lvz_new_audioeffectx -I "$_pkgname-build/mda.lv2" \
      "http://drobilla.net/plugins/mda/$_plugin"
  done

  # upstream tests require 'autoship', which is not packaged nor vendored in the project
  #meson test -C $_pkgname-build
}

package() {
  meson install -C $_pkgname-build --destdir "$pkgdir"
  install -vDm 644 $_pkgname/{NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 $_pkgname/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
