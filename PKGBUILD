# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=kdepim-runtime-etesync-git
_pkgname=kdepim-runtime-etesync
pkgver=v20.04.1.r188.g7de456e37
pkgrel=1
pkgdesc='Extends the functionality of kdepim (with etesync modules)'
arch=(x86_64)
url='https://kontact.kde.org'
license=(GPL LGPL FDL)
depends=(libkolabxml kdav akonadi-calendar knotifyconfig kalarmcal kmbox pimcommon akonadi-notes akonadi libakonadi qca qt5-networkauth etesync)
makedepends=(extra-cmake-modules kdoctools boost)
provides=(kdepim-runtime)
conflicts=(kdepim-runtime)
source=("${_pkgname}::git+https://invent.kde.org/sjolly/kdepim-runtime.git#branch=etesyncResource"
        "0001-XXX-Ease-version-requirements.patch")
sha512sums=('SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | awk -F '-' '/-/{ printf "%s.r%3.3d.%s\n", $1, $2, $3 }'
}

prepare() {
	cd "$_pkgname"
    git am ../0001-XXX-Ease-version-requirements.patch
}

build() {
  cmake -B build -S "${_pkgname}" \
        -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
