# Maintainer: Bart Verhagen <barrie.verhagen@gmail.com>
pkgname=('exec-helper' 'exec-helper-docs')
pkgbase='exec-helper'
pkgver=0.6.0_0_g8869989
pkgrel=1
epoch=
pkgdesc="How To Get Coffee In Peace: a shell meta-wrapper"
arch=('i686' 'x86_64')
url="https://github.com/bverhagen/exec-helper"
license=('GPL3')
groups=()
depends=(yaml-cpp boost-libs)
makedepends=(cmake boost make python-sphinx python-sphinx_rtd_theme git pkg-config microsoft-gsl lsb-release)
checkdepends=(catch2 rapidcheck)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=exec-helper.changelog
source=('exec-helper::git+https://github.com/bverhagen/exec-helper.git#commit=8869989a59b352f340406ae8859958bf343be776')
noextract=()
validpgpkeys=()

_build_dir='build'

_nb_of_cores=$(grep -c ^processor /proc/cpuinfo)

pkgver() {
    printf "%s" $pkgver
}

build() {
    _system_description=$(lsb_release --description --short | sed 's/"//g')
    _source_version=0.6.0_0_g8869989
    _release_version="($_system_description) $_source_version"
    _copyright="Copyright (c) $(date +'%Y') Bart Verhagen"

    _git_dir="exec-helper"
    _exec_helper_build_targets=('exec-helper' 'docs-man')
    _exec_helper_docs_build_targets=('docs-html')

    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_YAML_CPP=ON -DUSE_SYSTEM_GSL=ON -DBUILD_USAGE_DOCUMENTATION=ON -DBUILD_API_DOCUMENTATION=OFF -DENABLE_TESTING=OFF -DENABLE_WERROR=OFF -DVERSION="$_release_version" -DCOPYRIGHT="$_copyright" -DACTUAL_PLUGINS_INSTALL_PREFIX=/usr/share/exec-helper/plugins
    make --directory "$_build_dir" --jobs ${_nb_of_cores} ${_exec_helper_build_targets[@]} ${_exec_helper_docs_build_targets[@]}
}

check() {
    _install_dir="$pkgdir/usr/"
    $_build_dir/src/applications/exec-helper --help 2>/dev/null | grep --silent 'Usage'
    $_build_dir/src/applications/exec-helper --version 2>/dev/null | grep --silent 'exec-helper'
	$_build_dir/src/applications/exec-helper --list-plugins "--additional-search-path=$_git_dir/src/plugins/src/scripts" 2>/dev/null | grep --silent 'make.lua'
}

package_exec-helper() {
    cmake -DCOMPONENT=runtime -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake"
    cmake -DCOMPONENT=docs-man -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake"
}

package_exec-helper-docs() {
	# options and directives that can be overridden
	pkgdesc="HTML API documentation for exec-helper"
    arch=('any')
	depends=()

    cmake -DCOMPONENT=docs-html -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake"
}

md5sums=('SKIP')
