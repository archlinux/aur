# Maintainer: Pablo Leazeta <prflr88@gmail.com>

pkgname=mintsysadm
pkgver=1.0.3
pkgrel=1
pkgdesc="System Administration tool for Linux Mint (boot menu configuration and more)"
arch=('any')
url="https://github.com/linuxmint/mintsysadm"
license=('GPL-3.0-or-later')
depends=('python-gobject' 'gtk3' 'polkit' 'gobject-introspection' 'xapp' 'python-xapp' 'glib2' 'gtksourceview3')
makedepends=('git' 'mintcommon')
optdepends=('grub: Grub bootloader configuration')
provides=('mintsysadm-git')
conflicts=('mintsysadm-git')
source=("${pkgname}::git+https://github.com/linuxmint/${pkgname}.git#commit=b4b41e2341a9f3c6fd2e944d741a863b9b9fbaa3")
sha256sums=('383d4e24d79e153a36d670a770cf062a348f1cf6743f1ed4821590ab5d8b4edd')

prepare() {
cd "${srcdir}/${pkgname}/usr/lib/linuxmint/mintsysadm"
  
  find . -type f -name "*.py" -exec sed -i \
    -e '/^[[:space:]]*import[[:space:]]\+apt/s/^/# /' \
    -e 's|/usr/sbin/update-grub|/usr/bin/grub-mkconfig -o /boot/grub/grub.cfg|g' \
    -e "s/__DEB_VERSION__/${pkgver}/g" \
    {} +
  
  sed -i 's/# import apt/import os  # Add for compatibility with Arch\n# import apt/' mintsysadm.py
  
  sed -i '/import os/a import shutil' mintsysadm.py

  sed -i '/with open(GRUB_FILE, "w") as grub_file:/i \
        os.makedirs(os.path.dirname(GRUB_FILE), exist_ok=True)' mintsysadm.py

  sed -i 's|\["/usr/bin/grub-mkconfig -o /boot/grub/grub.cfg"\]|["/usr/bin/grub-mkconfig", "-o", "/boot/grub/grub.cfg"]|g' mintsysadm.py

  sed -i '/self.builder.get_object("button_boot_save").connect/i \
        if not shutil.which("grub-mkconfig"):\n            self.builder.get_object("button_boot_save").set_sensitive(False)\n            self.builder.get_object("grub_switch").set_sensitive(False)\n            self.builder.get_object("grub_remember_last_switch").set_sensitive(False)\n            self.builder.get_object("grub_timeout_spinner").set_sensitive(False)\n            self.boot_args_editor.set_sensitive(False)' mintsysadm.py

  sed -i 's|/usr/share/common-licenses/GPL|/usr/share/licenses/spdx/GPL-3.0-or-later.txt|g' mintsysadm.py
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}"
  
  # Install the estructure of usr/
  mkdir --verbose -p  "${pkgdir}/usr"
  cp --verbose -r usr/* "${pkgdir}/usr/"
}

