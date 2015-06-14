# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-vte
_pkgname=vte
pkgver=0.28.2
_srcdirname=vte-0.28.2
pkgrel=8
epoch=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK2 - with several patches"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://developer.gnome.org/vte/"
groups=('deepin-extra')
depends=('gtk2')
makedepends=('deepin-pygtk' 'intltool' 'gobject-introspection' 'pygobject2-devel')
provides=('vte=0.28.2' 'deepin-vte-plus')
conflicts=('vte' 'deepin-vte-plus')
replaces=('deepin-vte-plus')
options=('!libtool' '!emptydirs')
source=("http://packages.linuxdeepin.com/deepin/pool/main/v/vte/vte_0.28.2.orig.tar.xz"
        "http://packages.linuxdeepin.com/deepin/pool/main/v/vte/vte_0.28.2-6deepin7~saucy.debian.tar.gz")
sha256sums=('ee52b91ecab31d0a64399896ce0c3515e579ea8ac212a00eb9b0895c58f001fe'
            'b63a344541f0feebddac0232a8d7196d22d4819ec32cbd6cb39e33b2ba50e940')

prepare() {
  patchdir="${srcdir}"/debian/patches
  for f in $(< "${patchdir}"/series); do
    msg "patching: ${f##*/}"
    # ignore error if patch again
    patch -Np1 -i "${patchdir}/${f}" || msg "patch error: ${f##*/}"
  done
}

build() {
  cd "${srcdir}"

  #warning: type-punning to incomplete type might break strict-aliasing rules
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  export PYTHON="/usr/bin/python2"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/vte \
              --localstatedir=/var \
              --disable-static \
              --enable-introspection \
              --with-gtk=2.0
  make
}

package(){
  cd "${srcdir}"

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}"/usr/lib/vte/gnome-pty-helper
}
