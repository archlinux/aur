# Maintainer: taotieren <admin@taotieren.com>

pkgbase=purc
pkgname=purc
pkgver=0.9.17
pkgrel=1
pkgdesc="The prime HVML interpreter for C/C++ Language."
arch=(x86_64
    aarch64
    riscv64
    mips64
    powerpc
    powerpc64le)
url="https://github.com/HVML/PurC"
license=('LGPL-3.0')
groups=(hvml
    hybridos2)
provides=(${pkgname}
    csseng
    domruler
    purc-fetcher
    libcsseng.so
    libpurc-dvobj-PY.so
    libpurc-dvobj-FS.so
    libpurc-dvobj-MATH.so
    libpurc-fetcher.so
    libdomruler.so
    libpurc.so)
conflicts=(${pkgname})
replaces=(domruler
    purc-fetcher)
depends=(glib2
    glibc
    python)
makedepends=(bison
    cmake
#     cython
    flex
    git
    ninja
    ccache
    curl
#     gcc
    clang
    llvm
    gperf
    lua-lgi
    ncurses
    libgcrypt
    libjpeg-turbo
    libnotify
    libmanette
    libtasn1
    libsecret
    libseccomp
    libpsl
    libxml2
    libxslt
    libsoup
    icu
#     mariadb
    openssl
    sqlite
    systemd
    pkgconf
    zlib)
checkdepends=(check
    gtest
    valgrind)
optdepends=('python-numpy: Scientific tools for Python'
    'webkit2gtk-hvml: Web content engine for GTK (HVML)'
    'webkit2gtk: Web content engine for GTK'
    'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz")
sha256sums=('6b607b1e1fb50fd3c9eaf68477fc62fead3e254873e3905707fc69f06db5032d')
options=('!strip')

build() {
    cd "${srcdir}/PurC-ver-${pkgver}/"

#     sed -i  's|0 9 13|0 9 14|g' CMakeLists.txt

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
# gcc build
#     cmake -DCMAKE_BUILD_TYPE=Release \
#     cmake -DCMAKE_BUILD_TYPE=None \
#         -DPORT=Linux \
#         -DENABLE_CHINESE_NAMES=ON \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -B build \
#         -G Ninja

# clang build
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=Linux \
        -DENABLE_CHINESE_NAMES=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/PurC-ver-${pkgver}/build install
}
