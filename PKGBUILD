# Maintainer:  Dave <orangechannel@pm.me>

_plug=placebo
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r167.ccb4bea
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Lypheo/vs-placebo'
license=('LGPL')
depends=('vapoursynth' 'libplacebo')
makedepends=('git' 'meson' 'vulkan-headers')
optdepends=('libdovi')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
LIBP2P_COMMIT="f50288b0c8db2cb14bb98fc25a5f056609d03652"
source=("${_plug}::git+https://github.com/Lypheo/vs-placebo.git"
  "libp2p.tar.gz::https://github.com/sekrit-twc/libp2p/archive/$LIBP2P_COMMIT.tar.gz"
)
sha256sums=('SKIP' '37b14be5b1108268e55aa4fbaf838c287018ecc5b58e15efdfe064916afc44e9')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  rm -rf "subprojects/libp2p-$LIBP2P_COMMIT"
  ln -s "$srcdir/libp2p-$LIBP2P_COMMIT" "subprojects/libp2p-$LIBP2P_COMMIT"
  cp -f "subprojects/packagefiles/libp2p-$LIBP2P_COMMIT/meson.build" "subprojects/libp2p-$LIBP2P_COMMIT/"
  cp -f "subprojects/packagefiles/libp2p-$LIBP2P_COMMIT/meson_options.txt" "subprojects/libp2p-$LIBP2P_COMMIT/"

  arch-meson build --reconfigure
}

build() {
  cd "${_plug}"
  ninja -C build
}

package() {
  PLUGINDIR=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
  cd "${_plug}"

  install -Dm755 build/libvs_placebo.so "${pkgdir}${PLUGINDIR}/libvs_placebo.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
