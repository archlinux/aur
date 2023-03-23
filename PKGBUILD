pkgname=qcm-git
pkgver=r25.5d17e9b
pkgrel=2
pkgdesc="Qt client for netease cloud music "
arch=('x86_64')
url="https://github.com/hypengw/Qcm"
License=('GPL2.0')
depends=(
    'qt6-base'
    'hicolor-icon-theme'
    'curl'
    'openssl'
    'qt6-tools'
    'qt6-multimedia')
makedepends=(
    'git'
    'cmake'
    'ninja')
provides=("qcm")
source=('git+https://github.com/hypengw/Qcm.git')
sha256sums=('SKIP')

function pkgver(){
    cd Qcm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build(){
    if [ -d "${srcdir}"/Qcm/build ]; then
        _info "Deleting ${srcdir}/Qcm/build"
        rm -r "${srcdir}"/Qcm/build
    fi
    _info "Starting Build..."
    cd Qcm
    git submodule update --init
    mkdir build
    cd build
    cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release
    ninja
}

function package(){
    _info "Copying files"
    mkdir -p "${pkgdir}"/opt/Qcm
    mkdir -p "${pkgdir}"/usr/bin
    cp "${srcdir}"/Qcm/build/app/Qcm "${pkgdir}"/opt/Qcm
    echo '''#!/bin/bash
"${pkgdir}"/opt/Qcm/Qcm "$@"
''' >"${pkgdir}"/usr/bin/Qcm
    chmod +x "${pkgdir}" -R
}

function _info() {
	if [ -f /usr/bin/pamac ]; then
		echo "  ==> [Info]: $@"
	else
		all_off="$(tput sgr0)"
		bold="${all_off}$(tput bold)"
		blue="${bold}$(tput setaf 4)"
		yellow="${bold}$(tput setaf 3)"
		printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
    fi
}
