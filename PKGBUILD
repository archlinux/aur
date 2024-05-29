# Maintainer: Jakub Janeczko <jjaneczk@gmail.org>
# Maintainer: Arthur Baker <bakew.aqizen@gmail.org>
pkgname=network-manager-sstp-git
pkgver=1.3.2.1.r5.gb888b6f
pkgrel=1
pkgdesc="SSTP support for NetworkManager"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/network-manager-sstp"
license=('GPL2')
depends=('libsecret' 'ppp' 'sstp-client')
optdepends=('libnma: GUI support (GTK 3)'
            'libnma-gtk4: GUI support (GTK 4)')
makedepends=('gtk3' 'gtk4' 'libnma' 'libnma-gtk4' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/GNOME/network-manager-sstp.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local build_flags=(
    --prefix=/usr 
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib/
    --disable-static
    --with-gtk4=yes
)
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh "${build_flags[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" dbusservicedir=/usr/share/dbus-1/system.d install
}
