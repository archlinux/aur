# Maintainer : Willem Mulder <14mRh4X0r+arch@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_platform=arm64
_target=aarch64-linux-gnu

pkgname="grub-efi-${_platform}"
pkgdesc='GNU GRand Unified Bootloader (2) - arm64 EFI boot support'
epoch=2
_tag='53c5000739db114c229fe69ec3d4b76b92441098' # git rev-parse grub-${_pkgver}
_gnulib_commit='be584c56eb1311606e5ea1a36363b97bddb6eed3'
_pkgver=2.06
pkgver=${_pkgver/-/}
pkgrel=2
url='https://www.gnu.org/software/grub/'
arch=('any')
license=('GPL3')
options=('!makeflags')
makedepends=('git' 'rsync' 'xz' 'freetype2' 'bdf-unifont' 'python' 'autogen'
             'gettext')
validpgpkeys=('E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
              'BE5C23209ACDDACEB20DB0A28C8189F1988C2166'  # Daniel Kiper <dkiper@net-space.pl>
              '95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>
source=("git+https://git.savannah.gnu.org/git/grub.git#tag=${_tag}?signed"
        "git+https://git.savannah.gnu.org/git/gnulib.git#commit=${_gnulib_commit}")
sha256sums=('SKIP'
            'SKIP')

# We need a cross-compiler if we're not on the target architecture
[[ "$_target" != "$CARCH-*" ]] && makedepends+=(${_target}-gcc)

_backports=(
        # fs/xfs: Fix unreadable filesystem with v4 superblock
        'a4b495520e4dc41a896a8b916a64eda9970c50ea'
)

_configure_options=(
        FREETYPE="pkg-config freetype2"
        BUILD_FREETYPE="pkg-config freetype2"
        --enable-mm-debug
        --enable-nls
        --enable-cache-stats
        --prefix="/usr"
        --bindir="/usr/bin"
        --sbindir="/usr/bin"
        --mandir="/usr/share/man"
        --infodir="/usr/share/info"
        --datarootdir="/usr/share"
        --sysconfdir="/etc"
        --program-prefix=""
        --with-bootdir="/boot"
        --with-grubdir="grub"
        --disable-silent-rules
        --disable-werror
)

prepare() {
        cd "${srcdir}/grub/"

        echo "Apply backports..."
        local _c
        for _c in "${_backports[@]}"; do
                git log --oneline -1 "${_c}"
                git cherry-pick -n "${_c}"
        done

        echo "Pull in latest language files..."
        ./linguas.sh

        echo "Run bootstrap..."
        ./bootstrap \
                --gnulib-srcdir="${srcdir}/gnulib/" \
                --no-git

        echo "Make translations reproducible..."
        sed -i '1i /^PO-Revision-Date:/ d' po/*.sed
}

build() {
        cd "${srcdir}/grub/"

        unset CFLAGS
        unset CPPFLAGS
        unset CXXFLAGS
        unset LDFLAGS
        unset MAKEFLAGS

        ./configure \
                --with-platform="efi" \
                --target="${_target}" \
                --disable-efiemu \
                --enable-boot-time \
                "${_configure_options[@]}"

        make ascii.h widthspec.h
        make -C grub-core
}

package() {
        cd "${srcdir}/grub/"

        make -C grub-core DESTDIR="${pkgdir}/" install

        rm -f "${pkgdir}/usr/lib/grub/${_platform}-efi"/*.module || true
        rm -f "${pkgdir}/usr/lib/grub/${_platform}-efi"/*.image || true
        rm -f "${pkgdir}/usr/lib/grub/${_platform}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
}
