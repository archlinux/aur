# Maintainer: Chris Chapman <chris [dot] chapman [at] aggiemail [dot] usu [dot] edu>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: Tobias Powalowski <tpowa [at] archlinux [dot] org>
# Contributor: Ronald van Haren <ronald [at] archlinux [dot] org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_ia32_efi_in_arch_x64="1"

## "1" to enable EMU build, "0" to disable
_grub_emu_build="1"

## "1" to enable XEN build, "0" to disable
_grub_xen_build="1"

[[ "${CARCH}" == "x86_64" ]] && _target_arch="x86_64"
[[ "${CARCH}" == "i686" ]] && _target_arch="i386"

_build_platforms="i386-pc ${_target_arch}-efi"
[[ "${CARCH}" == "x86_64" ]] && [[ "${_ia32_efi_in_arch_x64}" == "1" ]] && _build_platforms+=" i386-efi"
[[ "${_grub_emu_build}" == "1" ]] && _build_platforms+=" ${_target_arch}-emu"
[[ "${_grub_xen_build}" == "1" ]] && _build_platforms+=" i386-xen i386-xen_pvh"
[[ "${_grub_xen_build}" == "1" ]] && [[ "${CARCH}" == "x86_64" ]] && _build_platforms+=" x86_64-xen"

pkgname="grub-xen-git"
pkgver=2.04.r141.ge7b8856f8
pkgrel=1
pkgdesc="GNU GRand Unified Bootloader (2) with Xen platform support"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/grub/"
license=('GPL3')
depends=('device-mapper' 'freetype2' 'fuse2' 'gettext')
makedepends=('autogen' 'bdf-unifont' 'git' 'help2man'
             'python' 'rsync' 'texinfo' 'ttf-dejavu')
optdepends=('dosfstools: For grub-mkrescue FAT FS and EFI support'
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'mtools: For grub-mkrescue FAT FS support'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems')

if [[ "${_grub_emu_build}" == "1" ]]; then
    depends+=('sdl')
    makedepends+=('libusb')
    optdepends+=('libusb: For grub-emu USB support')
fi

provides=('grub')
conflicts=('grub' 'grub-git')
backup=('etc/default/grub'
        'etc/grub.d/40_custom')
install="${pkgname}.install"
source=("grub::git+https://git.savannah.gnu.org/git/grub.git"
        "grub-extras::git+https://git.savannah.gnu.org/git/grub-extras.git"
        "gnulib::git+https://git.savannah.gnu.org/git/gnulib.git"
        '10_linux-detect-archlinux-initramfs.patch'
        '20_linux_xen-detect-archlinux-initramfs.patch'
        '20_linux_xen-detect-x86-xen-dom0-linux-list.patch'
        '20_linux_xen-load-ucode-as-separate-multiboot-module.patch'
        '20_linux_xen-remove-grub-submenu-for-multiple-xen-versions.patch'
        '20_linux_xen-select-gzipped-xen-only.patch'
        '20_linux_xen-support-xen-realmode-with-grub-efi-boot.patch'
        'add-GRUB_COLOR_variables.patch'
        'grub.default')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '171415ab075d1ac806f36c454feeb060f870416f24279b70104bba94bd6076d4'
            'aa2f81e74c9eb09bfd0eced093ec0f38409b0001bd20e2cad9e2d9275c8e73c4'
            '432ec7cda9d1a0c8e203d4cfd8ce8f046b967d2330a172ccbedca5345e5e7d08'
            '0ac60de9cca4000825c34f601e1a135e01bda85af6e4bcd75751967c0cc5c00d'
            'aa1edfce6193146def470ae61129af3cbdc20638419a37e7e72f543281cb9d53'
            '7cec8e548a8cc6bd7dd26e7b81c1e43bfe270e89bff05382683ddbeeccf218bc'
            'f0ccc146a3af7ecc14f5b1adbb0e0e5d03953839b336541741ba16737593e6ef'
            'a5198267ceb04dceb6d2ea7800281a42b3f91fd02da55d2cc9ea20d47273ca29'
            'bd464f665372ee5211fe825153f31d3d499589cb3e7e25070340ddc0602727c1')
 
prepare() {
    cd grub

    # Patch grub-mkconfig to detect Arch Linux initramfs images.
    patch -Np1 -i "$srcdir"/10_linux-detect-archlinux-initramfs.patch
    patch -Np1 -i "$srcdir"/20_linux_xen-detect-archlinux-initramfs.patch

    # Patch grub-mkconfig to detect Dom0-ready Arch Linux kernels.
    patch -Np1 -i "$srcdir"/20_linux_xen-detect-x86-xen-dom0-linux-list.patch

    # Patch grub-mkconfig to load microcode as separate module that Xen will scan.
    patch -Np1 -i "$srcdir"/20_linux_xen-load-ucode-as-separate-multiboot-module.patch

    # Patch grub-mkconfig to remove superfluous submenu for selecting Xen versions.
    patch -Np1 -i "$srcdir"/20_linux_xen-remove-grub-submenu-for-multiple-xen-versions.patch

    # Patch grub-mkconfig to select gzipped Xen kernels only.
    patch -Np1 -i "$srcdir"/20_linux_xen-select-gzipped-xen-only.patch

    # Patch grub-mkconfig to support GRUB EFI boot.
    patch -Np1 -i "$srcdir"/20_linux_xen-support-xen-realmode-with-grub-efi-boot.patch

    # Patch to enable GRUB_COLOR_* variables in grub-mkconfig.
    # Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
    patch -Np1 -i "$srcdir"/add-GRUB_COLOR_variables.patch

    # Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme.
    sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

    # Modify grub-mkconfig behaviour to silence warnings FS#36275
    sed 's| ro | rw |g' -i util/grub.d/{10_linux,20_linux_xen}.in

    # Modify grub-mkconfig behaviour so automatically generated entries read 'Arch Linux' FS#33393
    sed 's|GNU/Linux|Linux|' -i util/grub.d/{10_linux,20_linux_xen}.in

    # Pull in latest language files
    ./linguas.sh

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

    # Undefined references to __stack_chk_fail
    CFLAGS=${CFLAGS/-fstack-protector-strong}

    # Undefined references to _GLOBAL_OFFSET_TABLE_
    CFLAGS=${CFLAGS/-fno-plt}

    ./bootstrap

    for _arch in $_build_platforms; do
        mkdir "$srcdir"/grub/build_"$_arch"
        cd "$srcdir"/grub/build_"$_arch"

        # Explicitly set ac_cv_header_sys_sysmacros_h
        # https://savannah.gnu.org/bugs/index.php?55520

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
                --enable-nls \
                --disable-silent-rules \
                --disable-werror \
                CPPFLAGS="$CPPFLAGS -O2" \
                ac_cv_header_sys_sysmacros_h=yes
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
