# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Based on <https://github.com/archlinux/svntogit-community/blob/8963650797cfe0383ef510e9c0492b2cb22a2593/trunk/PKGBUILD>
_pkgname=polkit-gnome
pkgname="${_pkgname}-git"
pkgver=0.105.r66.ga0763a2
pkgrel=1
pkgdesc="Legacy polkit authentication agent for GNOME"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/polkit/"
license=('LGPL')
depends=('polkit' 'gtk3')
makedepends=('git' 'gnome-common' 'intltool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://gitlab.gnome.org/Archive/policykit-gnome.git"
        "${pkgname}-authentication-agent-1.desktop"
        "${pkgname}-label-wrap-fix.patch")
sha256sums=('SKIP'
            '5074c723a4eab274830587d799ba781ff57f4fbe4ac99fbdc5aac5009c441ee7'
            '67674d940e063520c518027ac2fe5e55797936c620f31286501f39f0b6ed7581')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  patch --forward --strip=0 --input="${srcdir}/${pkgname}-label-wrap-fix.patch"
}

build() {
  cd "${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir="/usr/lib/${_pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 \
    "${srcdir}/${pkgname}-authentication-agent-1.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}-authentication-agent-1.desktop"
}
