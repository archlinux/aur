# Maintainer: Dom <...>

pkgname=nuttx-git
pkgver=r62882.g4ebc8a7291d
pkgrel=1
pkgdesc='Apache NuttX RTOS development source tree with integrated applications (Git)'
arch=('any')
url='https://nuttx.apache.org/'
license=('Apache-2.0')

depends=(
    'bison'
    'flex'
    'gettext'
    'texinfo'
    'ncurses'
    'gperf'
    'automake'
    'libtool'
    'pkgconf'
    'gmp'
    'libmpc'
    'mpfr'
    'libisl'
    'elfutils'
    'expat'
    'picocom'
    'uboot-tools'
    'util-linux'
    'vim'
    'genromfs'
    'kconfig-frontends-git'
)

optdepends=(
    'aarch64-linux-gnu-gcc: AArch64 Linux cross compiler'
    'arm-none-eabi-gcc: ARM bare-metal cross compiler'
    'lm32-elf-gcc: LatticeMico32 cross compiler'
    'nds32le-elf-gcc: Andes NDS32 little-endian cross compiler'
    'or1k-elf-gcc: OpenRISC cross compiler'
    'riscv64-elf-gcc: RISC-V 64-bit bare-metal cross compiler'
    'riscv64-linux-gnu-gcc: RISC-V 64-bit Linux cross compiler'
)

source=(
    'nuttx::git+https://github.com/apache/nuttx.git'
    'apps::git+https://github.com/apache/nuttx-apps.git'
)

b2sums=('SKIP'
        'SKIP')

pkgver() {
    cd nuttx
    printf 'r%s.g%s\n' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    local _dest="$pkgdir/usr/share/nuttx"

    install -dm755 "$_dest"
    install -dm755 "$_dest/apps"

    rm -r nuttx/.github
    
    git -C nuttx archive HEAD | bsdtar -x -f - --exclude '.git*' -C "$_dest"
    git -C apps archive HEAD | bsdtar -x -f - --exclude ".git*" -C "$_dest/apps"
}
