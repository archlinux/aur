# Maintainer: Iliya Ivanov <i.ivanov@proforge.org>

_pkgname=pgadmin4
pkgname=${_pkgname}-venv
pkgver=5.4
pkgrel=4
pkgdesc='Comprehensive design and management interface for PostgreSQL'
url='https://www.pgadmin.org/'
arch=('x86_64')
license=('custom')
replaces=("${_pkgname}")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
depends=('postgresql-libs' 'python' 'hicolor-icon-theme')
makedepends=('imagemagick' 'python-pip' )
source=(
	https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${pkgver}/source/${_pkgname}-${pkgver}.tar.gz{,.asc}
	pgadmin4
	pgAdmin4.desktop
	arch_additions.py
	arch_patches.patch
)
sha512sums=(
	'563a38545fcc3e59d6dd0db94d0a2ba433de3ac3f75889ed6e73c0db36f6105db6c92c5ffcd4a7116d726adeeb6bec3d29b517a0b4d6f7fd69ea9818713e3500'
	'SKIP'
	'70a85ac956ea54d51486f903531f5fcf26c0c967aedee42d4adc34483653dc655fa1a751b70b858aa2f698c71fbddfc771a77ca3f90f38938c66ea6f8a626237'
	'1353eeedfc091da86f8901b71922ceca53b83d9eb62437e3ca7a48745463a7796c3e5db00e103e023af3a002a8319472ea42e37e8bdef38c29da9e963e49bada'
	'd45aa698834ec67b26e061caabb734db22ada85e241ab8ee64c3db3a3027355a0174f84ee186bdfb7b9330dd24ab1d0171f367c75507714f6fb5736346f59006'
	'2a7d23ca23b68fcaceb9c12abb465ba3a420a07a03e3bc976887f3544f41a1ea571b015b1383096b14bd6fe5c7736e77c9116de297e4f7c267ace7e6693919a7'
)

validpgpkeys=('E8697E2EEF76C02D3A6332778881B2A8210976F2') # Package Manager (Package Signing Key) <packages@pgadmin.org>

prepare() {
	cd ${_pkgname}-${pkgver}
	patch -Np1 < ../arch_patches.patch
	echo "PyQt5==5.*" >> requirements.txt
	echo "simple-websocket==0.*" >> requirements.txt
	echo "Sphinx==4.*" >> requirements.txt
}

build() {
	local SRC_DIR=${srcdir}/${_pkgname}-${pkgver}
	cd $SRC_DIR

	python -m venv venv
	venv/bin/pip install -r requirements.txt

	make docs PYTHON="${SRC_DIR}/venv/bin/python" SPHINXBUILD="${SRC_DIR}/venv/bin/sphinx-build -W"

	find ${SRC_DIR}/venv/bin -type f -exec sed -i "s|${SRC_DIR}|/opt/${_pkgname}|g" {} \;
}

package() {
	local SRC_DIR=${srcdir}/${_pkgname}-${pkgver}
	local PKG_DIR=${pkgdir}/opt/${_pkgname}
	local IMG_DIR=${pkgdir}/usr/share/icons/hicolor

	install -dm 755 ${PKG_DIR}
	install -dm 755 ${IMG_DIR}/{256x256,48x48,32x32,16x16}/apps

	cp -rp ${SRC_DIR}/* ${PKG_DIR}/

	install -Dm 644 ${srcdir}/arch_additions.py -t ${PKG_DIR}/web/
	
	convert ${SRC_DIR}/runtime/assets/pgAdmin4.png -resize 256x256 ${IMG_DIR}/256x256/apps/pgAdmin4.png
	convert ${SRC_DIR}/runtime/assets/pgAdmin4.png -resize 48x48 ${IMG_DIR}/48x48/apps/pgAdmin4.png
	convert ${SRC_DIR}/runtime/assets/pgAdmin4.png -resize 32x32 ${IMG_DIR}/32x32/apps/pgAdmin4.png
	convert ${SRC_DIR}/runtime/assets/pgAdmin4.png -resize 16x16 ${IMG_DIR}/16x16/apps/pgAdmin4.png

	install -Dm 644 ${srcdir}/pgAdmin4.desktop -t ${pkgdir}/usr/share/applications
	install -Dm 755 ${srcdir}/pgadmin4 -t ${pkgdir}/usr/bin
	
	install -Dm 644 ${SRC_DIR}/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
