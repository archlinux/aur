# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=dusk-audio-plugins-git
pkgver=r1448.2c5dd2c
pkgrel=1
pkgdesc="Dusk Audio plugins: EQ, compressors, tape, delay, reverb, synth, chord analyzer (VST3/CLAP/LV2)"
arch=('x86_64' 'aarch64')
url="https://github.com/dusk-audio/dusk-audio-plugins"
license=('GPL-3.0-or-later' 'ISC' 'MIT')
groups=('pro-audio' 'vst3-plugins' 'clap-plugins' 'lv2-plugins')
depends=('dbus' 'gcc-libs' 'glibc' 'libgl' 'libx11' 'libxcursor' 'libxext' 'libxrandr')
makedepends=('cmake' 'git' 'libxtst' 'lilv' 'lv2' 'mesa' 'ninja' 'pkgconf')
provides=('dusk-audio-plugins')
conflicts=('dusk-audio-plugins')
source=("git+$url.git"
        "git+https://github.com/dusk-audio/DAF.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd dusk-audio-plugins
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # Upstream pins DAF in .github/daf-ref: a branch name or a full commit SHA.
  local _daf_ref
  _daf_ref=$(grep -v '^[[:space:]]*#' dusk-audio-plugins/.github/daf-ref | grep -m1 .)
  _daf_ref=${_daf_ref//[[:space:]]/}
  if [[ $_daf_ref =~ ^[0-9a-f]{40}$ ]]; then
    git -C DAF checkout -q "$_daf_ref"
  else
    git -C DAF checkout -q "origin/$_daf_ref"
  fi
}

build() {
  cd dusk-audio-plugins

  local _dir
  for _dir in plugins/*/daf-plugin; do
    cmake -S "$_dir" -B "$_dir/build" -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DDAF_PATH="$srcdir/DAF" \
      -DDUSK_DAF_INSTALL_LOCAL=OFF \
      -Wno-dev
    cmake --build "$_dir/build" --target \
      $(cmake --build "$_dir/build" --target help | sed -n 's/^\([a-z0-9-]*-\(vst3\|clap\|lv2\)\):.*/\1/p')
  done
}

package() {
  local _ext
  for _ext in vst3 lv2 clap; do
    install -d "$pkgdir/usr/lib/$_ext"
    cp -a -t "$pkgdir/usr/lib/$_ext" dusk-audio-plugins/plugins/*/daf-plugin/build/bin/*."$_ext"
  done

  install -Dm644 dusk-audio-plugins/plugins/shared-daf/THIRD_PARTY_LICENSES.md \
    -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 DAF/LICENSE "$pkgdir/usr/share/licenses/$pkgname/DAF-LICENSE"
}
