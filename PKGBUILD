# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=pioneer
pkgver=20230203
pkgrel=2
pkgdesc="A game of lonely space adventure"
arch=('x86_64')
url="https://github.com/pioneerspacesim/pioneer"
license=('GPL3')
provides=('pioneer')
conflicts=('pioneer-bin' 'pioneer-git')
depends=(
  'assimp'
  'freetype2'
  'glew'
  'hicolor-icon-theme'
  'libsigc++'
  'libvorbis'
  'lua52'
  'mesa'
  'sdl2_image'
)
makedepends=(cmake naturaldocs ninja)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pioneerspacesim/pioneer/archive/$pkgver.tar.gz"
        fix_path_to_lua_h.patch::https://github.com/pioneerspacesim/pioneer/pull/5526/commits/058bb753ccddee110ed2fb76908cb25b5a656635.patch)
sha256sums=('80eea94e0f7e4d8e6a0c4629bdfb89201f82aae2f59ee7a1f7a487eeeccf27c7'
            'dbb08eccb356c7b00122487b7a49df4948b82256c52b9cc36c5122a057c0635e')

prepare() {
    cd "$pkgname-$pkgver"
    # fix version string, don't use the build date
    sed -i 's|PROJECT_VERSION "%Y%m%d"|PROJECT_VERSION "'$pkgver'"|' CMakeLists.txt
    # https://github.com/pioneerspacesim/pioneer/issues/5525
    patch -p1 -i "$srcdir/fix_path_to_lua_h.patch"
}

build()
{
    cmake -S "$pkgname-$pkgver" -B build -G Ninja \
          -D CMAKE_INSTALL_PREFIX:PATH=/usr \
          -D PIONEER_DATA_DIR:PATH=/usr/share/pioneer/ \
          -D USE_SYSTEM_LIBGLEW:BOOL=ON \
          -D USE_SYSTEM_LIBLUA:BOOL=ON \
          -D CMAKE_EXPORT_COMPILE_COMMANDS=1 \
          -Wno-dev

    cmake --build build --target all build-data codedoc
}

package()
{
    DESTDIR="$pkgdir" cmake --install build

    # appdata
    mv "$pkgdir"/usr/share/{appdata,metainfo}

    # remove empty directories
    rmdir "$pkgdir"/usr/share/pioneer/music/core/{{un,}docked,near-planet}

    # codedoc
    mkdir --parents "$pkgdir/usr/share/doc"
    cp --recursive "$pkgname-$pkgver"/codedoc "$pkgdir"/usr/share/doc/pioneer
}
