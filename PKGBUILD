# Maintainer: Sergey V. Zhdanovskih (aka Norseman) <gedkeeper@yandex.ru>


_gitname=GEDKeeper
_communicator=GKCommunicator
_genetix=GKGenetix
_pkgname=gedkeeper
pkgname=${_pkgname}-git
pkgver=v3.4.1.r56.gabd903ba
pkgrel=2
pkgdesc="Personal genealogical database editor"
arch=('x86_64' 'i686')
url="https://github.com/serg-norseman/gedkeeper"
license=('GPLv3')
depends=('sqlite3' 'dotnet-runtime-6.0' 'lua')
makedepends=('dotnet-sdk-6.0')

provides=("gedkeeper=${pkgver}")
source=("git+https://github.com/Serg-Norseman/${_gitname}.git"
"git+https://github.com/Serg-Norseman/${_communicator}.git"
"git+https://github.com/Serg-Norseman/${_genetix}.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule init
  git config submodule.projects/GKCommunicator.url "${srcdir}/${_communicator}"
  git config submodule.projects/GKGenetix.url "${srcdir}/${_genetix}"
  git -c protocol.file.allow=always submodule update
}

build() {
	cd "${srcdir}"
	dotnet build "${_gitname}/projects/GKv3/GEDKeeper3.sln" --configuration Release -p:Platform="Linux" --no-self-contained
}

package() {
	BASE_PATH="${srcdir}/${_gitname}"
	BIN_PATH="${pkgdir}/usr/bin"
	LIB_PATH="${pkgdir}/usr/lib/gedkeeper"
	EXT_PATH="${pkgdir}/usr/share/gedkeeper/externals"
	
	rm -rf ${pkgdir}

	mkdir -p ${pkgdir}
	mkdir -p $BIN_PATH
	mkdir -p $LIB_PATH
	mkdir -p $EXT_PATH

	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/mime/packages
	mkdir -p ${pkgdir}/usr/share/metainfo/
	
	cp ${BASE_PATH}/deploy/gk_run.sh $BIN_PATH/gedkeeper
	chmod a+x $BIN_PATH/gedkeeper

	cp ${BASE_PATH}/deploy/gedkeeper.png $LIB_PATH
	cp ${BASE_PATH}/deploy/gedkeeper.png ${pkgdir}/usr/share/pixmaps
	cp ${BASE_PATH}/deploy/gedkeeper.desktop ${pkgdir}/usr/share/applications
	sed -i 's/gk_run.sh/gedkeeper/g' ${pkgdir}/usr/share/applications/gedkeeper.desktop
	cp ${BASE_PATH}/deploy/application-x-gedkeeper.xml ${pkgdir}/usr/share/mime/packages
	cp ${BASE_PATH}/deploy/gedkeeper.appdata.xml ${pkgdir}/usr/share/metainfo/

	cp ${BASE_PATH}/LICENSE $LIB_PATH

	cp -r ${BASE_PATH}/bin/ $LIB_PATH/
	cp -r ${BASE_PATH}/plugins/ $LIB_PATH/
	rm -r $LIB_PATH/plugins/runtimes
	rm -r $LIB_PATH/bin/*.so

	cp -r ${BASE_PATH}/backgrounds/ $LIB_PATH/
	cp -r ${BASE_PATH}/externals/resources.yaml $EXT_PATH/
	cp -r ${BASE_PATH}/locales/ $LIB_PATH/
	cp -r ${BASE_PATH}/samples/ $LIB_PATH/
	cp -r ${BASE_PATH}/scripts/ $LIB_PATH/
	cp -r ${BASE_PATH}/themes/ $LIB_PATH/

	find $LIB_PATH/bin -type f -iname "*.dll" -exec chmod -x {} \;
	find $LIB_PATH/plugins -type f -exec chmod -x '{}' \;

	find $LIB_PATH/backgrounds -type f -exec chmod -x '{}' \;
	find $EXT_PATH -type f -exec chmod -x '{}' \;
	find $LIB_PATH/locales -type f -exec chmod -x '{}' \;
	find $LIB_PATH/samples -type f -exec chmod -x '{}' \;
	find $LIB_PATH/scripts -type f -exec chmod -x '{}' \;
	find $LIB_PATH/themes -type f -exec chmod -x '{}' \;

	chmod -x $LIB_PATH/LICENSE
	chmod -x $LIB_PATH/gedkeeper.png
	chmod -x ${pkgdir}/usr/share/pixmaps/gedkeeper.png
	chmod -x ${pkgdir}/usr/share/applications/gedkeeper.desktop
	chmod -x ${pkgdir}/usr/share/mime/packages/application-x-gedkeeper.xml
	chmod -x ${pkgdir}/usr/share/metainfo/gedkeeper.appdata.xml
}
