# Maintainer: taotieren <admin@taotieren.com>

pkgname=xguipro
pkgver=0.6.1
pkgrel=1
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=('x86_64' 'aarch64' 'mips64' 'powerpc' 'powerpc64le')
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
groups=('hvml-git')
provides=(${pkgname}  'xGUI-Pro')
conflicts=(${pkgname})
replaces=()
depends=('glib2' 'gperf' 'enchant' 'gtk4' 'libsoup3')
makedepends=('git' 'cmake' 'ninja' 'ccache' 'gcc' 'python' 'libxml2' 'ruby' 'curl' 'openssl' 'sqlite' 'pkgconf' 'zlib' 'icu' 'webkit2gtk-hvml' 'patch')
optdepends=('purc: The prime HVML interpreter for C Language.'
            'purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)')
backup=()
options=('!strip')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz"
        "fix-ver-0.6.1.patch")
sha256sums=('bf24d4aa9110d2e7b674256ea89a359ef87c9f0d44aefeb9457ac732a281836a'
            '62638afcf82751985ee8faff07a820bd60b1b80a1475e820f63cbd1d3e0b814a')

prepare() {
    cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"
    patch -p1 < ../fix-ver-0.6.1.patch
}

build() {
    cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"

# CMake build
#     cmake -DCMAKE_BUILD_TYPE=Release \
#         -DPORT=GTK \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -DENABLE_GAMEPAD=OFF \
#         -DENABLE_INTROSPECTION=OFF \
#         -DUSE_SOUP3=ON \
#         -DUSE_WPE_RENDERER=OFF \
#         -DUSE_LCMS=OFF \
#         -B build \

#     cmake --build build

# Ninja build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DPORT=GTK \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DENABLE_GAMEPAD=OFF \
        -DENABLE_INTROSPECTION=OFF \
        -DUSE_SOUP3=ON \
        -DUSE_WPE_RENDERER=OFF \
        -DUSE_LCMS=OFF \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
# make install
#     make -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build install
}
