# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server
pkgver=2.3.3
_pkgver=$pkgver-lts-stable
_cef_version=3.3578.1870.gc974488
pkgrel=3
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL3')
depends=(ffmpeg libgl freeimage glew tbb openal sfml libxcomposite libxss pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix)
source=("https://github.com/CasparCG/server/archive/refs/tags/v$_pkgver.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1394.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1395.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1396.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1397.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1398.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1308.patch"
        tbb-version-fix.patch
        "https://cef-builds.spotifycdn.com/cef_binary_${_cef_version}_linux64_minimal.tar.bz2"
        casparcg)
sha256sums=('6d8e973949009e95bb5a6496e26cbe680efd77666936e131df0da569f8f7c7e1'
            'ab663b18f7221d4bcb0835ec7290910341c94a6f3b03cb6defb3eabeaf0f3396'
            'c0be24d0cc893b4bc402223307691bf5f321d3d6f3918333c55b65db20bacb59'
            'ddcd8a63e3b12f3199aca4baab867b4f207f247e29a9c48800a1d36f1508b319'
            '153aea3dc15646db29c01ae4ee82517bbb024bf1d177ed1ea55bd080b525d06e'
            '8c417d204e98aa46328a2682bd197a44c479e9dc4ad498a29f57dc1b1f2fa1c6'
            '5c6f2a3007e3a8739bc1f3eaec3c694af9836aed1943217843a92acff80950c1'
            '66247a03b2e902cad9d5e030e19f6b8f098246e962e36a86a80abb44034b5c36'
            'b7c5401f342917ece7be583566bfc48b5cc1a8ff9f6470d396130b4aca7dfb22'
            'ce9dd83ae2ef9289e551f0a3ecbe246537195049c15f69bbfdc6c3ddd23291c2')

prepare() {
    cd "$srcdir/server-$_pkgver"

    for f in ../*.patch
    do
        patch --forward --strip=1 --input "$f"
    done

    # TODO don't statically link boost
    sed -i '/Boost_USE_RELEASE/d;/Boost_USE_DEBUG/d' src/CMakeModules/Bootstrap_Linux.cmake

    # pch files don't seem to work with FORTIFY_SOURCE, ignore warnings
    sed -i /-Winvalid-pch/d src/CMakeModules/PrecompiledHeader.cmake

    dos2unix src/shell/casparcg.config
}

build() {
    # build libcef_dll_wrapper
    cd "$srcdir/cef_binary_${_cef_version}_linux64_minimal"

    # https://bitbucket.org/chromiumembedded/cef/commits/84a5749
    CXXFLAGS="$CXXFLAGS -Wno-attributes" \
        cmake -B build -S . -DCMAKE_BUILD_TYPE=None -G Ninja

    ninja -C build
    cp build/libcef_dll_wrapper/libcef_dll_wrapper.a Release/

    cd "$srcdir"
    cmake -B build -S "server-$_pkgver/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCEF_ROOT_DIR="$srcdir/cef_binary_${_cef_version}_linux64_minimal" \
        -G Ninja

    ninja -C build
}

package() {
    install -d "$pkgdir/opt/casparcg/"
    cp -r "$srcdir/build/staging"/{bin,lib,casparcg.config} "$pkgdir/opt/casparcg/"

    install -Dm755 "$srcdir/casparcg" "$pkgdir/usr/bin/casparcg"

    ln -sf "/usr/share/fonts/liberation/LiberationMono-Regular.ttf" "$pkgdir/opt/casparcg/"
}
