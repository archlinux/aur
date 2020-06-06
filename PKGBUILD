# Maintainer: AntiCompositeNumber <anticompositenumber+aur at gmail dot com>
# Contributor: Tanner Filip <tannerremovemefilip at gmail dot com>
# For contact, remove "removeme" and replace words with symbols as necessary.
pkgname=huggle-git
pkgver=3.4.10.r29.g40bf0269
pkgrel=1
pkgdesc="Anti-vandalism tool for use on MediaWiki-based projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-multimedia' 'qt5-webengine' 'yaml-cpp')
makedepends=('cmake' 'git')
provides=('huggle')
conflicts=('huggle')
source=(
    "${pkgname}::git+https://github.com/huggle/huggle3-qt-lx.git"
    "git+https://github.com/grumpy-irc/libirc.git"
    "git+https://github.com/huggle/mass-delivery.git"
    "git+https://github.com/huggle/enwiki.git"
    "git+https://github.com/huggle/extension-thanks.git"
    "git+https://github.com/huggle/extension-splitter-helper.git"
    "git+https://github.com/huggle/extension-review.git"
    "git+https://github.com/huggle/extension-mass-delete.git"
    "git+https://github.com/huggle/extension-scoring.git"
    "git+https://github.com/huggle/extension-flow"
    "extensions.patch"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '53f138bca0e4e67376a152c9ba290e3fde19c12ab58e0c7b581460e8ede5ce8c')

prepare() {
    cd "${pkgname}"
    git submodule init src/extensions
    git submodule init src/3rd/libirc
    git config submodule.src/3rd/libirc.url "${srcdir}/libirc"
    git config submodule.src/extensions/mass-delivery.url "${srcdir}/mass-delivery"
    git config submodule.src/extensions/enwiki.url "${srcdir}/enwiki"
    git config submodule.src/extensions/extension-thanks.url "${srcdir}/extension-thanks"
    git config submodule.src/extensions/extension-splitter-helper.url \
        "${srcdir}/extension-splitter-helper"
    git config submodule.src/extensions/extension-review.url "${srcdir}/extension-review"
    git config submodule.src/extensions/extension-mass-delete.url \
        "${srcdir}/extension-mass-delete"
    git config submodule.src/extensions/extension-scoring.url "${srcdir}/extension-scoring"
    git config submodule.src/extensions/extension-flow.url "${srcdir}/extension-flow"
    git submodule update
    git submodule foreach 'git reset --hard'
    patch --forward --strip=1 --input="../extensions.patch"
    cd "src/huggle_core"
    ./update.sh
}

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build \
        -S "${pkgname}/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DATA_DIR="lib/huggle" \
        -DQT5_BUILD=ON \
        -DWEB_ENGINE=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DHUGGLE_EXT=TRUE \
        -Wno-dev \

    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
