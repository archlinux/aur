# Maintainer: Hayden Parker <hayden@bounce.chat>
pkgname=bounce
pkgver=0.3.0
pkgrel=1
pkgdesc="A metadata-protecting distributed group chat application"
arch=('x86_64')
url="https://github.com/bounce-chat/bounce"
license=('MIT')
conflicts=('bounce-bin' 'bounce-git')
makedepends=('git' 'go' 'rust')
# namcap reports the libx* entries as "included, but may not be needed" and it
# is wrong: GLFW dlopen()s them, so they are absent from DT_NEEDED but required
# at runtime. Do not prune them on namcap's advice. The authoritative list is
# `strings -a bounce | grep -E '^lib(X|xkb).*\.so'`, mapped through pacman -Qoq.
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs' 'libglvnd' 'wayland'
         'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxkbcommon'
         'libxrandr' 'libxrender' 'libxxf86vm')

# !lto is load-bearing, not a preference.
#
# go-arti links a Rust staticlib that compiles zstd, SQLite and liblzma from C
# source through the `cc` crate, and `cc` picks CFLAGS up out of the
# environment. With makepkg's default `lto` option those C sources are built
# as GCC LTO objects: bitcode in .gnu.lto_* sections with no symbols in the
# ELF symbol table. rustc then bundles them into libarti_ffi.a with an archive
# index that consequently lists none of them, so ld never pulls the members in
# and the cgo link dies with several hundred "undefined reference to `ZSTD_*'"
# (and friends). The archive looks correct to `ar t` and `nm`, which is what
# makes this one hard to spot -- `nm --print-armap libarti_ffi.a | grep ZSTD_`
# returning nothing is the tell.
#
# !debug because Go's DWARF does not produce a useful -debug split package.
options=(!debug !lto)

# The go-arti submodule is a second source rather than a recursive clone:
# makepkg only clones what is in source(), and the AUR requires every input to
# be declared. prepare() then points the submodule at the local clone so
# `submodule update` checks out the exact commit bounce pins, rather than
# whatever go-arti's default branch happens to be.
#
# Only bounce carries a #tag fragment. go-arti deliberately does not: the
# submodule gitlink in the tagged bounce tree is what pins it, so a tag here
# would be a second, redundant pin that could disagree with the first.
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}-go-arti::git+https://github.com/${pkgname}-chat/go-arti.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"

    # Rewrite the submodule URL to the sibling clone makepkg already made.
    #
    # That puts the submodule on the `file` transport, which git 2.38.1 stopped
    # allowing for indirect fetches (CVE-2022-39253): protocol.file.allow
    # defaults to `user`, permitting local paths only for commands invoked
    # directly, and a submodule clone is not one. Nothing to do with what
    # go-arti contains -- an https submodule URL needs no such flag, and this
    # one does purely because the AUR wants every input declared in source().
    git submodule init
    git config submodule.go-arti.url "${srcdir}/${pkgname}-go-arti"
    git -c protocol.file.allow=always submodule update

    # Fetch dependencies here so build() needs no network, per Arch policy.
    go mod download
    cd go-arti/rust/arti-ffi && cargo fetch
}

build() {
    cd "${srcdir}/${pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    # Arti is Rust; the Go toolchain cannot invoke cargo, so the static library
    # has to exist before the first `go build`. It lands in
    # go-arti/lib/linux_amd64/, which is where the #cgo LDFLAGS in
    # go-arti/internal/arti/cgo.go look -- no -extldflags needed.
    #
    # Build it in place inside the submodule checkout. Copying the sibling
    # clone over the submodule instead would both nest a duplicate tree and
    # discard the pinned commit.
    make -C go-arti lib

    go build -tags migrated_fynedo -ldflags "-linkmode=external" -o "${pkgname}" .
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "pkg/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "ui/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
