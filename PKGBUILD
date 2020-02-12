# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
# See https://phalanx.openinfosecfoundation.org/projects/suricata for more info

pkgname=suricata-git
pkgver=5.0.1.r109.gaeefc82eb
pkgrel=1
pkgdesc='Suricata is a free and open source, mature, fast and robust network threat detection engine'
url='https://suricata-ids.org'
arch=('i686' 'x86_64')
license=('GPL2' 'CUSTOM')
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc' 'pkg-config' 'fakeroot' 'which' 'cbindgen')
depends=('libcap-ng' 'libnet' 'libpcap' 'libyaml' 'pcre')
#optdepends=('')
backup=('etc/suricata/suricata.yaml' 'etc/suricata/classification.config' 'etc/suricata/reference.config' 'etc/suricata/threshold.config')
source=("${pkgname}::git+https://github.com/OISF/suricata.git" "libhtp::git+https://github.com/OISF/libhtp.git#branch=0.5.x")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  # Remove 'suricata' prefix; remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/suricata\-//g;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # Create symlink to libhtp
  ln -sf "${srcdir}/libhtp" libhtp

  # Create configure script
  ./autogen.sh

  # Create Makefiles
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
}

build() {
  cd "${srcdir}/${pkgname}"

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-conf

  # The makefile creates a /var/run/suricata that pacman doesn't like.
  rm -r "${pkgdir}/var/run"

  install -DTm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -DTm664 "${srcdir}/libhtp/LICENSE" "${pkgdir}"/usr/share/licenses/libhtp/LICENSE
}

