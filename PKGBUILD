# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xguipro
pkgname=(xguipro-gtk3)
pkgver=0.6.4
pkgrel=0
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=('x86_64' 'aarch64' 'mips64' 'powerpc' 'powerpc64le')
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
groups=('hvml-git')
provides=(${pkgbase}  'xGUI-Pro')
conflicts=(${pkgbase})
replaces=()
depends=(webkit2gtk)
makedepends=(ccache
            cmake
            curl
            enchant
            glib2
            git
            gcc
            gtk3
            gperf
            libsoup
            libxml2
            ninja
            icu
            openssl
            pkgconf
            patch
            purc
            python
            ruby
            sqlite
            zlib)
optdepends=('webkit2gtk-hvml: Web content engine for GTK (HVML)')
backup=()
options=()
install=
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz"
        "001-fix.patch::https://github.com/HVML/xGUI-Pro/commit/a6e4022fa599e5e98d92d8d2feb56fe689e16f1a.patch")
sha256sums=('a1b004f9ec67a24ed8e6017575e3c3e425cff708d1efb76d0fc029e7cf826742'
            'e8f91ed115d08495020052cf75f6141e60c55703d7305322b4de2dddf37df54e')

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

    cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"
    patch -p1 < ${srcdir}/001-fix.patch
}

package_xguipro-gtk3() {
    pkgdesc+=" (gtk3)"
    conflicts+=(${pkgname%-git})

    cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"

# Ninja build
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=GTK \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DUSE_GTK4=OFF \
        -DUSE_SOUP2=ON \
        -B build-gtk3 \
        -G Ninja

    ninja -C build-gtk3

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build-gtk3 install

    install -Dm644 ${srcdir}/xguipro.csh ${pkgdir}/etc/profile.d/xguipro.csh
    install -Dm644 ${srcdir}/xguipro.sh ${pkgdir}/etc/profile.d/xguipro.sh
}
