# Maintainer: Otto Sabart <aur@seberm.com>
# Contributor: Olivier Medoc <o_medoc@yahoo.fr>

# Ref.: https://github.com/QubesOS/qubes-linux-utils/tree/master/archlinux

pkgbase=qubes-linux-utils
pkgname=(qubes-vm-utils qubes-vm-kernel-support)
pkgver=4.0.35
_gitname=${pkgname%-git*}
pkgrel=1
pkgdesc="Common Linux files for Qubes VM."
arch=("x86_64")
url="https://github.com/QubesOS/qubes-linux-utils"
license=('GPL')
groups=()
makedepends=(gcc make pkgconfig qubes-libvchan python-setuptools)
options=('staticlibs')
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=(
    "$_gitname::git+https://github.com/QubesOS/qubes-linux-utils.git?signed#tag=v${pkgver}"
    PKGBUILD-initcpio-hook.sh
    PKGBUILD-initcpio-install.sh
)

sha512sums=(
    'SKIP'
    '5d67ae7d8c7bf166d647b7f39485a5399d17464c2f7df3d831d9e8107e83a00e8cd2214a00a9b21a76fc1edc39e79d3fa81a8d912022bb4a3ae409250e46c1cb'
    '392f562e0f1a1bbd94958c5fa3c9746529d78f1ccafc7ef85d5b0d9f06d7ec66a30467f1cd6b869a9492864586b316751e864643f1c5b82becc377bd34701246'
)


build() {
    cd "${srcdir}/${_gitname}/"
    make all
}

package_qubes-vm-utils() {
    depends=(qubes-libvchan imagemagick python-pillow python-numpy)
    install=PKGBUILD-qubes-vm-utils.install

    cd "${srcdir}/${_gitname}/"
    make install DESTDIR=$pkgdir LIBDIR=/usr/lib SYSLIBDIR=/usr/lib SBINDIR=/usr/bin
}

package_qubes-vm-kernel-support() {
    depends=(qubes-libvchan mkinitcpio dkms grub)
    install=PKGBUILD-qubes-vm-kernel-support.install

    mkdir -p ${pkgdir}/usr/lib/initcpio/install/
    mkdir -p ${pkgdir}/usr/lib/initcpio/hooks/
    mkdir -p ${pkgdir}/usr/lib/qubes/
    mkdir -p ${pkgdir}/usr/bin/

    install -m 611 ${srcdir}/PKGBUILD-initcpio-install.sh ${pkgdir}/usr/lib/initcpio/install/qubes
    install -m 611 ${srcdir}/PKGBUILD-initcpio-hook.sh ${pkgdir}/usr/lib/initcpio/hooks/qubes

    cd "${srcdir}/${_gitname}/"
    install -m 755 dracut/full-dmroot/qubes_cow_setup.sh ${pkgdir}/usr/lib/qubes/qubes_cow_setup.sh

    make install-u2mfn DESTDIR="$pkgdir" -C kernel-modules
}
