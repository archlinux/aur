# Maintainer: mcpp-community <x.d2learn.org@gmail.com>
#
# mcpp-m — mcpp built from source, bootstrapped with the prebuilt `mcpp-bin`.
# mcpp is self-hosting: the mcpp-bin compiler builds this release's own
# source (the same `mcpp build --target <arch>-linux-musl` path release.yml
# ships). For the prebuilt-only package, install `mcpp-bin` instead.
#
# NB: the AUR/official name `mcpp` is taken by Matsui's C preprocessor
# (extra/mcpp), so this package is `mcpp-m`. It still installs the `mcpp`
# command at /usr/bin/mcpp, hence the conflict with that preprocessor.
# See scripts/aur/README.md.

pkgname=mcpp-m
pkgver=0.0.65
pkgrel=1
pkgdesc="Modern C++ build & package management tool (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/mcpp-community/mcpp"
license=('Apache-2.0')
# mcpp/xlings are statically linked; git is used for package-index sync.
depends=('git')
# mcpp-bin is the bootstrap compiler; it also supplies the bundled xlings we
# ship at runtime. git is needed for toolchain/index sync during the build.
makedepends=('mcpp-bin' 'git')
# mcpp-bin = same tool (mutually exclusive); mcpp = the C preprocessor that
# also owns /usr/bin/mcpp.
conflicts=('mcpp-bin' 'mcpp')
# We strip the built ELF ourselves; don't let makepkg re-strip the vendored
# xlings binary (a prebuilt third-party artifact).
options=('!strip')

source=("mcpp-${pkgver}.tar.gz::https://github.com/mcpp-community/mcpp/archive/v${pkgver}.tar.gz"
        "mcpp.sh")
sha256sums=('07f8233d3f18565c52607816a82c9facda3a7ed11c67d3772e42bd84cb54476a'
            'SKIP')

# mcpp downloads its own pinned toolchain (gcc/ninja/patchelf) into the build
# sandbox — it does not use the host gcc. This needs network access at build
# time, like the upstream release build.
build() {
    cd "${srcdir}/mcpp-${pkgver}"

    case "$CARCH" in
        x86_64)  _target=x86_64-linux-musl  ;;
        aarch64) _target=aarch64-linux-musl ;;
        *) echo "unsupported CARCH: $CARCH" >&2; return 1 ;;
    esac

    # Bootstrap with mcpp-bin's real binary (not its /usr/bin wrapper, which
    # would force MCPP_HOME into the user's home). Keep the build sandbox
    # self-contained under $srcdir and reuse mcpp-bin's bundled xlings.
    export MCPP_HOME="${srcdir}/.mcpp-home"
    export MCPP_VENDORED_XLINGS="/opt/mcpp/registry/bin/xlings"

    /opt/mcpp/bin/mcpp build --target "$_target"

    _artifact=$(find "target/${_target}" -type f -name mcpp | head -1)
    test -n "$_artifact" || { echo "build produced no mcpp binary" >&2; return 1; }
    file "$_artifact" | grep -q 'statically linked'
    # Debug info on a static ELF balloons it ~7×; strip with the native tool.
    strip "$_artifact"

    # Stash artifact + the vendored xlings for package() (which has no /opt
    # guarantees beyond makedepends being installed).
    install -Dm755 "$_artifact" "${srcdir}/stage/bin/mcpp"
    install -Dm755 /opt/mcpp/registry/bin/xlings "${srcdir}/stage/registry/bin/xlings"
}

package() {
    # Same /opt + wrapper layout as mcpp-bin (see scripts/aur/README.md for
    # why the per-user wrapper exists instead of a /usr/bin symlink).
    install -Dm755 "${srcdir}/stage/bin/mcpp"            "${pkgdir}/opt/mcpp/bin/mcpp"
    install -Dm755 "${srcdir}/stage/registry/bin/xlings" "${pkgdir}/opt/mcpp/registry/bin/xlings"

    install -Dm755 "${srcdir}/mcpp.sh" "${pkgdir}/usr/bin/mcpp"

    install -Dm644 "${srcdir}/mcpp-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/mcpp-${pkgver}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
