# Maintainer: taotieren <admin@taotieren.com>

pkgbase=purc-git
pkgname=purc-git
pkgver=0.9.15.r33.g553ac0218
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
groups=(hvml-git
    hybridos2-git)
provides=(${pkgbase%-git}
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
conflicts=(${pkgbase%-git})
replaces=(domruler
    purc-fetcher)
depends=(glib2
    glibc)
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
    python
    zlib)
checkdepends=(check
    gtest
    valgrind)
optdepends=('python-numpy: Scientific tools for Python'
    'webkit2gtk-hvml: Web content engine for GTK (HVML)'
    'webkit2gtk: Web content engine for GTK'
    'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

#     sed -i 's|0 9 14|0 9 15|g' CMakeLists.txt
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
# gcc build
#     cmake -DCMAKE_BUILD_TYPE=None \
#         -DPORT=Linux \
#         -DENABLE_CHINESE_NAMES=ON \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -B build \
#         -G Ninja

# clang llvm build
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
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
