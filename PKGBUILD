# Maintainer: Mateusz Paluszkiewicz <aifam96 at gmail dot com>
# Contributor: Swift Geek <swiftgeek plus aur at gmail dot com>
# Contributor: Jerome Leclanche <jerome at leclan dot ch>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Pier Luigi Fiorini <pierluigi dot fiorini at gmail dot com>
# Contributor: Gustavo <sl1pkn07 at gmail dot com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>

_pkgname=qt5-wayland
pkgname=${_pkgname}-dev-git
pkgver=5.5.1.r4.g9d40864
pkgrel=3
pkgdesc="A cross-platform application and UI framework (QtWayland) - Version for Developers!"
arch=("i686" "x86_64")
url="https://qt.gitorious.org/qt/qtwayland/"
license=("GPL3" "LGPL")
depends=("qt5-base-dev-git" "qt5-declarative" "libxcomposite" "wayland" "libdrm" "libxkbcommon" "mesa")
optdepends=("weston")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=("staticlibs" "libtool")

_ver=5.5.1
source=("$_pkgname::git://code.qt.io/qt/qtwayland.git#branch=5.5"
        "0001-Update-wayland.xml-to-1.6.patch"
        "0002-Add-support-for-keyboard-repeat-rate-and-delay.patch"
        "0003-Use-xkbcommon-for-internal-key-events-too.patch")

sha256sums=('SKIP'
            '1a7ce4a79474b9c5a307b90b9f35a15bc2f7a314676a91e411d3e07dc97ec5d5'
            'bb8f838c2ee59ab248e90c8297269f07a3ef279b4db950a50b3215fffe572afe'
            '5f1f6dcff0bbd626952a1a09e0044a44121c8f2b065d25ecde0dc8ccc1672289')

pkgver() {
    cd "$srcdir/${_pkgname}"
    #pkg ver withtout 'v' prefix
    git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	warning "REMEMBER! If you want use other version, change line 28!"

	cd "$srcdir/${_pkgname}"
    mkdir -p build

    git apply ../0001-Update-wayland.xml-to-1.6.patch
    git apply ../0002-Add-support-for-keyboard-repeat-rate-and-delay.patch
    git apply ../0003-Use-xkbcommon-for-internal-key-events-too.patch
}

build() {
	cd "$srcdir/${_pkgname}"

	# Replace Qt version to user version (Qt)
	msg "Patching QtWayland to user version QT"
	sed -i "/MODULE_VERSION/c\MODULE_VERSION = ${_ver}" .qmake.conf

	cd build

	export QT_SELECT=5
	msg "Preparing library... (QMAKE_LIBS_PRIVATE is NEEDED now)"
	qmake CONFIG+=wayland-compositor QMAKE_LIBS_PRIVATE+=-lXrender ..

	msg "Build library..."
	make -j`nproc`
}

package() {
  cd "$srcdir/${_pkgname}"
  cd build

  msg "Packing library..."
  make INSTALL_ROOT="${pkgdir}" install

  # Create custom directories
  mkdir -p ${pkgdir}/usr/share/licenses/qt5-wayland/

  # Workaround to install generated private headers
  cp ./include/QtCompositor/${_ver}/QtCompositor/private/{qwayland-server-*,*protocol*}.h \
      ${pkgdir}/usr/include/qt/QtCompositor/${_ver}/QtCompositor/private/

  # Back to main directory
  cd ../

  # Copy custom files
  cp ./LGPL_EXCEPTION.txt ${pkgdir}/usr/share/licenses/qt5-wayland/
}
