# Maintainer: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Rayfalling <Rayfalling@outlook.com>
# Contributor: facekapow, rayfalling, Ducksoft
pkgname=genie-systemd-git
pkgver=2.1.r13.g391a645
pkgrel=1
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('Unlicense')
depends=('daemonize' 'python' 'python-psutil' 'systemd')
makedepends=('git' 'python-pip')
provides=('genie-systemd')
conflicts=('genie-systemd')
options=(!strip)
source=("git+https://github.com/arkane-systems/genie.git#branch=dev-2.2")
sha256sums=('SKIP')
backup=('etc/genie.ini')

pkgver() {
  cd genie
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd genie
  make build-binaries
}

package() {
  cd genie
	make DESTDIR=${pkgdir} internal-package

  # Need to fix symlinks and mandoc here because makefile generates a tar, which we don't need.
  mkdir -p ${pkgdir}/usr/lib/systemd/system-environment-generators
  mkdir -p ${pkgdir}/usr/lib/systemd/user-environment-generators
	ln -s ${pkgdir}/usr/lib/genie/80-genie-envar.sh ${pkgdir}/usr/lib/systemd/system-environment-generators/80-genie-envar.sh
	ln -s ${pkgdir}/usr/lib/genie/80-genie-envar.sh ${pkgdir}/usr/lib/systemd/user-environment-generators/80-genie-envar.sh

	cp "othersrc/docs/genie.8" /tmp/genie.8
	gzip -f9 "/tmp/genie.8"
	install -Dm 0644 -o root "/tmp/genie.8.gz" -t "${pkgdir}/usr/share/man/man8"
}

# vim:set ts=2 sw=2 et:
