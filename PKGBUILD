pkgname=kwin-bismuth-git
pkgver=3.1.3.r0.g042123b
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_base="${pkgname%-git}"
_name="${_base#kwin-}"
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('git' 'cmake' 'ninja' 'esbuild' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=("${_base}")
conflicts=("${_base}")
options=('!emptydirs')

source=("${_name}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_name}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_NPM=OFF \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=false

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_name}/LICENSES"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${licenses}"
    cp -rt "${licenses}" ./*
}
