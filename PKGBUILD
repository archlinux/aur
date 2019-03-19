# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd-git
_pkgname=fwupd
pkgver=1.2.5.r78.g6109652f
pkgrel=1
pkgdesc="A simple daemon to allow session software to update firmware"
arch=('x86_64')
url="https://github.com/hughsie/fwupd"
license=('LGPL')
depends=('libxmlb' 'efivar' 'python' 'libsmbios' 'libgusb'
         'libsoup' 'json-glib' 'gcab' 'libarchive' 'gpgme'
         'libgudev' 'polkit' 'shared-mime-info')
makedepends=('meson' 'valgrind' 'gobject-introspection' 'gtk-doc'
             'python-cairo' 'noto-fonts' 'noto-fonts-cjk' 'python-gobject' 'vala'
             'bash-completion' 'python-pillow' 'help2man' 'gnu-efi-libs' 'git')
optdepends=('tpm2-abrmd: TPM2 support'
            'tpm2-tools: TPM2 support')
checkdepends=('umockdev')
conflicts=('fwupd')
backup=('etc/fwupd/daemon.conf' 'etc/fwupd/uefi.conf')
source=("git+https://github.com/hughsie/fwupd.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
    arch-meson -D b_lto=false ../build
    ninja -v -C ../build
}


package() {
    DESTDIR="${pkgdir}" ninja -C build install
    # Fixup mode to match polkit
    install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d
    # Move D-BUS policy
    mv "${pkgdir}"/{etc,usr/share}/dbus-1/system.d
    rmdir "${pkgdir}"/etc/dbus-1
    # Remove the tests
    rm -r "${pkgdir}"/usr/share/installed-tests/
}
