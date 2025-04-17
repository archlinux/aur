# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# this is based off https://aur.archlinux.org/packages/xfce4-notifyd-git

pkgname='bspsrc-git'
pkgver=1.4.7.r8.g95dbdb8
pkgrel=1
pkgdesc='map decompiler for source engine maps, written in java. git branch'
arch=('x86_64')
license=('Unlicense')
url='https://github.com/ata4/bspsrc'
groups=()
depends=('java-runtime>=22')
makedepends=('maven' 'java-environment>=22' 'git')
conflicts=()
provides=('bspsrc' 'bspinfo')
options=()
install=''
source=('git+https://github.com/ata4/bspsrc' 'bspinfo.sh' 'bspsrc.sh' 'bspinfo.desktop' 'bspsrc.desktop')
sha256sums=('SKIP'
            '2949c9560421b1e144ecb6100dd260512f034481890ba9edb262612f2d28f7bd'
            '3823c483bfe98d3f69ab2000cba21cf84359b330d95b2d7f7077ac0ca22dfc90'
            'cf154d0eacccff31ec1adec423764cd659bdf5adb3233c18418b537d8ca4aa60'
            '08fee4250d05734038cc263e11d1168db30c7a26a76ff3195b94701e3fae7810')
_REMOVE_START_V=('grep' '-Po' '(?:(?<=\A[v])|(?<=\A(?=[^v])))[\w\.]*(?=[\-]?[\w]*\Z)')
_GET_MAVEN_PROJECT_VER=('mvn' 'help:evaluate' '-Dexpression=project.version' '-q' '-DforceStdout')

pkgver() {
        cd "${srcdir}/bspsrc/"
	local _GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
	local _PROJVER="$(${_GET_MAVEN_PROJECT_VER[@]} 2>/dev/null)"
        local _BASEVER="$(echo "${_PROJVER}" | ${_REMOVE_START_V[@]})" 
	echo "${_PROJVER}" > mvnprojdir.txt
	local _GIT_REV_COUNT="$(git rev-list --count ${_GITTAG}..)"
	local _LATEST_GIT_COMMIT="$(git log -1 --format="%h")"
	echo "${_BASEVER}.r${_GIT_REV_COUNT}.g${_LATEST_GIT_COMMIT}"
}

build() {
	cd "${srcdir}/bspsrc/"
	mvn package
}

package() {
	local _MAVEN_PROJECT_VER="$(cat "${srcdir}/bspsrc/mvnprojdir.txt")"
	local _SHARE_FOLDER="${pkgdir}/usr/share/bspsrc"
	install -Dm 644 "${srcdir}/bspsrc/bspsrc-app/target/bspsrc-app-${_MAVEN_PROJECT_VER}-shaded.jar" "${_SHARE_FOLDER}/bspsrc-app-shaded.jar"
	install -Dm 755 "${srcdir}/bspinfo.sh" "${pkgdir}/usr/bin/bspinfo"
	install -Dm 755 "${srcdir}/bspsrc.sh" "${pkgdir}/usr/bin/bspsrc"
	install -Dm 755 "${srcdir}/bspsrc/icons/BSPsource.png" "${_SHARE_FOLDER}/BSPSourceIcon.png"
	install -Dm 755 "${srcdir}/bspsrc/icons/BSPInfo.png" "${_SHARE_FOLDER}/BSPInfoIcon.png"
	install -Dm 755 "${srcdir}/bspsrc.desktop" "${pkgdir}/usr/share/applications/bspsrc.desktop"
	install -Dm 755 "${srcdir}/bspinfo.desktop" "${pkgdir}/usr/share/applications/bspinfo.desktop"
}
	
