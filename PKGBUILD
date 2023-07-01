# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgbase=uranium-5
pkgname=python-uranium
_pkgname=uranium
pkgver=5.3.1
pkgrel=1
pkgdesc="Python framework for building 3D printing related applications"
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('LGPL')
provides=('uranium' 'python-uranium')
conflicts=('uranium' 'python-uranium')
depends=('python' 'qt6-quickcontrols2' 'python-pyqt6' 'python-numpy'
         'python-arcus' 'python-shapely' 'python-scipy' 'python-cryptography' 'python-certifi')
makedepends=('cmake' 'ninja')
checkdepends=('mypy' 'python-pytest' 'python-twisted')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/${_pkgname}/archive/${pkgver}.tar.gz"
	"mod_bundled_packages_json.py"
	"UraniumPluginInstall.cmake"
	"UraniumTests.cmake"
	"UraniumTranslationTools.cmake"
	"CMakeLists.txt"
	"CPackConfig.cmake"
	"Doxyfile"
	"Uranium-5.3.0-qt-6.5-hack.patch"
	"Uranium-5.3.0-qt-try-ints-then-bytes-for-gl-mask-functions.patch")
sha256sums=('78ba21ed2107a293a8c8f9dab74c6e8ad20947b14a001880d3647b59ea463d9c'
            '90b22e8c5ffd7be7c7a6735f913f9c36dae22af90112c84fb8309981a512a7aa'
            'fa25cd518983a4ae1ef808e7bfc3e0036b608de623228707372a62395e807f6d'
            'd41a673b152ef5d2ead329603f97e00ba1c8ae87527581dc61f3d6766a23acbc'
            'a925de84a07c0cdf5b0b3471f9cff627c3503340461354013b664be2b7308e50'
            '42f6fd9c788052e45446b5c79b821064e097af90e61529ece7fc604341dfb00f'
            '39f0b0f97e7c5db17c3e4b8d002b8473911de2b902707f5c0394e8bc55fe8072'
            '8d60c3e22f00533de29be892af8148318b7fe0a3458196cda84133605709efc3'
            'bc8c0294840ae414da98b7fe5a0c3e8dcc7524bc150aecdb716eeee3a70ebc98'
            '078673634124e33bed4bbee756c78cc3366a8a4788a626490a79870ec55d2dbe')

prepare() {
	cd $srcdir/Uranium-${pkgver}
	cp -a ${srcdir}/mod_bundled_packages_json.py ${srcdir}/UraniumPluginInstall.cmake ${srcdir}/UraniumTests.cmake cmake
	rm -rf CMakeLists.txt
	cp -a ${srcdir}/CMakeLists.txt ${srcdir}/CPackConfig.cmake ${srcdir}/Doxyfile .
	sed -i 's|qsb |qsb-qt6 |g' scripts/compile-shaders
	patch -Np1 < ${srcdir}/Uranium-5.3.0-qt-6.5-hack.patch
	patch -Np1 < ${srcdir}/Uranium-5.3.0-qt-try-ints-then-bytes-for-gl-mask-functions.patch

}

build() {
	cd $srcdir/Uranium-${pkgver}
	cmake -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DLIB_SUFFIX:STR= \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

check() {
	cd $srcdir/Uranium-${pkgver}
	cd build
	# all tests fail atm
	ctest
}

package() {
	cd $srcdir/Uranium-${pkgver}
	DESTDIR="${pkgdir}" cmake --install build

	# Move cmake module to right dir
	mv "$pkgdir"/usr/share/cmake{-*,}
  install -m755 -d "${pkgdir}/usr/share/doc/$pkgname"
  install -m644 "README.md" "${pkgdir}/usr/share/doc/$pkgname/"
  install -m755 -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
