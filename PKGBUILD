# Maintainer: Salamandar <felix@piedallu.me>

pkgname=livewallpaper
pkgdesc="OpenGL powered animated wallpapers with configuration utility, autostart, and application indicator."
url="https://launchpad.net/livewallpaper"
license=('GPL3')

pkgver=0.5.0
pkgrel=3
arch=('x86_64' 'i686')

makedepends=('intltool' 'xcftools' 'cmake' 'vala')
depends=(
    'libpeas' 'upower' 'libappindicator-gtk3' 'gobject-introspection'
    'python' 'python-cairo' 'python-opengl' 'glew'
)

source=(
    'https://launchpad.net/livewallpaper/0.5/0.5.0/+download/livewallpaper-0.5.0.tar.gz'
    'livewallpaper.patch'
)

sha256sums=(
    'f4ce97a721015b135eb675915eb306c1fb256e680d480fe13e4fe6ca81c7e04e'
    'a7e2c63c98f574fc0a64dcffd478e3ba534a7805d5416c9089a2fdf8f869c694'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Patches:
    # * Please use python3
    # * Fix ref
    # * Fix old API (fromstring/tostring to frombytes/tobytes)
    # * CMake : remove debian dir
    # * CMake : disable doc generation (needs gtk-doc)
    patch -p2 -i "${srcdir}/livewallpaper.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    rm -rf "build"
    mkdir  "build"
    pushd  "build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make DESTDIR="${pkgdir}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pushd "build"

    make DESTDIR="${pkgdir}" install
}
