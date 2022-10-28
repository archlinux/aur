# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=fwupd-git
pkgver=1.8.6.r82.g60c01af01
pkgrel=1
pkgdesc="Simple daemon to allow session software to update firmware"
arch=('x86_64')
url="https://github.com/fwupd/fwupd"
license=('LGPL')
depends=(
    'libxmlb' 'efivar' 'python' 'libsmbios' 'libgusb'
    'polkit' 'shared-mime-info' 'tpm2-tss' 'flashrom'
    'libjcat' 'fwupd-efi' 'gcab' 'hicolor-icon-theme'
    'bluez' 'gnutls'
    'libarchive.so' 'libcurl.so' 'libcbor.so'
    'libjson-glib-1.0.so' 'libgudev-1.0.so' 'libmm-glib.so'
    'libqmi-glib.so' 'libprotobuf-c.so')
optdepends=(
    'udisks2: UEFI firmware upgrade support'
)
makedepends=(
    'meson' 'valgrind' 'gobject-introspection' 'gi-docgen'
    'python-cairo' 'noto-fonts' 'noto-fonts-cjk' 'python-gobject' 'vala'
    'bash-completion' 'python-pillow' 'help2man' 'gnu-efi-libs' 'git')
checkdepends=('umockdev')
provides=('libfwupd.so' 'libfwupdplugin.so' "${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=(
    'etc/fwupd/daemon.conf'
    'etc/fwupd/redfish.conf'
    'etc/fwupd/remotes.d/dell-esrt.conf'
    'etc/fwupd/remotes.d/fwupd-tests.conf'
    'etc/fwupd/remotes.d/lvfs-testing.conf'
    'etc/fwupd/remotes.d/lvfs.conf'
    'etc/fwupd/remotes.d/vendor-directory.conf'
    'etc/fwupd/remotes.d/vendor.conf'
    'etc/fwupd/thunderbolt.conf'
    'etc/fwupd/uefi_capsule.conf'
)
source=("${pkgname}::git+https://github.com/fwupd/fwupd.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

    arch-meson "${srcdir}/${pkgname}" "${srcdir}/build" \
        -D plugin_flashrom=enabled \
        -D plugin_modem_manager=enabled \
        -D b_lto=false \
        -D lzma=enabled \
        -D docs=enabled \
        -D plugin_intel_spi=true \
        -D supported_build=enabled \
        -D efi_binary=false

    meson compile -C "${srcdir}/build" -j 0
}

check() {
    CACHE_DIRECTORY=/tmp meson test -C "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"

    # Fixup mode to match polkit
    install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d

    # Remove the tests
    rm -r "${pkgdir}"/usr/share/installed-tests/
    mv "${pkgdir}"/usr/bin/{,fwupd-}dbxtool
    mv "${pkgdir}"/usr/share/man/man1/{,fwupd-}dbxtool.1

    # Remove msr module-load config as it is built-in
    rm "${pkgdir}"/usr/lib/modules-load.d/fwupd-msr.conf
    rmdir "${pkgdir}"/usr/lib/modules-load.d
}
