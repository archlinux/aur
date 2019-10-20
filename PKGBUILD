# Maintainer: Filippo Squillace <feel dot sqoox at gmail dot com>
# More details on how to change this file:
# https://wiki.archlinux.org/index.php/PKGBUILD
# https://wiki.archlinux.org/index.php/Creating_packages
# https://wiki.archlinux.org/index.php/Arch_User_Repository#Submitting_packages

HOST_ARCH=$(uname -m)
if [ $HOST_ARCH == "i686" ] || [ $HOST_ARCH == "i386" ]
then
    NORM_ARCH="x86"
elif [ $HOST_ARCH == "x86_64" ]
then
    NORM_ARCH="x86_64"
elif [[ $HOST_ARCH =~ .*(arm).* ]]
then
    NORM_ARCH="arm"
fi

pkgname=junest-git
pkgver=6.0.10
pkgrel=1
pkgdesc="The Arch Linux based distro that runs upon any Linux distros without root access"
arch=('any')
url="http://fsquillace.github.io/junest-site/"
license=('GPL')
groups=()
depends=('pacman')
makedepends=('git' 'sed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=junest.install

MAIN_REPO=https://s3-eu-west-1.amazonaws.com/${pkgname%-git}-repo
PROOT_LINK=${MAIN_REPO}/proot
QEMU_LINK=$MAIN_REPO/qemu
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

source=('junest::git+https://github.com/fsquillace/junest.git#branch=master' "$PROOT_LINK/proot-x86_64" "$PROOT_LINK/proot-x86" "$PROOT_LINK/proot-arm")
source_x86_64=("${QEMU_LINK}/x86_64/qemu-x86_64-static-x86" "${QEMU_LINK}/x86_64/qemu-x86_64-static-arm")
source_i686=("${QEMU_LINK}/x86/qemu-x86-static-x86_64" "${QEMU_LINK}/x86/qemu-x86_64-static-arm")
md5sums=('SKIP' '14080705dd45a6bafa20e909a68072cb' 'b1c08236b56d121e04e9e29b197d0eeb' '8218c5f00e77e2e6e04c372ced27c7e7')
md5sums_x86_64=('8a706d734f8c790743a8114dda4c344a' '3ced729c95d2514f35d4899e944a4582')
md5sums_x86=('c28d5049193dbce75efa0c8655d71427' 'f75fd15722fcc2914e3de0b0a46eb982')

if [[ $NORM_ARCH == "arm" ]]
then
    source+=("${QEMU_LINK}/arm/qemu-arm-static-x86_64" "${QEMU_LINK}/arm/qemu-arm-static-x86")
    md5sums+=('bd9de1927aae4eb26dc0e5615159a616' 'a7c2b6ca53fa166f0c06ec76cc5edd7d')
fi

noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  :
}

package() {
    cd "$srcdir/${pkgname%-git}"

    install -d -m 755 "${pkgdir}/opt/"
    cp -R "${srcdir}/${pkgname%-git}" "${pkgdir}/opt/${pkgname%-git}"

    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s ../../opt/${pkgname%-git}/bin/${pkgname%-git} ${pkgdir}/usr/bin/${pkgname%-git}

    echo "Generating the metadata info"
    install -d -m 755 "${pkgdir}/etc/${pkgname%-git}"
    echo "JUNEST_ARCH=$NORM_ARCH" > ${pkgdir}/etc/${pkgname%-git}/info

    echo "Installing proot static binaries"
    cd "$srcdir"
    install -d -m 755 "${pkgdir}/opt/proot"
    install -m 755 proot-* ${pkgdir}/opt/proot

    echo "Installing qemu static binaries"
    install -d -m 755 "${pkgdir}/opt/qemu"
    install -m 755 qemu-* ${pkgdir}/opt/qemu

    echo "Applying patches makepkg"
    install -d -m 755 "${pkgdir}/opt/makepkg/bin/"
    install -m 755 /usr/bin/makepkg ${pkgdir}/opt/makepkg/bin/
    sed -i -e 's/EUID\s==\s0/false/' ${pkgdir}/opt/makepkg/bin/makepkg
}

# vim:set ts=2 sw=2 et:
