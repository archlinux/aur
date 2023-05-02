pkgname=qcm-git
pkgver=r53.4e4d6de
pkgrel=1
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
    'extra-cmake-modules'
    'ninja')
provides=("qcm")
source=('git+https://github.com/hypengw/Qcm.git' 'dark-mode.patch')
sha256sums=('SKIP' 'SKIP')

function prepare(){
    cd "${srcdir}"/Qcm
    patch --forward --strip=1 --input="${srcdir}/dark-mode.patch"
}

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
    install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.hypengw.Qcm.svg"
    install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.desktop" "${pkgdir}/usr/share/applications/Qcm.desktop"
    install -Dm755 "${srcdir}/Qcm/build/app/Qcm" "${pkgdir}/usr/bin/Qcm"
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
sha256sums=('SKIP'
            '10da1a403bb52442107e68e6dbba1eabf8a922135ae82e2cb2758901994feb88')
