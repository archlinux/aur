# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=vszipcl
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.2.0.0.g6c64f91
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zipcl'
license=('MIT')
depends=('vapoursynth')
makedepends=(
    'git'
    'zig'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git")
sha256sums=('SKIP')

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
    install -Dm755 "zig-out/lib/lib${_plug}.so" "${pkgdir}${_plugindir}/lib${_plug}.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
