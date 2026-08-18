# Maintainer: lee <lee@yizhisec.com>
#
# Rendered by .github/workflows/release.yml — 0.2.0 / 3942ecfba6f53660f1603f67003ffcf2f99fddcff7567e03aa6de8b48749bd5d are
# substituted with the tag and the checksum of the published release's
# auto-generated source tarball.
#
# Built from source rather than shipped as a prebuilt -bin package: inm links
# directly against spice-gtk and gpui's native Vulkan/Wayland/X11 bindings,
# which makes cross-compiling a portable binary far riskier than just
# building on the machine that's about to run it — and the build itself only
# takes a minute or two.

pkgname=inm
pkgver=0.2.0
pkgrel=2
pkgdesc="Native manager for Incus virtual machines with the SPICE console embedded in the app"
arch=('x86_64')
url="https://github.com/loyalpartner/inm"
license=('MIT')
depends=('spice-gtk' 'vulkan-icd-loader' 'libxkbcommon-x11')
makedepends=('cargo' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3942ecfba6f53660f1603f67003ffcf2f99fddcff7567e03aa6de8b48749bd5d')

build() {
    cd "${pkgname}-${pkgver}"
    # The `ring` crate compiles part of itself as C/assembly via the `cc`
    # crate, which picks up $CFLAGS automatically. Arch's default
    # -flto=auto there makes that C code come out as GCC LTO bitcode
    # instead of real object code, which rust-lld can't read — every
    # ring_core_* symbol then looks "undefined" at the final link, even
    # though the archive is right there. Rust has its own LTO knobs (Cargo
    # profile settings); this flag was never meant for it. Verified this is
    # the actual cause, not a guess: stripping it from CFLAGS/CXXFLAGS/
    # LDFLAGS turns a build that fails 100% of the time in a clean chroot
    # into one that succeeds 100% of the time, same source, same lockfile.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    export LDFLAGS="${LDFLAGS//-flto=auto/}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
