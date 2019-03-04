# Maintainer: Bart Verhagen <barrie.verhagen@gmail.com>
pkgname=('exec-helper-git' 'exec-helper-git-docs')
pkgbase='exec-helper-git'
pkgver=0.4.0_0_gde0cb04
pkgrel=1
epoch=
pkgdesc="How To Get Coffee In Peace: a shell meta-wrapper"
arch=('i686' 'x86_64')
url="https://github.com/bverhagen/exec-helper"
license=('GPL3')
groups=()
depends=(yaml-cpp boost-libs)
makedepends=(cmake boost make doxygen graphviz git pkg-config microsoft-gsl-git lsb-release)
checkdepends=(catch2 rapidcheck)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=exec-helper.changelog
source=('exec-helper::git+https://github.com/bverhagen/exec-helper.git#commit=de0cb04beee38af0ffef7d9988d56727e14bc0d4')
noextract=()
validpgpkeys=()

_build_dir='build'

_nb_of_cores=$(grep -c ^processor /proc/cpuinfo)

pkgver() {
    printf "%s" $pkgver
}

build() {
    _system_description=$(lsb_release --description --short | sed 's/"//g')
    _source_version=0.4.0_0_gde0cb04
    _release_version="($_system_description) $_source_version"
    _copyright="Copyright (c) $(date +'%Y') Bart Verhagen"

    _git_dir='exec-helper'
    _exec_helper_build_targets=('exec-helper' 'docs-man')
    _exec_helper_docs_build_targets=('docs-html')

    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_YAML_CPP=ON -DUSE_SYSTEM_GSL=ON -DBUILD_HTML_DOCUMENTATION=ON -DBUILD_MAN_DOCUMENTATION=ON -DENABLE_TESTING=OFF -DENABLE_WERROR=OFF -DVERSION="$_release_version" -DCOPYRIGHT="$_copyright"
    make --directory "$_build_dir" --jobs ${_nb_of_cores} ${_exec_helper_build_targets[@]} ${_exec_helper_docs_build_targets[@]}
}

check() {
    # It only makes sense to run the complete 'system test suite' (called integration by exec-helper devs) here
    _exec_helper_test_targets=('integration' 'execution-content' 'docs-man-integration')

    # Only define the cmake settings on top of the ones defined in build()
    cmake -H"$_git_dir" -B"$_build_dir" -DUSE_SYSTEM_CATCH=ON -DUSE_SYSTEM_RAPIDCHECK=ON -DENABLE_TESTING=ON -DENABLE_WERROR=OFF
    make --directory "$_build_dir" --jobs ${_nb_of_cores} ${_exec_helper_test_targets[@]}

    _install_dir="$pkgdir/usr/"
    PATH="${PWD}/$_build_dir/src/applications:${PWD}/$_build_dir/test/base-utils/application/:$PATH" "$_build_dir/test/integration/exec-helper-integration-test"
}

package_exec-helper-git() {
    cmake -DCOMPONENT=runtime -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake"
    cmake -DCOMPONENT=docs-man -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake"
}

package_exec-helper-git-docs() {
	# options and directives that can be overridden
	pkgdesc="HTML API documentation for exec-helper"
    arch=('any')
	depends=()

    cmake -DCOMPONENT=docs-html -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake"
}

md5sums=('SKIP')
