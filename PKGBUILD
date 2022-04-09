pkgname=kwin-bismuth-git
pkgver=3.1.0.r0.gca5a5e2
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_repo='bismuth'
url="https://github.com/Bismuth-Forge/${_repo}"
license=('MIT')
depends=('systemsettings')
makedepends=('git' 'npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
options=('!emptydirs')

source=("${_repo}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"${_repo}/package.json")
    npm i -E --ignore-scripts=true "esbuild"@"${ver}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_repo}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=false

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_repo}/LICENSES"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp -rt "$_" *
}
