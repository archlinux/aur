# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.6.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-cppwinrt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-brotli' 'mingw-w64-pcre2' 'mingw-w64-zstd')
makedepends=('mingw-w64-cmake-static' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c'
             'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-pkg-config'
             'qt6-base' 'ninja')
optdepends=('mingw-w64-postgresql: PostgreSQL driver'
            'mingw-w64-mariadb-connector-c: MariaDB driver'
            'qt6-base: development tools')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Use-CMake-s-default-import-library-suffix.patch'
        '0002-Fix-finding-D-Bus.patch'
        '0003-Fix-using-static-PCRE2-and-DBus-1.patch'
        '0004-Fix-transitive-dependencies-of-static-libraries.patch'
        '0005-Fix-libjpeg-workaround-for-conflict-with-rpcndr.h.patch'
        '0006-Support-finding-static-MariaDB-client-library.patch'
        '0007-Allow-overriding-CMAKE_FIND_LIBRARY_SUFFIXES-to-pref.patch'
        '0008-Fix-crashes-in-rasterization-code-using-setjmp.patch'
        '0009-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0010-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0012-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch'
        '0013-Allow-overriding-preference-for-shared-libzstd-libra.patch'
        '0014-Fix-errors-due-to-disabled-exceptions-with-cpp_winrt.patch'
        '0015-Fix-setting-exception-flags-of-plugin-targets.patch'
        '0016-Link-corelib-correctly-against-runtimeobject-when-co.patch'
        '0017-Workaround-linker-error-about-missing-symbol-__sync_.patch')
sha256sums=('0493fd0b380c4edf8872f011a7f26d245aa4cdd75b349904ef340a22dedf7462'
            '4436fa3cb4ae8042d4e7420dd69aff5e7ee90eab623b55290dadb4347f3af562'
            '5535db09b73284474eaf13181f52f52d67acad39f9fdc3a4cbd9938354e431b5'
            'c4dd118f2670f526d1a294e00db91e3bc8e3fc733ece40f3d42e14f4210c9d9e'
            '9e4e0cffecb7718c76f6f1f5d1d73bfddb630339ebb71e1fe947b0abe1cd9696'
            '2365407788639c006c03b0c9ab524c1335a4175623e92d537b6e134b5b78793d'
            '9de86821cb75a0c7f6ffd26188a58347d4982497460aa1940ae7c6fd19a05e11'
            '721c32de68daca63ee2440218da7f998d052cf5122f0266ce18dc9fcf979d743'
            'e8540d9b2b06a149668e389d8713a5e5d70a6728a01f7678fec36091f10d57a1'
            '25aaadd7ea30f4fc2d75f3bcb8dcb0a82e1fed23c7c34fa1deb7369032f9e24e'
            '7f1d483ab4b229c60a0658c6da18fb82619e0d8696ad5010de40748ce0b15b85'
            'e61047f9f167c9229978895cd19cb7cbd722620fb600d48f63dcc8f727b79b09'
            'e2811f2f857bf09572622cfec907bf738f3fdca1da9d83acd6cbaa62aa12ec85'
            '4b3a18cb211bdbdefda2ac34e97d16bc989e969ab77983cfcef8a75e06366504'
            'd3a02fb4fe241187ce9dd91123e661cde1e6ccdb098c26a9f7a2209b20074c89'
            '3652e0a71c16c2d7ec249f349cd38374d32b0f87401b4ef3e2f583e0e290ec78'
            '022dbdf8b2e89bb4ec80311807aaae46cb52896dd89ecb212adc5c7b7ab59be6'
            '1497d88387d761da233588b024cdb46e7f02b4a7a3efcc9508317fd4571e008c')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config

    local _enable_winrt_support=ON
    if [[ ! -e /usr/${_arch}/include/winrt/Windows.Foundation.h ]]; then
      echo "cppwinrt headers seem incomplete, disabling FEATURE_cpp_winrt"
      _enable_winrt_support=OFF
    fi

    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_CXX_STANDARD=20 \
      -DCMAKE_CXX_FLAGS="$CXX_FLAGS -std=c++20" \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DFEATURE_static_runtime=ON \
      -DFEATURE_openssl_linked=ON \
      -DFEATURE_cpp_winrt=$_enable_winrt_support \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=ON \
      -DFEATURE_system_freetype=ON \
      -DFEATURE_system_harfbuzz=ON \
      -DFEATURE_system_sqlite=ON \
      -DINSTALL_BINDIR=lib/qt6/bin \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_ARCHDATADIR=lib/qt6 \
      -DINSTALL_DATADIR=share/qt6 \
      -DINSTALL_INCLUDEDIR=include/qt6 \
      -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DINPUT_openssl=linked
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/static/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/static/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/static/share/doc"
  done
}
