# Maintainer: Ax333l <main [at] axelen [dot] xyz>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: Tobias Powalowski <tpowa [at] archlinux [dot] org>
# Contributor: Ronald van Haren <ronald [at] archlinux [dot] org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
# _ia32_efi_in_arch_x64="1"

[ -z "$GRUB_ENABLE_NLS" ] && NLS_OPT="--disable-nls" || NLS_OPT="--enable-nls"

## "1" to enable EMU build, "0" to disable
# _grub_emu_build="0"
_build_platforms="x86_64-efi"
# [[ "${CARCH}" == "i686" ]] && _target_arch="i386"

# _build_platforms="i386-pc ${_target_arch}-efi"
# [[ "${CARCH}" == "x86_64" ]] && [[ "${_ia32_efi_in_arch_x64}" == "1" ]] && _build_platforms+=" i386-efi"
# [[ "${_grub_emu_build}" == "1" ]] && _build_platforms+=" ${_target_arch}-emu"

_pkgname="grub"
pkgname="${_pkgname}-improved-luks2-git"
pkgver=2.06.r499.ge67a551a4
pkgrel=1
pkgdesc="GNU GRand Unified Bootloader (2) with Argon2 and better LUKS2 support"
arch=('x86_64')
url="https://www.gnu.org/software/grub/"
license=('GPL3' 'CC0')
depends=('device-mapper' 'freetype2' 'fuse2' 'gettext')
makedepends=('autogen' 'bdf-unifont' 'git' 'help2man'
             'python' 'rsync' 'texinfo' 'ttf-dejavu'
             'bison')
optdepends=('dosfstools: For grub-mkrescue FAT FS and EFI support'
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'mtools: For grub-mkrescue FAT FS support'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/default/grub'
        'etc/grub.d/40_custom')
install="${pkgname}.install"
source=("grub::git+https://git.savannah.gnu.org/git/grub.git"
        "grub-extras::git+https://git.savannah.gnu.org/git/grub-extras.git"
        "gnulib::git+https://git.savannah.gnu.org/git/gnulib.git"
        'argon_1.patch'
        'argon_2.patch'
        'argon_3.patch'
        'argon_4.patch'
        'argon_5.patch'
        'grub-install_luks2.patch'
        'add-GRUB_COLOR_variables.patch'
        'detect-archlinux-initramfs.patch'
        'grub.default')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5dee6628c48eef79812bb9e86ee772068d85e7fcebbd2b2b8d1e19d24eda9dab'
            '580a81b00088773d554832b0d74c85bf16fec37728802973c45993bcb97cd7d5'
            '791fadf182edf8d5bee4b45c008b08adce9689a9624971136527891a8f67d206')

prepare() {
    cd grub

    # Patch to enable GRUB_COLOR_* variables in grub-mkconfig.
    # Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
    patch -Np1 -i "$srcdir"/add-GRUB_COLOR_variables.patch

    # Patch grub-mkconfig to detect Arch Linux initramfs images.
    patch -Np1 -i "$srcdir"/detect-archlinux-initramfs.patch

    # argon2
    patch -Np1 -i "$srcdir"/argon_1.patch
    patch -Np1 -i "$srcdir"/argon_2.patch
    patch -Np1 -i "$srcdir"/argon_3.patch
    patch -Np1 -i "$srcdir"/argon_4.patch
    patch -Np1 -i "$srcdir"/argon_5.patch

    # make grub-install work with luks2
    patch -Np1 -i "$srcdir"/grub-install_luks2.patch

    # Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme.
    sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

    # Modify grub-mkconfig behaviour to silence warnings FS#36275
    sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

    # Modify grub-mkconfig behaviour so automatically generated entries read 'Arch Linux' FS#33393
    sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

    # Pull in latest language files
    [ ! -z "$GRUB_ENABLE_NLS" ] && ./linguas.sh

    # Remove lua module from grub-extras as it is incompatible with changes to grub_file_open
    # http://git.savannah.gnu.org/cgit/grub.git/commit/?id=ca0a4f689a02c2c5a5e385f874aaaa38e151564e
    rm -rf "$srcdir"/grub-extras/lua
}

pkgver() {
    cd grub
    git describe --long --tags | sed 's/^grub.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd grub
    export GRUB_CONTRIB="$srcdir"/grub-extras
    export GNULIB_SRCDIR="$srcdir"/gnulib

    # Undefined references to _GLOBAL_OFFSET_TABLE_
    CFLAGS=${CFLAGS/-fno-plt}

    ./bootstrap

    for _arch in $_build_platforms; do
        mkdir "$srcdir"/grub/build_"$_arch"
        cd "$srcdir"/grub/build_"$_arch"

        # * _FORTIFY_SOURCE requires compiling with optimization warnings
        #   become errors due to a -Werror added during ./configure tests.
        #   This results in an incorrect configuration and only by adding -O2
        #   to CPPFLAGS does this problem seem to be worked around.
        ../configure --with-platform="${_arch##*-}" \
                --target="${_arch%%-*}"  \
                --prefix="/usr" \
                --sbindir="/usr/bin" \
                --sysconfdir="/etc" \
                --enable-boot-time \
                --enable-cache-stats \
                --enable-device-mapper \
                --enable-grub-mkfont \
                --enable-grub-mount \
                --enable-mm-debug \
                $NLS_OPT \
                --disable-silent-rules \
                --disable-werror \
                CPPFLAGS="$CPPFLAGS -O2"
        make
    done
}

package() {
    cd grub

    for _arch in $_build_platforms; do
        cd "$srcdir"/grub/build_"$_arch"
        make DESTDIR="$pkgdir" bashcompletiondir=/usr/share/bash-completion/completions install
    done

    # Install /etc/default/grub (used by grub-mkconfig)
    install -D -m0644 "$srcdir"/grub.default "$pkgdir"/etc/default/grub

    # Tidy up
    find "$pkgdir"/usr/lib/grub \( -name '*.module' -o \
                                   -name '*.image' -o \
                                   -name 'kernel.exec' -o \
                                   -name 'gdb_grub' -o \
                                   -name 'gmodule.pl' \) -delete
}
