# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: Tobias Powalowski <tpowa [at] archlinux [dot] org>
# Contributor: Ronald van Haren <ronald [at] archlinux [dot] org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_ia32_efi_in_arch_x64="1"

## "1" to enable EMU build, "0" to disable
_grub_emu_build="1"

[[ "${CARCH}" == "x86_64" ]] && _target_arch="x86_64"
[[ "${CARCH}" == "i686" ]] && _target_arch="i386"

_build_platforms="i386-pc ${_target_arch}-efi"
[[ "${CARCH}" == "x86_64" ]] && [[ "${_ia32_efi_in_arch_x64}" == "1" ]] && _build_platforms+=" i386-efi"
[[ "${_grub_emu_build}" == "1" ]] && _build_platforms+=" ${_target_arch}-emu"

pkgname="grub-git"
pkgver=2.06.r403.g7259d55ff
pkgrel=1
pkgdesc="GNU GRand Unified Bootloader (2)"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/grub/"
license=('GPL3')
depends=('device-mapper' 'freetype2' 'fuse2' 'gettext')
makedepends=('autogen' 'bdf-unifont' 'git' 'help2man' 'python' 'rsync' 'texinfo' 'ttf-dejavu')
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

provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
backup=('etc/default/grub'
        'etc/grub.d/40_custom')
install="${pkgname}.install"
source=("grub::git+https://git.savannah.gnu.org/git/grub.git"
        "grub-extras::git+https://git.savannah.gnu.org/git/grub-extras.git"
        "gnulib::git+https://git.savannah.gnu.org/git/gnulib.git"
        '0001-00_header-add-GRUB_COLOR_-variables.patch'
        '0002-10_linux-detect-archlinux-initramfs.patch'
        'grub.default'
        'sbat.csv')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '5dee6628c48eef79812bb9e86ee772068d85e7fcebbd2b2b8d1e19d24eda9dab'
            '8488aec30a93e8fe66c23ef8c23aefda39c38389530e9e73ba3fbcc8315d244d'
            '7df3f5cb5df7d2dfb17f4c9b5c5dedc9519ddce6f8d2c6cd43d1be17cecb65cb'
            '98b23d41e223bdc0a6e20bdcb3aa77e642f29b64081b1fd2f575314172fc89df')
 
prepare() {
    cd grub
    export GRUB_CONTRIB="$srcdir"/grub-extras
    export GNULIB_SRCDIR="$srcdir"/gnulib

    # Patch to enable GRUB_COLOR_* variables in grub-mkconfig.
    # Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
    patch -Np1 -i "${srcdir}/0001-00_header-add-GRUB_COLOR_-variables.patch"

    # Patch grub-mkconfig to detect Arch Linux initramfs images.
    patch -Np1 -i "${srcdir}/0002-10_linux-detect-archlinux-initramfs.patch"

    # Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme.
    sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

    # Modify grub-mkconfig behaviour to silence warnings FS#36275
    sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

    # Modify grub-mkconfig behaviour so automatically generated entries read 'Arch Linux' FS#33393
    sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

    # Pull in latest language files
    ./linguas.sh

	# Make translations reproducible.
	sed -i '1i /^PO-Revision-Date:/ d' po/*.sed

    # Remove lua module from grub-extras as it is incompatible with changes to grub_file_open   
    # http://git.savannah.gnu.org/cgit/grub.git/commit/?id=ca0a4f689a02c2c5a5e385f874aaaa38e151564e
    rm -rf "$srcdir"/grub-extras/lua

    ./bootstrap
}

pkgver() {
    cd grub
    git describe --long --tags | sed 's/^grub.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd grub
    export GRUB_CONTRIB="$srcdir"/grub-extras
    export GNULIB_SRCDIR="$srcdir"/gnulib

    for _arch in $_build_platforms; do
        mkdir "$srcdir"/grub/build_"$_arch"
        cd "$srcdir"/grub/build_"$_arch"
        unset CFLAGS
        unset CPPFLAGS
        unset CXXFLAGS
        unset LDFLAGS
        unset MAKEFLAGS

       ../configure PACKAGE_VERSION="${pkgver}-${pkgrel}" \
                --with-platform="${_arch##*-}" \
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
                --disable-werror
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

   sed -e "s/%PKGVER%/${pkgver}-${pkgrel}/" < "${srcdir}/sbat.csv" > "${pkgdir}/usr/share/grub/sbat.csv"

    # Tidy up
    find "$pkgdir"/usr/lib/grub \( -name '*.module' -o \
                                   -name '*.image' -o \
                                   -name 'kernel.exec' -o \
                                   -name 'gdb_grub' -o \
                                   -name 'gmodule.pl' \) -delete
}
