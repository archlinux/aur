# Maintainer: taotieren <admin@taotieren.com>

pkgname=xguipro-git
pkgver=0.6.1.r3.g6f4eca8
pkgrel=1
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=('any')
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
groups=('hvml-git')
provides=(${pkgname%-git}  'xGUI-Pro')
conflicts=(${pkgname%-git})
replaces=()
depends=('glib2' 'gperf' 'enchant' 'gtk4' 'libsoup3')
makedepends=('git' 'cmake' 'ninja' 'ccache' 'gcc' 'python' 'libxml2' 'ruby' 'curl' 'openssl' 'sqlite' 'pkgconf' 'zlib' 'icu' 'webkit2gtk-hvml')
optdepends=('purc: The prime HVML interpreter for C Language.'
            'purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)')
backup=()
options=('!strip')
install=
source=("${pkgname%-git}::git+${url}.git"        )
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

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
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
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
#     make -C "${srcdir}"/${pkgname%-git}/build install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
