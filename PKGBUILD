# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=shiro-plugins
pkgname=$_pkgname-git
pkgver=0.1.0.r40.3e0a1d3
pkgrel=1
pkgdesc='Collection of LADSPA, LV2 and VST2 plugins made in MAX Gen~ (no MOD UI) (git version)'
arch=(x86_64)
url='https://github.com/ninodewit/SHIRO-Plugins'
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(git)
optdepends=(
  'ladspa-host: to load the LADSPA plugins'
  'lv2-host: to load the LV2 plugins'
  'vst-host: to load the VST2 plugins'
)
groups=(pro-audio ladspa-plugins lv2-plugins vst-plugins)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}")
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/ninodewit/SHIRO-Plugins.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd $_pkgname
  # project has no release yet so we'll use the version number from the common plugin code
  local ver="$(grep d_version plugins/common/DistrhoPluginMaxGen.hpp | sed -E 's/\s+return d_version\(([0-9]), ([0-9]), ([0-9])\);\s?/\1.\2.\3/')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.dpf.url "$srcdir"/dpf
  git -c protocol.file.allow=always submodule update
  # we disable the mod UI so the plugins can be used any DAW
  for header in plugins/*/DistrhoPluginInfo.h; do
    sed -E -i 's/DISTRHO_PLUGIN_USES_MODGUI\s+1/DISTRHO_PLUGIN_USES_MODGUI 0/' "$header";
  done
  # don't install empty DSSI directoy
  sed -i '/dssi/d' Makefile
  # fix license identifier in plugin meta data
  sed -i 's|"ISC"|"https://spdx.org/licenses/GPL-3.0-only"|' \
    plugins/common/DistrhoPluginMaxGen.hpp
}

build() {
  cd $_pkgname
  ./scripts/update-generated-code.sh
  # stamd-alone JACK versions have no UI and not useful
  make HAVE_JACK=0
}

package() {
  cd $_pkgname
  make HAVE_JACK=0 DESTDIR="$pkgdir" PREFIX=/usr install
  rm -rf "$pkgdir"/usr/bin
}
