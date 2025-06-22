# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

# TODO Independent NAM.lv2 build

_base_name='neural-amp-modeler-ui'
_base_url='https://github.com/brummer10'
pkgname="${_base_name}-git"
pkgver='r45.d34a9a6'
pkgrel=1
pkgdesc='GUI for Neural Amp Modeler LV2 plugin'
arch=('x86_64')
url="${_base_url}/${_base_name}"
license=('0BSD')
groups=('pro-audio')
depends=('cairo' 'glibc' 'libx11' 'neural-amp-modeler-lv2')
makedepends=('git' 'lv2')
conflicts=("$_base_name")
provides=("$_base_name")
source=("git+${_base_url}/${_base_name}" "git+${_base_url}/libxputty.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$_base_name"
  git submodule init
  git config submodules.libxputty "${srcdir}/libxputty"
  git submodule update
}

pkgver() {
  cd "$_base_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_base_name"
  make
}

package() {
  cd "$_base_name"
  ibundle='neural_amp_modeler_ui.lv2'
  tgt_dir="${pkgdir}/usr/lib/lv2/${ibundle}"
  mkdir --parents "$tgt_dir"
  find /usr/lib/lv2/neural_amp_modeler.lv2/ \
    -mindepth 1 -maxdepth 1 \
    -not -name 'manifest.ttl' \
    -exec ln -s "{}" "$tgt_dir" \;
  make DESTDIR="$pkgdir" IBUNDLE="$ibundle" install
}
