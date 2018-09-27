# Maintainer: Bart Verhagen <barrie.verhagen@gmail.com>
pkgname=('exec-helper' 'exec-helper-docs')
pkgbase='exec-helper'
pkgver=0.3.1_0_g57ac486
pkgrel=1
epoch=
pkgdesc="How To Get Coffee In Peace: a shell meta-wrapper"
arch=('i686' 'x86_64')
url="https://github.com/bverhagen/exec-helper"
license=('GPL3')
groups=()
depends=(yaml-cpp boost-libs)
makedepends=(cmake boost make doxygen graphviz git pkg-config microsoft-gsl-git lsb-release)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=exec-helper.changelog
source=('exec-helper::git+https://github.com/bverhagen/exec-helper.git#commit=57ac4862c604976e6c26e745532434379b9d730b')
noextract=()
validpgpkeys=()

_build_dir='build'

pkgver() {
    printf "%s" $pkgver
}

build() {
    _system_description=$(lsb_release --description --short | sed 's/"//g')
    _source_version=0.3.1_0_g57ac486
    _release_version="($_system_description) $_source_version"
    _copyright="Copyright (c) $(date +'%Y') Bart Verhagen"

    _git_dir='exec-helper'
    _exec_helper_build_targets=('exec-helper' 'docs-man')
    _exec_helper_docs_build_targets=('docs-html')

    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_YAML_CPP=ON -DUSE_SYSTEM_GSL=ON -DBUILD_HTML_DOCUMENTATION=ON -DBUILD_MAN_DOCUMENTATION=ON -DENABLE_TESTING=OFF -DENABLE_WERROR=OFF -DVERSION="$_release_version" -DCOPYRIGHT="$_copyright"
    _nb_of_cores=$(grep -c ^processor /proc/cpuinfo)
    make --directory "$_build_dir" --jobs ${_nb_of_cores} ${_exec_helper_build_targets[@]} ${_exec_helper_docs_build_targets[@]}
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
