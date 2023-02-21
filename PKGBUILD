_name=plasma-integration
pkgname=${_name}-light
pkgver=5.27.1
pkgrel=1
pkgdesc='Qt Platform Theme integration plugins for the Plasma workspaces (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://kde.org/plasma-desktop/'
license=('LGPL')
groups=('plasma')
conflicts=("${_name}")
provides=("${_name}")
depends=('libxcursor' 'qqc2-desktop-style' 'perl')
makedepends=('extra-cmake-modules' 'breeze' 'plasma-wayland-protocols')

optdepends=(
    'xdg-desktop-portal-kde: kde portal implementation'
    'noto-fonts: default plasma fonts'
    'ttf-hack: default monospace font'
)

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/plasma/${pkgver}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '07f54e9313d912c13a9eb70d1df0aaee37ff87cc5f77af7c2b6b0995209b00b4'
    'SKIP'
)

validpgpkeys=(
    'E0A3EB202F8E57528E13E72FD7574483BB57B18D' # Jonathan Esk-Riddell <jr@jriddell.org>
    '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D' # Bhushan Shah <bshah@kde.org>
    'D07BD8662C56CB291B316EB2F5675605C74E02CF' # David Edmundson <davidedmundson@kde.org>
    '1FA881591C26B276D7A5518EEAAF29B42A678C20' # Marco Martin <notmart@gmail.com>
)

_disable=(
    'FontNotoSans'
    'FontHack'
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
