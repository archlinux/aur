# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=fwupd-git
_pkgname=fwupd
pkgver=1.3.8.r161.g464eacdc
pkgrel=1
pkgdesc="A simple daemon to allow session software to update firmware"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/fwupd/fwupd"
license=('LGPL')
depends=('libxmlb' 'efivar' 'python' 'libsmbios' 'libgusb'
         'libsoup' 'json-glib' 'gcab' 'libarchive' 'gpgme'
         'libgudev' 'polkit' 'shared-mime-info' 'modemmanager'
         'tpm2-tss' 'libjcat')
makedepends=('meson' 'valgrind' 'gobject-introspection' 'gtk-doc'
             'python-cairo' 'noto-fonts' 'noto-fonts-cjk' 'python-gobject' 'vala'
             'bash-completion' 'python-pillow' 'help2man' 'gnu-efi-libs' 'git')
checkdepends=('umockdev')
conflicts=('fwupd')
provides=('fwupd')
backup=('etc/fwupd/daemon.conf'
        'etc/fwupd/redfish.conf'
        'etc/fwupd/remotes.d/dell-esrt.conf'
        'etc/fwupd/remotes.d/fwupd-tests.conf'
        'etc/fwupd/remotes.d/lvfs-testing.conf'
        'etc/fwupd/remotes.d/lvfs.conf'
        'etc/fwupd/remotes.d/vendor-directory.conf'
        'etc/fwupd/remotes.d/vendor.conf'
        'etc/fwupd/uefi.conf')
source=("git+https://github.com/fwupd/fwupd.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  arch-meson -D b_lto=false ../build
  ninja -v -C ../build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  # Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d
  # Remove the tests
  rm -r "${pkgdir}"/usr/share/installed-tests/
}
