# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xguipro
pkgname=(xguipro-gtk3)
pkgver=0.8.2
pkgrel=0
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=(x86_64
    aarch64
    riscv64
    mips64 
    powerpc
    powerpc64le)
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
groups=('hvml')
provides=(${pkgbase}  'xGUI-Pro')
conflicts=(${pkgbase})
replaces=()
depends=(
# xguipro-gtk3
#         webkit2gtk
# # xguipro-gtk4
#         webkit2gtk-4.1
    curl
    enchant
    glib2
    gperf
    libxml2
    icu
    openssl
    purc
    python
    ruby
    sqlite
    zlib
        )
makedepends=(
    ccache
    cmake
    git
    base-devel
    ninja
    pkgconf

# # xguipro-gtk3
#             gtk3
#             libsoup
# # xguipro-gtk4
#             gtk4
#             libsoup3
            )
optdepends=('webkit2gtk-hvml: to support two HVML-specific attributes hvml-handle and hvml-events. This tailored WebKit engine provides support for two ports: GTK+ and HybridOS (MiniGUI).')
backup=()
options=('!strip')
install=
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver//./-}.tar.gz"
#         "001-fix.patch::https://github.com/HVML/xGUI-Pro/commit/a6e4022fa599e5e98d92d8d2feb56fe689e16f1a.patch"
        )
sha256sums=('725b5ff23477f222c084cff735832b4579555cf1986b22be965d4739383aa816')

prepare() {
    install -Dm644 /dev/stdin ${srcdir}/xguipro.csh <<EOF
if (! \$?WEBKIT_WEBEXT_DIR ) then
    set WEBKIT_WEBEXT_DIR=/bin/xguipro
    if ( "\$WEBKIT_WEBEXT_DIR" != "" ) then
        setenv WEBKIT_WEBEXT_DIR "\$WEBKIT_WEBEXT_DIR"
    else
        unset WEBKIT_WEBEXT_DIR
    endif
endif
EOF
    install -Dm644 /dev/stdin ${srcdir}/xguipro.sh <<EOF
if [ -z "\$WEBKIT_WEBEXT_DIR" ]; then
    WEBKIT_WEBEXT_DIR=/bin/xguipro
    [ -n "\$WEBKIT_WEBEXT_DIR" ] && export WEBKIT_WEBEXT_DIR || unset WEBKIT_WEBEXT_DIR
fi
EOF

#     cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"
#     patch -p1 < ${srcdir}/001-fix.patch
}

package_xguipro-gtk3() {
    pkgdesc+=" (gtk3)"
    conflicts+=(${pkgname%-git})
    depends+=(
        webkit2gtk
        gtk3
        libsoup)
    options=('!strip')

    cd "${srcdir}/xGUI-Pro-ver-${pkgver//./-}/"

# Ninja build
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=GTK \
        -DENABLE_GAMEPAD=OFF \
        -DENABLE_INTROSPECTION=OFF \
        -DUSE_SOUP2=ON \
        -DUSE_WPE_RENDERER=OFF \
        -DUSE_LCMS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build-gtk3 \
        -G Ninja

    ninja -C build-gtk3

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/xGUI-Pro-ver-${pkgver//./-}/build-gtk3 install

    install -Dm644 ${srcdir}/xguipro.csh ${pkgdir}/etc/profile.d/xguipro.csh
    install -Dm644 ${srcdir}/xguipro.sh ${pkgdir}/etc/profile.d/xguipro.sh
}

# package_xguipro-gtk4() {
#     pkgdesc+=" (gtk4)"
#     conflicts+=(${pkgname%-git})
#     depends+=(
# #         webkit2gtk
#         gtk4
#         libsoup3)
#     options=('!strip')
#
#     cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"
#
# # Ninja build
# # see：https://wiki.archlinux.org/title/CMake_package_guidelines
# #     cmake -DCMAKE_BUILD_TYPE=Release \
#     cmake -DCMAKE_BUILD_TYPE=None \
#         -DPORT=GTK \
#         -DENABLE_GAMEPAD=OFF \
#         -DENABLE_INTROSPECTION=OFF \
#         -DUSE_SOUP3=ON \
#         -DUSE_WPE_RENDERER=OFF \
#         -DUSE_LCMS=OFF \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -B build-gtk4 \
#         -G Ninja
#
#     ninja -C build-gtk4
#
# # ninja install
#     DESTDIR="${pkgdir}" ninja -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build-gtk4 install
#
#     install -Dm644 ${srcdir}/xguipro.csh ${pkgdir}/etc/profile.d/xguipro.csh
#     install -Dm644 ${srcdir}/xguipro.sh ${pkgdir}/etc/profile.d/xguipro.sh
# }
