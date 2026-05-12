# Maintainer: Ash <ash8820@proton.me>

pkgname=solara-kernel-headers
pkgver=7.0.6
pkgrel=1
arch=('x86_64')
url="https://github.com/celestia-foundation/solara"
license=('GPL-2.0-only')
pkgdesc="Headers and scripts for building modules for the Solara Linux Kernel"
options=('!strip' '!debug' '!lto')

# Must match the kernel package's pkgbase
_pkgbase="solara-kernel"
_srcname="cachyos-${pkgver}-1"

source=(
    "https://github.com/CachyOS/linux/releases/download/${_srcname}/${_srcname}.tar.gz"
    "config"
)
b2sums=('SKIP' 'SKIP')

prepare() {
    cd "$_srcname"
    cp ../config .config
    make prepare
    yes "" | make config >/dev/null
    make -s kernelrelease > version
}

build() {
    cd "$_srcname"
    make -j"$(nproc)" all
}

package() {
    cd "$_srcname"

    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux

    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile

    cp -t "$builddir" -a scripts
    ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
    if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
        install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
    fi

    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include

    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

    if compgen -G "rust/*.rmeta" >/dev/null; then
        install -Dt "$builddir/rust" -m644 rust/*.rmeta
    fi
    if compgen -G "rust/*.so" >/dev/null; then
        install -Dt "$builddir/rust" rust/*.so
    fi

    make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install link=

    for arch in "$builddir"/arch/*/; do
        [[ $arch = */x86/ ]] || rm -r "$arch"
    done

    rm -r "$builddir/Documentation"
    find -L "$builddir" -type l -delete
    find "$builddir" -type f -name '*.o' -delete

    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/${_pkgbase}"
}
