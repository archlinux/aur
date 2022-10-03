_pkgname="dolphin"
pkgname="${_pkgname}-tabopts-git"
pkgver=22.04.0.r195.gf49cba188
pkgrel=1
pkgdesc='KDE File Manager - with tab options patch (git)'
arch=(i686 x86_64)
url=https://invent.kde.org/system/dolphin/-/merge_requests/269
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools git)
optdepends=(
    'ffmpegthumbs: video thumbnails'
    'kde-cli-tools: for editing file type options'
    'kdegraphics-thumbnailers: PDF and PS thumbnails'
    'konsole: terminal panel'
    'purpose: share context menu'
)
groups=(kde-applications kde-system)
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=(
    "$pkgname"::"git+https://invent.kde.org/system/dolphin.git"
    "tab-options.patch"::"https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
)
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    git -C "${pkgname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 < "${srcdir}/tab-options.patch"
}

build() {
    cmake -B build -S "${pkgname}" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
