# Author: Frédéric Pierret <frederic.pierret@qubes-os.org>
# Maintainer: Otto Sabart <aur@seberm.com>

pkgbase=qubes-meta-packages
pkgname=(qubes-vm-dependencies qubes-vm-recommended qubes-vm-repo)
_gitname=${pkgname%-git*}
pkgver=4.0.12
pkgrel=1
pkgdesc="Meta packages for Qubes-specific components"
arch=("x86_64")
url="https://github.com/QubesOS/qubes-meta-packages"
license=('GPL')
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=(
    "$_gitname::git+https://github.com/QubesOS/qubes-meta-packages.git?signed#tag=v${pkgver}"
    )

sha512sums=(
    'SKIP'
)


build() {
  #for source in repos ; do
  #  # shellcheck disable=SC2154
  #  (ln -s "${srcdir}/../${source}" "${srcdir}/${source}")
  #done
  cd "${srcdir}/${_gitname}/"
}

package_qubes-vm-dependencies() {
    depends=(qubes-vm-xen qubes-vm-core qubes-vm-gui qubes-vm-pulseaudio)
}

package_qubes-vm-recommended() {
    depends=(qubes-gpg-split qubes-usb-proxy)
}

package_qubes-vm-repo() {
    replaces=('qubes-vm-keyring')
    install=PKGBUILD-repo.install

    cd "${srcdir}/${_gitname}/"

    install -m 0644 -D repos/archlinux-qubes-repo-4.0-current.conf "${pkgdir}/etc/pacman.d/90-qubes-4.0-current.conf.disabled"
    install -m 0644 -D repos/archlinux-qubes-repo-4.0-current-testing.conf "${pkgdir}/etc/pacman.d/90-qubes-4.0-current-testing.conf.disabled"

    # Install keyring (will be activated through the .install file)
    install -dm755 "${pkgdir}/usr/share/pacman/keyrings/"
    install -m0644 repos/qubes-repo-archlinux-key.asc  "${pkgdir}/usr/share/pacman/keyrings/qubesos-vm.gpg"
    install -m0644 repos/qubes-repo-archlinux-trusted "${pkgdir}/usr/share/pacman/keyrings/qubesos-vm-trusted"
    install -m0644 repos/qubes-repo-archlinux-revoked "${pkgdir}/usr/share/pacman/keyrings/qubesos-vm-revoked"
}
