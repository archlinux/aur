# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-pygtk
pkgver=2.24.0
_srcdirname=pygtk-2.24.0
pkgrel=6
pkgdesc="Python bindings for the GTK widget set - with patches to fix memory leak for deepin-ui"
arch=('i686' 'x86_64')
url="http://www.pygtk.org/"
license=('LGPL')
groups=('deepin')
depends=('libglade' 'python2-cairo' 'pygobject')
optdepends=('python2-numpy')

source=("http://packages.linuxdeepin.com/deepin/pool/main/p/pygtk/pygtk_2.24.0.orig.tar.gz"
        "http://packages.linuxdeepin.com/deepin/pool/main/p/pygtk/pygtk_2.24.0-4~saucy.debian.tar.gz"
        "python27.patch"
        )
sha256sums=('6e3e54fa6e65a69ac60bd58cb2e60a57f3346ac52efe995f3d10b6c38c972fd8'
            '7a70c1f680ee7c4cb326dad86c73a5473c8111deb92e43b6527c8dba03fa9544'
            '39a30456cba055a452bb55c74ef1ff2f5f7bfaad22855b4dd569ab009b56b682')
provides=("pygtk=2.24.0")
conflicts=("pygtk")

prepare() {
  cd "${_srcdirname}"

  # apply python27 patch
  # https://bugzilla.gnome.org/show_bug.cgi?id=623965
  patch -Np1 -i "${srcdir}/python27.patch"

  # apply deepin patches
  patchdir="${srcdir}"/debian/patches
  for f in $(< "${patchdir}"/series); do
    msg "patching: ${f##*/}"
    # ignore error if patch again
    patch -Np1 -i "${patchdir}/${f}" || msg "patch error: ${f##*/}"
  done

}

build() {
  cd "${_srcdirname}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_srcdirname}"
  make DESTDIR="${pkgdir}" install
  install -m644 gtk/gtk-extrafuncs.defs "${pkgdir}/usr/share/pygtk/2.0/defs/"
  sed -i -e 's#env python$#env python2#' "${pkgdir}"/usr/lib/pygtk/2.0/{,demos/}*.py
}
