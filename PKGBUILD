# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/libzypp Christian Heusel <gromit@archlinux.org>
#
# Pull requests are welcome here:
# https://github.com/yurikoles-aur/libzypp-git
#

pkgbase=libzypp-git
pkgname=(
    libzypp-git
    libzypp-git-docs
)
pkgver=17.37.18.r23.g962844846
pkgrel=1
pkgdesc="ZYpp Package Management library"
arch=(x86_64)
url="https://github.com/openSUSE/libzypp"
license=('GPL-2.0-or-later')
makedepends=(
    asciidoctor
    boost
    boost-libs
    cmake
    curl
    doxygen
    fcgi
    gcc-libs
    git
    glib2
    glibc
    gpgme
    libproxy
    libsigc++
    libsolv
    libxml2
    nginx
    openssl
    rpm-tools
    systemd-libs
    vsftpd
    yaml-cpp
    zlib
)
# just needed for the mediabackend tests which don't seem to work in nspawn
# checkdepends=(
#     nginx
#     vsftpd
#     squid
# )
source=("$pkgname::git+https://github.com/openSUSE/libzypp.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S $pkgname
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_INSTALL_LIBEXECDIR=/usr/lib
        -D ENABLE_BUILD_TESTS=ON
        -D ENABLE_BUILD_DOCS=ON
        -D ENABLE_BUILD_TRANS=ON
        -D ENABLE_ZSTD_COMPRESSION=ON
        -D DISABLE_MEDIABACKEND_TESTS=ON
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    # https://github.com/openSUSE/libzypp/issues/622
    local excluded_tests=""
    local ctest_flags=(
        --test-dir build
        # show the stdout and stderr when the test fails
        --output-on-failure
        # execute tests in parallel
        --parallel $(nproc)
        # exclude problematic tests
        --exclude-regex "${excluded_tests[@]}"
    )
    ctest "${ctest_flags[@]}"
}

package_libzypp-git() {
    depends=(
        boost-libs
        curl
        gcc-libs
        glib2
        glibc
        gpgme
        libsigc++
        libsolv
        libxml2
        openssl
        rpm-tools
        systemd-libs
        yaml-cpp
        zlib
    )
    optdepends=(
        'libzypp-git-docs: for documentation'
    )


    DESTDIR="$pkgdir" cmake --install build

    # remove docs from lib split package
    rm -vr "$pkgdir/usr/share/doc/"
}

package_libzypp-git-docs() {
    pkgdesc+=" - documentation"

    install -vdm 755 "$pkgdir/usr/share/doc/$pkgbase/html/"
    cp -av build/zypp/doc/* "$pkgdir/usr/share/doc/$pkgbase/html/"
}
