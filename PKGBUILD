# Maintainer: inhzus <inhzus@gmail.com>
pkgname=proxifier-for-linux-git
pkgver=r81.64456c5
pkgrel=1
pkgdesc="Simple C code with iptables make this tool proxifier which tunnels whole system traffic through the proxy server, without configuring individual application"
arch=('x86_64')
url="https://github.com/m0hithreddy/Proxifier-For-Linux"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'make' 'autoconf' 'gcc' 'txt2man')
provides=("proxifier-for-linux")
conflicts=("proxifier-for-linux")
replaces=()
backup=()
options=()
install=${pkgname}.install
source=("$pkgname::git+https://github.com/m0hithreddy/Proxifier-For-Linux")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  autoreconf -vfi
  ./configure
  make all
}

package() {
  cd "$srcdir/${pkgname}"
  test -d fakeroot || mkdir fakeroot
  make install DESTDIR=fakeroot
  cd fakeroot
  install -Dm755 "usr/local/bin/proxifier" "${pkgdir}/usr/local/bin/proxifier"
  install -Dm644 "usr/local/etc/proxifier.conf" "${pkgdir}/usr/local/etc/proxifier.conf"
  install -Dm644 "usr/local/lib/systemd/system/proxifier.service" "${pkgdir}/usr/lib/systemd/system/proxifier.service"
  install -Dm644 "usr/local/share/man/man1/proxifier.1" "${pkgdir}/usr/share/man/man1/proxifier.1"
}

