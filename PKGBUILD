_name=kate
pkgname=${_name}-light
pkgver=22.12.2
pkgrel=1
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
pkgdesc='Advanced text editor (stripped from unnecessary dependencies)'
url='https://apps.kde.org/kate/'
groups=('kde-applications' 'kde-utilities')
conflicts=("${_name}" 'kwrite')
provides=("${_name}" 'kwrite')
depends=('knewstuff' 'ktexteditor' 'kconfig' 'kcoreaddons' 'kwindowsystem' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules')

optdepends=(
    'konsole: open a terminal in Kate'
    'clang: C and C++ LSP support'
    'python-lsp-server: Python LSP support'
    'texlab: LaTeX LSP support'
    'rust: Rust LSP support'
    'git: git-blame plugin'
    'markdownpart: Markdown preview'
    'svgpart: SVG preview'
)

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    'e0d4b1115ee4d7184e6e71b6a9e2ee7fe4ea7d1e3f02a5828f7417e90f402ca5'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

options=('!docs')

_disable=(
    'KF5DocTools'
    'KF5Activities'
    'KUserFeedback'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
