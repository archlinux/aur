# Maintainer: Miranda Collins <miranda@stellarx11.org>

pkgname=switchres
pkgver=2.2.2
pkgrel=1
pkgdesc="Modeline generation library and tool for CRT monitors and emulation"
arch=('x86_64' 'aarch64')
url="https://github.com/antonioginer/switchres"
license=('GPL-2.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'sdl2'        # linked
    'libdrm'      # dlopen()ed at runtime as libdrm.so
    'libx11'      # dlopen()ed at runtime as libX11.so
    'libxrandr'   # dlopen()ed at runtime as libXrandr.so
)
provides=('libswitchres.so')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') # run updpkgsums before publishing

prepare() {
    cd "${pkgname}-${pkgver}"

    # Upstream's makefile overwrites CPPFLAGS/LDFLAGS, so makepkg's hardening
    # flags (FORTIFY, full RELRO, BIND_NOW, ...) are silently dropped, the
    # shared library is linked without $(LIBS), leaving SDL2 symbols
    # unresolved, and the switchres CLI is linked without any LDFLAGS.
    sed -i \
        -e 's/^CPPFLAGS = -O3 /CPPFLAGS := $(CPPFLAGS) $(CXXFLAGS) /' \
        -e 's/^LDFLAGS = -shared$/HOST_LDFLAGS := $(LDFLAGS)\nLDFLAGS := -shared -Wl,--no-undefined $(HOST_LDFLAGS)/' \
        -e 's/-o $@\.$(DYNAMIC_LIB_EXT) $^$/& $(LIBS)/' \
        -e 's/ $(MAIN)\.cpp $(LIBS) -o $(STANDALONE)$/ $(MAIN).cpp $(HOST_LDFLAGS) $(LIBS) -o $(STANDALONE)/' \
        makefile
}

build() {
    cd "${pkgname}-${pkgver}"

    # 'all' builds the library, switchres.pc and the switchres CLI
    make all
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install
    # Upstream's install target ships only the library
    install -Dm755 switchres -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md switchres.ini -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
