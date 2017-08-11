# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=selinux-gui
pkgver=2.7
pkgrel=1
pkgdesc="SELinux GUI tools"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('gnome-python' 'hicolor-icon-theme' 'python2' 'pygtk' 'selinux-python2')
conflicts=('policycoreutils<2.7')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz")
sha256sums=('693fb3347041b5a2273c52c33be0a256b109e60f2039ae1d7e90ba8a2ec0324f')

prepare() {
  cd "${pkgname}-${pkgver}"

  # system-config-selinux uses Python 2 because of pygtk
  sed -i -e "s/python -E/python2 -E/" system-config-selinux.py
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Compile Python files into bytecode
  python2 -m compileall "${pkgdir}/usr/share/system-config-selinux"
}
