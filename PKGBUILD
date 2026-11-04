# Maintainer: username227 {gfrank227 [at] gmail [dot] com}
pkgname=viper4linux-re-git
pkgver=1.1.0.r160.g0bcf628
pkgrel=1
pkgdesc='Reverse-engineered ViPERDSP effects for PipeWire with a Qt6 interface (development VCS build)'
arch=('x86_64')
url='https://github.com/username227/viper4linux-re'
license=('MIT' 'LicenseRef-ViPERDSP')
depends=('glibc' 'gcc-libs' 'qt6-base' 'pipewire' 'ladspa' 'python')
makedepends=('git' 'cmake' 'pkgconf')
conflicts=('viper4linux-re' 'viper4linux' 'viper4linux-git')
provides=('viper4linux-re')
_app_git_url="${VIPER4LINUX_GIT_URL:-https://github.com/username227/viper4linux-re.git}"
source=("viper4linux::git+${_app_git_url}"
        "ViPERDSP::git+https://github.com/likelikeslike/ViPERDSP.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/viper4linux"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/viper4linux"
    git config submodule.third_party/ViPERDSP.url "$srcdir/ViPERDSP"
    git -c protocol.file.allow=always submodule update --init --checkout -- third_party/ViPERDSP
}


build() {
    cmake -S "$srcdir/viper4linux" -B "$srcdir/viper4linux-build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVIPER_ENABLE_SYSTEM_INSTALL=ON \
        -DVIPER_SYSTEM_INSTALL_LAYOUT=arch \
        -DVIPER_SYSTEM_PACKAGE_NAME="$pkgname"

    cmake --build "$srcdir/viper4linux-build"
}

check() {
    cd "$srcdir/viper4linux"
    bash tests/check-package.sh
    nm -D "$srcdir/viper4linux-build/viper_dsp_ladspa.so" |
        grep -Eq ' [TW] ladspa_descriptor$'
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/viper4linux-build"
}

