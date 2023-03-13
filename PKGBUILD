# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: unknowndev <unknowndev at archlinux dot info>

_name='portspoof'
pkgname="${_name}-git"
pkgver=1.3.r31.g2a758db
pkgrel=1
pkgdesc='A lightweight, fast, portable and secure addition to any firewall system or security infrastructure.'
url='https://drk1wi.github.io/portspoof'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL2')
depends=('glibc' 'gcc-libs')
makedepends=('automake' 'git')
provides=("${_name}")
source=("git+https://github.com/drk1wi/${_name}")
sha512sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"

  ./configure --prefix=/usr --sysconfdir=/etc
  # sysctl() is deprecated and may break build with glibc >= 2.30
  # see: https://news.ycombinator.com/item?id=27055120
  sed -i s+sys/sysctl+linux/sysctl+ ${srcdir}/${_name}/src/connection.h
  make
}

package() {
  cd "${_name}"

  install -Dm 0755 "src/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 0644 "tools/${_name}"{.conf,_signatures} -t "${pkgdir}/etc/${_name}/"
  install -Dm 0644 COPY{ING,RIGHT.GPL} -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 0644 AUTHORS CREDITS FAQ ChangeLog INSTALL README{,.md} NEWS -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
}
