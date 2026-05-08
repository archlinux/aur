# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=misc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.5.g07e0589
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/vapoursynth/vs-miscfilters-obsolete'
license=('GPL')
depends=('vapoursynth>=75')
makedepends=('git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}" "vapoursynth-plugin-miscfilters-obsolete")
conflicts=("vapoursynth-plugin-${_plug}" "vapoursynth-plugin-miscfilters-obsolete")
source=("${_plug}::git+https://github.com/vapoursynth/vs-miscfilters-obsolete.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package() {
  PLUGINDIR=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")

  install -Dm755 build/libmiscfilters.so "${pkgdir}${PLUGINDIR}/libmiscfilters.so"
  install -Dm644 "${_plug}/docs/misc.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
