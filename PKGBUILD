pkgname=kwin-bismuth-git
pkgver=2.3.0.r35.g78eff10
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
makedepends=('git' 'npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=('kwin-bismuth')
conflicts=('kwin-bismuth')
options=('!emptydirs')

pkgver() {
    cd "${srcdir}/repo"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_branch="master"

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --filter=tree:0 --sparse --no-checkout --single-branch -b "${_branch}" "${url}" "repo"
    fi

    cd "repo"

    git fetch -f --filter=tree:0
    git sparse-checkout set "/package.json" "/CMakeLists.txt" "/src" "/LICENSES" "/external"
    git reset --hard "origin/${_branch}"

    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"package.json")
    rm "package.json"

    npm i -E "esbuild"@"${ver}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "repo" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=false

    ninja -C "build"
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    cd "${srcdir}/repo/LICENSES"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp -rt "$_" *
}
