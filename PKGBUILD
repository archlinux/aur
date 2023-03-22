# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=chromaprint
pkgname=lib32-chromaprint
pkgver=1.5.1
pkgrel=2
pkgdesc="Library for extracting fingerprints from any audio source (32-bit)"
url="https://acoustid.org/chromaprint"
arch=('x86_64')
license=('LGPL2.1' 'MIT')
depends=('lib32-ffmpeg' 'chromaprint')
makedepends=('cmake' 'gtest')
# upstream signs with DSA key: https://github.com/acoustid/chromaprint/issues/81
source=(https://github.com/acoustid/${_basename}/archive/v$pkgver/$_basename-$pkgver.tar.gz
        fix_build_32bit.patch
        8ccad693.patch
        https://github.com/acoustid/chromaprint/commit/aa67c95b.patch)
sha512sums=('ea16e4d2b879c15b1d9b9ec93878da8b893f1834c70942663e1d2d106c2e0a661094fe2dd3bae7a6c2a1f9d5d8fab5e0b0ba493561090cf57b2228606fad1e66'
            '64d67c17e65f89dbee629074fcd9131c89aa493ff7be9da8c97031e7ed0ee4768e7350182c016eb52e6614307d3a668eb2d4e64586d77793cc79b319734b6b44'
            '9eb62b6b165fb2a48fe6399025a51161347cb56b8b7d28819a90be38425d145d2997aecb203dbadf40bcb469b0757ad8f836dca7dbb1db95f923a427f3c2d9ee'
            '92a9491fe1cd4cedae4f36335de961f87c5ebba642ab52866011c43f34862c194afa9d25e5e54e5abc80112d69c39cc04c2ddd2a7a2fe799b35a3846c0d1e172')
b2sums=('9f7f030e97d3114cf679df298d313ea826c0fb05e7e7d8a10090d0a27ed0811b380b81b29fce973e0493826c478964367396311fd0484619cb2fc4c2d8e0d4c0'
        '442949f3de7ef38f80e629cc644cda5816c3f092268e489e23952404ea767b39213a808e7aaf2fb28d024fea46b3ecab99fbef283fff8d297f0ff4e8d7435adc'
        '085dd1c64347a76cf912d327d8782fafd392777aae9dd565b1e84860e12a1262d9b25f908c54b96147abf74c82824529c6e100f5943ddff725358bb7aa19da47'
        'e49352aef51ef19874d51dabf5ecc5f703d7e441f34b37c8cef538395688a0c42a57bb0b75dc5af2140f2ab752ef7421635c29c45d5c3708789561b3a552b84c')

prepare() {
    patch -d "$_basename-$pkgver" -p1 < fix_build_32bit.patch
    patch -d "$_basename-$pkgver" -p1 < 8ccad693.patch
    patch -d "$_basename-$pkgver" -p1 < aa67c95b.patch # Port to ffmpeg 5
    sed -e '/CMAKE_CXX_STANDARD/d' -i "$_basename-$pkgver/CMakeLists.txt" # Don't enforce c++11
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DLIB_SUFFIX=32 \
            -DCMAKE_BUILD_TYPE='None' \
            -DBUILD_TESTS=ON \
            -DGTEST_SOURCE_DIR=/usr/src/googletest/ \
            -Wno-dev \
            -B build \
            -S "$_basename-$pkgver"

    cmake --build build
}

check() {
    cmake --build build --target check
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -vDm 644 $_basename-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
    install -vDm 644 $_basename-$pkgver/{NEWS.txt,README.md} -t "$pkgdir/usr/share/doc/$pkgname"

    cd "$pkgdir"/usr

    rm -r include
}
