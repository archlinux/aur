# Maintainer: Finn Coffey <aur@soxfox.me>
# Contributor: MaryJaneInChain <maryjaneinchain@gmail.com>

pkgname=tic-80-git
pkgver=1.2.3019.32853aa
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://tic80.com/"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libglvnd' 'curl')
makedepends=('git' 'cmake' 'ruby-rake' 'glu')
provides=("tic-80")

_gitname=TIC-80

source=("git+https://github.com/nesbox/$_gitname.git" 'get_version.cmake')
sha256sums=('SKIP'
            '4ab65f4733179a551a928a9e757ae6eab1681a6369ea3aa571d258ea1189697a')

pkgver() {
    cd "$srcdir/$_gitname"
    cmake -P "$srcdir/get_version.cmake" 2>&1 >/dev/null
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule update --init --recursive --depth=1

    # Update SDL2 to 2.32.8 to fix build failure with recent pipewire
    # Upstream has an open PR for this at https://github.com/nesbox/TIC-80/pull/2779
    cd vendor/sdl2
    git fetch --tags
    git checkout release-2.32.8
}

build() {
    cd "$srcdir/$_gitname"
    cmake -S . -B build \
          -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
          -DBUILD_PRO=true \
          -DBUILD_SDL=true -DBUILD_SDLGPU=true \
          -DBUILD_PLAYER=true -DBUILD_TOOLS=true \
          -DBUILD_WITH_ALL=true -DBUILD_STATIC=true \
          -DBUILD_TOUCH_INPUT=true
    cmake --build build
}

package() {
    cd "$srcdir/$_gitname/build"
    install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80"
    install -Dm755 bin/player-sdl "${pkgdir}/usr/bin/player-sdl"
    install -Dm755 bin/bin2txt "${pkgdir}/usr/bin/bin2txt"
    install -Dm755 bin/cart2prj "${pkgdir}/usr/bin/cart2prj"
    install -Dm755 bin/prj2cart "${pkgdir}/usr/bin/prj2cart"
    install -Dm755 bin/wasmp2cart "${pkgdir}/usr/bin/wasmp2cart"
    install -Dm755 bin/xplode "${pkgdir}/usr/bin/xplode"

    install -Dm644 linux/tic80.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 linux/tic80.png -t "${pkgdir}/usr/share/icons/"

    cd "$srcdir/$_gitname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

