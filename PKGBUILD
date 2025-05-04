# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Giuseppe Calà <jiveaxe@gmail.com>
# Contributer: giacomogiorgianni@gmail.com
# Contributor: TingPing <tingping@tingping.se>

pkgname=grive
pkgver=0.5.3
pkgrel=3
pkgdesc="An open source Linux client for Google Drive with support for the new Drive REST API and partial sync"
arch=('i686' 'x86_64')
url='https://github.com/vitalif/grive2'
license=('GPL2')
depends=('yajl' 'curl' 'libgcrypt' 'boost-libs' 'gcc-libs' 'json-c' 'expat')
optdepends=("inotify-tools: scheduled syncs and syncs on file change events"
    "cppunit: unit tests"
    "binutils: backtrace and libiberty")
makedepends=('cmake' 'boost')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vitalif/grive2/archive/v${pkgver}.tar.gz"
	"syncer_compilation.patch"::"https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/363.patch"
	"fgrep_compilation.patch"::"https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/371.patch"
	"libgcript_compilation.patch"::"https://patch-diff.githubusercontent.com/raw/vitalif/grive2/pull/403.patch"
	)
sha512sums=('9185401500edbe4c45a1eea02983d747c022739aea0f09ce1518a43ae63c0c3e7f352b17f31d5510ac2de16e02e7dbbead6888812c04ee546c5ae39936d4a974'
            '9c4d73105309bb25e03d692313c46c5281b8b0b1f1f3f4fb7bfdd5d167d642e966203024d675d9139ca92de72a2d796819f04e8940da9c8bbb746eb8b5ed615f'
            'e2829bb1e046e1f6dd529f54423cd952d95d937f2ae34b4fce05b42dd37aeed61ec128b73a81235c10c012cd0cdc395c03409fd99daedf8e47270a7c6d1508d6'
            'e3d2cf5d5546cbba69e7cfef7a944bf3230af1bde9352faea5e1c331cbeb613a319d8bd9042676768561fe2547ce2a026de0e88a9fba8f570e97062d7dd87ef5')


prepare() {
	cd "${srcdir}/${pkgname}2-${pkgver}"

	patch -Np1 -i ../syncer_compilation.patch
	patch -Np1 -i ../fgrep_compilation.patch
	patch -Np1 -i ../libgcript_compilation.patch
}

build() {
	cd "${srcdir}/${pkgname}2-${pkgver}"
	rm -rf build
	mkdir build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_EXE_LINKER_FLAGS=-ljson-c ..

	make
}

package() {
	make -C "${srcdir}/${pkgname}2-${pkgver}/build" DESTDIR="${pkgdir}" install
}
