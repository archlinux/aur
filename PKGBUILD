# Maintainer: June <zanthed@riseup.net>
# Submitter: Viste <viste02@gmail.com>

## Put in any extra CMake arguments here.
## See https://www.azerothcore.org/wiki/cmake-options
_extraargs=''

## If you want to add in your own arguments entirely and replace the default below, fill this in.
_cmakeargs=''

## Compile tools (you will need this)
_DTOOLS=1

## Compile scripts (you will also need this)
_DSCRIPTS=static

_pkgname='azerothcore-wotlk'
pkgname='azerothcore'
pkgver=3.0
pkgrel=5
arch=('x86_64')
pkgdesc="AzerothCore - MMORPG Server. Based on MaNGOS -> TrinityCore -> SunwellCore"
url="http://www.azerothcore.org"
license=('AGPL3')
depends=('cmake' 'clang' 'readline' 'mariadb-libs' 'mariadb' 'git' 'ace' 'boost' 'boost-libs' 'gcc' 'openssl')

source=("git+https://github.com/azerothcore/${_pkgname}.git")
sha512sums=('SKIP')

prepare() {
	_clang=$(which clang)
	_gcc=$(which gcc)
	_clangcxx=$(which clang++)
	_onlinecpus=$(nproc --all)
}

build() {
	cd "${srcdir}/${_pkgname}"
	_acore="$(pwd)"
	mkdir ${_acore}/build && cd ${_acore}/build

	if [ -z "${_cmakeargs}" ]
	then
		if [ -z "${_extraargs}" ]
		then
			cmake ${_acore} -DCMAKE_INSTALL_PREFIX=${_acore} -DCMAKE_C_COMPILER=${_clang} -DCMAKE_CXX_COMPILER=${_clangcxx} -DTOOLS=${_DTOOLS} -DSCRIPTS=${_DSCRIPTS}
		else
			cmake ${_acore} -DCMAKE_INSTALL_PREFIX=${_acore} -DCMAKE_C_COMPILER=${_clang} -DCMAKE_CXX_COMPILER=${_clangcxx} -DTOOLS=${_DTOOLS} -DSCRIPTS=${_DSCRIPTS} ${_extraargs}
		fi
	else
		cmake ${_acore} ${_cmakeargs}
	fi

	make -j$(nproc --all)
}

package() {
	cd ${srcdir}/${_pkgname}/build
	make install
}
