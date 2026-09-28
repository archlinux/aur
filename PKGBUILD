# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgbase=foosynth-plugin-${_plug}-git
pkgname=("vapoursynth-plugin-${_plug}-git")
pkgver=1310.0.0.0.3.g7e63c84
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfAviSynthPlusEvolution/L-SMASH-Works'
license=('LGPL')
depends=(
    'vapoursynth'
    'l-smash'
    'ffmpeg'
)
makedepends=(
    'git'
    'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
    "${_plug}::git+${url}.git"
    "ffmpeg9-compat.patch"
)
sha256sums=(
    'SKIP'
    '2ecd493118b36cdc3ab21c3a387c1f4d83c5d0915139057cf69e3667ad765343'
)

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
    mkdir -p build
    rm -fr "${_plug}/include"
    patch -d "${_plug}" -Np1 -i "${srcdir}/ffmpeg9-compat.patch"
}

build() {
    cd build
    arch-meson "../${_plug}/VapourSynth" \
        --buildtype=release
    ninja
}

package_vapoursynth-plugin-lsmashsource-git() {
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
    install -Dm755 "build/libvslsmashsource.so" "${pkgdir}${_plugindir}/libvslsmashsource.so"
    install -Dm644 "${_plug}/VapourSynth/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}