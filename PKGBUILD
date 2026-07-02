# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.18.0.1.gaca6430
pkgrel=2
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=(
    'git'
    'zig'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/adworacz/zsmooth.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | tr - . | tr -d v
}

build() {
    cd "${_plug}"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "${_plug}"
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
    install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}${_plugindir}/libzsmooth.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
