# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=iwd-git
pkgver=r2423.5c5bfbb
pkgrel=1
pkgdesc='Internet Wireless Daemon'
arch=('i686' 'x86_64')
url='https://git.kernel.org/cgit/network/wireless/iwd.git/'
license=('LGPL')
depends=('glibc' 'readline' 'libreadline.so')
makedepends=('git' 'python-docutils')
backup=('etc/iwd/main.conf')
provides=('iwd')
conflicts=('iwd')
source=('git+https://git.kernel.org/pub/scm/network/wireless/iwd.git'
				'git+https://git.kernel.org/pub/scm/libs/ell/ell.git')
sha256sums=('SKIP' 'SKIP')
_gitname='iwd'
changelog=ChangeLog
install=iwd.install

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"
	./bootstrap
}

build() {
  cd "${srcdir}/${_gitname}"
	./configure --prefix=/usr \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --with-runstatedir=/run \
  --libexecdir=/usr/lib/iwd \
  --enable-wired \
  --enable-ofono \
  --enable-sim-hardcoded \
  --enable-hwsim \
  --disable-tools
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make install DESTDIR="${pkgdir}"
	install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 ft=sh noet:
