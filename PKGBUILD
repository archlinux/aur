# Maintainer: AscendLiu <ascendliu@qq.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: nyorain <nyorain at gmail dot com>

pkgname=('skia-git')
pkgver=r79853.35319fdfca
pkgrel=1
pkgdesc="A complete 2D graphic library for drawing Text, Geometries, and Images."
arch=('x86_64')
url="https://github.com/google/skia"
license=('BSD-3-Clause')
options=('!debug')
depends=('zlib' 'libglvnd' 'freetype2' 'expat' 'libpng' 'libjpeg-turbo' 'fontconfig' 'harfbuzz' 'gcc-libs' 'libwebp' 'glibc')
makedepends=('git' 'python' 'ninja' 'gn')
provides=(skia)
conflicts=(skia)
source=('skia::git+https://github.com/google/skia.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/skia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/skia"

    # Fetch third-party dependencies
    GIT_SYNC_DEPS_SKIP_EMSDK=1 python3 tools/git-sync-deps || true

    # Use system gn instead of the prebuilt one from bin/fetch-gn
    ln -sf /usr/bin/gn bin/gn

    # Generate Ninja build files (official build + shared library + Full RELRO)
    gn gen out/Release --args='is_official_build=true is_component_build=true extra_ldflags=["-Wl,-z,now"]'
}

build() {
    cd "$srcdir/skia"
    ninja -C out/Release
}

package() {
    cd "$srcdir/skia"

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -D -m755 out/Release/libskia.so "$pkgdir/usr/lib/libskia.so"

    (cd include && find . -type f -name "*.h" -exec install -D -m644 {} "$pkgdir/usr/include/{}" \;)
    (cd modules && find . -type f -name "*.h" -exec install -D -m644 {} "$pkgdir/usr/include/{}" \;)
    (cd src && find . -type f -name "*.h" -exec install -D -m644 {} "$pkgdir/usr/include/{}" \;)
}

