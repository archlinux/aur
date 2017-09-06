# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgbase="sddm"
pkgname="$_pkgbase-git"
pkgver=0.15.0.r1044.ge26c1e6
pkgrel=1
pkgdesc="The Simple Desktop Display Manager"
arch=("i686" "x86_64")
url="https://github.com/sddm/sddm"
license=("GPL")
depends=('qt5-declarative' 'xorg-xauth' 'xorg-server')
makedepends=('extra-cmake-modules' 'python-docutils' 'qt5-tools' 'git')
provides=("$_pkgbase" 'display-manager')
conflicts=("$_pkgbase")
backup=('usr/share/sddm/scripts/Xsetup'
        'etc/pam.d/sddm'
        'etc/sddm.conf')
source=("git://github.com/sddm/sddm.git#branch=master"
sddm.sysusers sddm.tmpfiles)
sha256sums=('SKIP'
            '421d6d137a32b7a749427f4ab770e5adeef7dac66b138ab6e216ddc0cf4e2cb6'
            'db625f2a3649d6d203e1e1b187a054d5c6263cadf7edd824774d8ace52219677')


pkgver() {
	cd "$srcdir/$_pkgbase"
	_ver="$(cat CMakeLists.txt | grep -m3 -e _VERSION_MAJOR -e _VERSION_MINOR -e _VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
        echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p build

	cd build
	cmake "$srcdir/$_pkgbase" \
		-DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=ON
  make
}

package() {
        cd build
        make DESTDIR="${pkgdir}" install

        install -Dm644 "$srcdir"/sddm.sysusers "$pkgdir"/usr/lib/sysusers.d/sddm.conf
        install -Dm644 "$srcdir"/sddm.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/sddm.conf
}
