# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=drc-sim-e
pkgname=$_pkgname-git
pkgver="2.1.1.r2.g2d8b3e6"
pkgrel=1
pkgdesc="Wii U Gamepad Simulator Backend"
arch=('x86_64')
url="https://github.com/Veemyu/drc-sim-e"
license=('GPL2')
makedepends=('cmake' 'make' 'gcc')
depends=('python>=3.3' 'python-pip' 'libffi' 'zlib' 'libjpeg-turbo' 'net-tools' 'wireless_tools' 'systemd-sysvcompat' 'ffmpeg' 'util-linux' 'dhclient' 'tk' 'pkgconf' 'openssl' 'libnl' 'ethtool' 'ifmetric')
source=("${_pkgname}::git+https://github.com/Veemyu/drc-sim-e.git" "no-root.patch")
md5sums=('SKIP' 'd5f103f661f95da4f5202b47fede5d57')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  patch --forward --strip=1 --input=../../no-root.patch
}

build() {
  cd $srcdir/$_pkgname

	python3 -m venv "$srcdir/$_pkgname/venv"
	source "$srcdir/$_pkgname/venv/bin/activate"

	python3 setup.py install
}

package() {
	# the desktop file is super buggy. not including it
	#
	# cd dist
	# unzip *.egg
	# cd ..
	#
  # cp -r --no-preserve=mode,ownership "dist/usr" "${pkgdir}/usr"
  cd $srcdir/$_pkgname
  install -dm755 "${pkgdir}/opt/"
	cp -r --no-preserve=mode,ownership "$srcdir/$_pkgname/venv" "${pkgdir}/opt/$_pkgname"

	sed -i '/#!/c\#!/opt/drc-sim-e/bin/python3' build/scripts*/drc-sim-backend
  install -Dm755 build/scripts*/drc-sim-backend "${pkgdir}/usr/bin/drc-sim-backend"
}
