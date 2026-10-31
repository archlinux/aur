# Maintainer: coffee <catheadcoffee@gmail.com>
# bpfcompat — eBPF compatibility evidence and CI gate.
#
# Built from source on purpose. The released CLI is a static Go binary, but the
# guest-side validator is a small C program linked against libbpf, and upstream
# publishes it only for amd64 and statically linked. Arch ships neither libbpf.a
# nor libzstd.a, so `LIBBPF_LINK_MODE=static` cannot be reproduced here: the
# validator is linked dynamically instead, which is the normal Arch convention and
# also makes the package rebuildable on aarch64.
#
# Layout:
#   /usr/bin/bpfcompat                        CLI (static Go, CGO off)
#   /usr/lib/bpfcompat/bpfcompat-validator    guest-side validator (C)
#   /usr/share/bpfcompat/{matrices,suites}    reference matrices/suites
#
# Why arch-validator-path.patch exists:
#   internal/runner/runner.go resolves the validator by os.Stat() over
#     $BPFCOMPAT_VALIDATOR_BIN
#     /usr/local/libexec/bpfcompat/bpfcompat-validator
#     /usr/libexec/bpfcompat/bpfcompat-validator
#     validator/c-libbpf/bin/bpfcompat-validator   (repo-relative)
#   /usr/libexec is outside the FHS paths Arch uses (namcap: "ELF file outside of
#   a valid path"). The patch appends /usr/lib/bpfcompat/bpfcompat-validator to
#   that list, so the package installs to the Arch-appropriate location and
#   `bpfcompat test` still finds the validator with no environment variable.

pkgname=bpfcompat
_tag=v0.3.7
# GitHub 的归档根目录用的是 tag 原名（v0.4.0-rc.4 -> bpfcompat-0.4.0-rc.4），
# 而 pkgver 去掉了连字符，所以不能拿 $pkgname-$pkgver 当目录名。
_srcdir="bpfcompat-${_tag#v}"
pkgver=0.3.7
pkgrel=3
pkgdesc="eBPF compatibility evidence and CI gate: boots real kernels in VMs to validate BPF objects and loaders"
arch=('x86_64' 'aarch64')
url="https://github.com/Kernel-Guard/bpfcompat"
license=('Apache-2.0')
depends=(
    'glibc'
    'libbpf'    # validator: BPF object loading (its NEEDED already covers libelf + zlib)
    'libelf'    # validator: ELF parsing
)
makedepends=(
    'go'
    'pkgconf'   # the validator Makefile runs pkg-config for libbpf cflags
    'gcc'       # the validator is C
)
optdepends=(
    # Arch splits QEMU by target: the *package* is qemu-system-x86, which is what
    # provides the qemu-system-x86_64 binary bpfcompat execs. Same for aarch64.
    'qemu-system-x86: QEMU backend for x86_64 guest kernels (provides qemu-system-x86_64)'
    'qemu-system-aarch64: QEMU backend for aarch64 guest kernels (provides qemu-system-aarch64)'
    'qemu-img: disk image conversion used by the VM flows (provides qemu-img)'
    'virtme-ng: boot kernels through vng instead of a hand-rolled initramfs (provides vng)'
    'firecracker: Firecracker microVM backend (provides firecracker)'
    'busybox: minimal initramfs for VM boots'
    'cpio: initramfs assembly'
)
# Prints the optional setcap command (see bpfcompat.install). Capabilities cannot
# ship inside the package: pacman does not store security.capability, and the file
# is replaced on every upgrade anyway.
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
        "arch-validator-path.patch")
sha256sums=('e0e00f4d4f4614998b61ce95f6749cea84ae8c3710411eeb9c34d5f5b2455a2f'
            '5be2c7f80561b6da6125b2900a7a13da061649e05e455534f7f21f151bda9922')

prepare() {
    cd "$_srcdir"
    patch -Np1 -i "$srcdir/arch-validator-path.patch"
}

build() {
    cd "$_srcdir"

    # -mod=vendor: the tree ships vendor/, so no module downloads.
    # -buildvcs=false: a release tarball has no .git to stamp.
    # CGO_ENABLED=0: the CLI has no cgo imports, giving a fully static binary
    # (verified: `ldd bin/bpfcompat` -> "not a dynamic executable").
    export GOFLAGS="-mod=vendor -buildvcs=false"
    export CGO_ENABLED=0

    # makepkg exports its own LDFLAGS (-Wl,-O1,--sort-common,...), while upstream's
    # Makefile uses `LDFLAGS ?=` for the Go -X version stamp. The collision makes
    # `go build -ldflags` receive linker flags and die with
    #     flag provided but not defined: -Wl,-O1,--sort-common,...
    # so drop it for the Go step and let the Makefile's own default apply.
    unset LDFLAGS CGO_LDFLAGS

    # A tarball has no .git, so the Makefile's `git describe` fallback would stamp
    # 0.1.0-dev; pass the real tag. $_tag keeps upstream's spelling
    # (v0.4.0-rc.1), which $pkgver cannot: Arch pkgver may not contain '-'.
    make build VERSION="$_tag"

    # makepkg strips *static* binaries with `strip -S`, which keeps .symtab, so
    # namcap still reports "is unstripped". Strip all of it: 23.9 MB -> 16.1 MB.
    # Safe for Go: backtraces read the runtime's pclntab, not .symtab, and
    # `bin/bpfcompat version` was verified to work afterwards.
    strip -s bin/bpfcompat

    # Guest-side C validator. Its Makefile links through LIBBPF_LIBS only, so
    # makepkg's LDFLAGS never reach it; add the hardening explicitly:
    #   -fPIE -pie            PIE (namcap: "lacks PIE")
    #   -Wl,-z,relro,-z,now   full RELRO (namcap: "lacks FULL RELRO")
    #   -Wl,--as-needed       don't record libz/libzstd as NEEDED when libbpf
    #                         already pulls them in (namcap: "unused shared library")
    # CFLAGS keeps upstream's -Wall -Wextra -std=c11 on top of the distro flags,
    # which would otherwise override the Makefile's `CFLAGS ?=`.
    make -C validator/c-libbpf clean all LIBBPF_LINK_MODE=dynamic \
        CFLAGS="${CFLAGS:--O2} -Wall -Wextra -std=c11 -fPIE" \
        LIBBPF_LIBS="-pie -Wl,-z,relro,-z,now -Wl,--as-needed -lbpf -lelf -lz -lzstd"
}

check() {
    cd "$_srcdir"
    ./bin/bpfcompat version
    ./validator/c-libbpf/bin/bpfcompat-validator --help > /dev/null
}

package() {
    cd "$_srcdir"

    install -Dm755 bin/bpfcompat "$pkgdir/usr/bin/bpfcompat"

    # Path added by arch-validator-path.patch, so the CLI auto-discovers it.
    install -Dm755 validator/c-libbpf/bin/bpfcompat-validator \
        "$pkgdir/usr/lib/bpfcompat/bpfcompat-validator"

    # Example matrices/suites (~116 KiB). Upstream's installer ships neither, but
    # every test/suite run needs a matrix, so the reference ones are useful:
    #   bpfcompat profile list --matrix /usr/share/bpfcompat/matrices/dev-one.yaml
    install -d "$pkgdir/usr/share/bpfcompat"
    cp -r matrices suites "$pkgdir/usr/share/bpfcompat/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
