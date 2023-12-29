# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=fwupd-git
pkgver=1.9.10.r104.gf89bae6e3
pkgrel=1
pkgdesc="Simple daemon to allow session software to update firmware"
arch=('x86_64')
url="https://github.com/fwupd/fwupd"
license=('LGPL')
depends=(
    'bluez'
    'diffutils'
    'efivar'
    'flashrom'
    'fwupd-efi'
    'hicolor-icon-theme'
    'gcab'
    'glib2'
    'gnutls'
    'gzip'
    'polkit'
    'python'
    'python-gobject'
    'sqlite'
    'libxmlb'
    'libgusb'
    'libjcat'
    'libarchive.so'
    'libjson-glib-1.0.so'
    'libmm-glib'
    'libcurl.so'
    'libcbor.so'
    'libsmbios'
    'libsystemd.so'
    'liblzma.so'
    'libgudev-1.0.so'
    'libprotobuf-c.so'
    'libqmi'
)
optdepends=(
    'udisks2: UEFI firmware upgrade support'
)
makedepends=(
    'bash-completion'
    'git'
    'gobject-introspection'
    'meson'
    'python-cairo'
    'python-jinja'
    'python-markdown'
    'vala'
    'valgrind'
)
checkdepends=(
    'umockdev'
)
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

prepare() {
    arch-meson "${srcdir}/${pkgname}" "${srcdir}/build" \
        -D passim=disabled \
        -D b_lto=false \
        -D docs=disabled \
        -D man=true \
        -D plugin_intel_spi=true \
        -D plugin_powerd=disabled \
        -D supported_build=enabled \
        -D launchd=disabled \
        -D efi_binary=false
}

build() {
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
