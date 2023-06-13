# Maintainer: Anton Filimonov <anton.filimonov@gmail.com>

pkgname=klogg-git
pkgver=23.06.0.1419
_subversion=0
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt6-base' 'hicolor-icon-theme' 'hyperscan' 'xxhash' 'uchardet' 'tbb')
makedepends=('cmake' 'git' 'qt6-tools' )

_klogg_version=`curl -L -s https://github.com/variar/klogg/releases/download/continuous-linux/klogg_version.txt`
_klogg_sha256=`curl -L -s https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_klogg_version}-sha256.txt | cut -c1-64 | head -n2`
source=("klogg-${_klogg_version}-src.tar.gz::https://github.com/variar/klogg/archive/refs/tags/continuous-linux.tar.gz"
        "https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_klogg_version}-deps.tar.xz")
sha256sums=("SKIP"
            "$(echo ${_klogg_sha256} | cut -d\  -f2)")

pkgver() {
  echo $_klogg_version
}

build() {
    KLOGG_VERSION=${_klogg_version} \
    cmake \
        -B "klogg-continuous-linux/build" \
        -S "klogg-continuous-linux" \
        -DCMAKE_BUILD_TYPE='RelWithDebugInfo' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCPM_USE_LOCAL_PACKAGES=ON \
        -DCPM_SOURCE_CACHE=${srcdir}/cpm_cache \
        -DWARNINGS_AS_ERRORS=OFF \
        -DKLOGG_USE_SENTRY=OFF \
        -DKLOGG_BUILD_TESTS=OFF

    make -C "klogg-continuous-linux/build" klogg
}

package() {
    make -C "klogg-continuous-linux/build" DESTDIR="$pkgdir" install
    install -D -m644 "klogg-continuous-linux/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

