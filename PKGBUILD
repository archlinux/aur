# Maintainer: HalosGhost <samuel dot stuewe at gmail dot com>

pkgname=polkit-no-script-git
pkgver=0.113+35+g5bcb1c1
pkgrel=1
pkgdesc='A polkit-fork with no javascript dependency'
arch=(x86_64)
license=(LGPL)
url="https://github.com/getsolus/polkit-no-script.git"
depends=(glib2 pam expat systemd)
makedepends=(intltool gtk-doc gobject-introspection git autoconf-archive automake)
provides=("${pkgname%-git}" polkit)
conflicts=("${pkgname%-git}" polkit)
source=("git+https://github.com/ikeydoherty/polkit-no-script.git#branch=noscript-3")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${pkgname%-git}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${pkgname%-git}"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --enable-libsystemd-login=yes --disable-static \
      --enable-gtk-doc --with-os-type=redhat \
      --with-backend=keyfile --disable-test

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

#check() {
#  cd "${pkgname%-git}"
#  make -k check || :
#}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install

  install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}

# vim: ts=2 sw=2 et:
