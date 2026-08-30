# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=linsys2
pkgver=r93.20260830.28da475
pkgrel=1
pkgdesc='Build, debug, and run Windows programs on Linux with the full MSYS2 ecosystem. No VM. No dual-boot. No containers.'
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
url='https://github.com/wszqkzqk/LinSYS2'
license=('GPL-2.0-or-later')
depends=('bash' 'bubblewrap' 'coreutils' 'curl' 'gawk' 'gettext' 'glibc' 'gnupg' 'gpgme' 'grep' 'libarchive' 'openssl' 'which' 'bzip2' 'xz' 'zstd' 'wine' 'python')
makedepends=('git' 'meson' 'ninja' 'gcc' 'patch')
source=("${pkgname}::git+${url}.git"
        "git+https://github.com/msys2/msys2-pacman.git"
        "git+https://github.com/msys2/MSYS2-keyring.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git submodule init
    git submodule set-url subprojects/msys2-pacman "$srcdir"/msys2-pacman
    git submodule set-url vendor/msys2-keyring "$srcdir"/MSYS2-keyring
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${pkgname}"
    # arch-meson's --prefix=/usr comes first; this later one wins and keeps
    # the toolchain in its private home. The other Arch flags still apply.
    arch-meson build --prefix=/usr/lib/linsys2-pacman
    meson compile -C build
}

check() {
    cd "${pkgname}"
    meson test -C build unit
}

package() {
    cd "${pkgname}"
    DESTDIR="${pkgdir}" meson install -C build
    python -m compileall -q -o 0 -o 1 --invalidation-mode checked-hash \
        -s "${pkgdir}" -p / "${pkgdir}"/usr/lib/linsys2
}
