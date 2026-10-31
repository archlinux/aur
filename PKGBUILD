# Maintainer: Anton Filimonov <anton.filimonov@gmail.com>
# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=klogg-git
pkgver=26.10.21.1343.0721ca7
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
# comment: SoftExpert <softexpert at gmail dot com>
# unfortunately, the original repo at https://github.com/variar/klogg does not have any activity in more than 2 years
# I switched to a maintained fork
_activefork='https://github.com/ZEACENT/klogg'
license=('GPL-3.0-only')
provides=('klogg')
conflicts=('klogg')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'qt6-5compat'
    'qt6-svg'
    'hicolor-icon-theme'
    'xxhash'
    'uchardet'
    'tbb'
)
makedepends=('cmake' 'git' 'qt6-tools' )

source=("klogg-${pkgver}-src.tar.gz::${_activefork}/archive/refs/tags/continuous.tar.gz")
sha256sums=('6ece81da1681836477d6386d3b5cbeb9bacb558aac7d3184996fd29923c8f6ea')

pkgver() {
  # retrieve latest tag version
  local _latestver=$(git ls-remote --tags ${_activefork}.git | awk '{print $2}' | sed 's|refs/tags/||' | sort -V | tail -1 | sed 's/^v//')
  
  # retrieve latest commit hash
  local _latesthash=$(git ls-remote ${_activefork}.git HEAD | awk '{print substr($1,1,7)}')
  
  # combine them into the version string
  echo "${_latestver}.${_latesthash}"
}

build() {
    KLOGG_VERSION=${pkgver} \
    cmake \
        -B "klogg-continuous/build" \
        -S "klogg-continuous" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_FLAGS="-O2" \
        -DCMAKE_CXX_FLAGS="-O2" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-author \
        -DCPM_USE_LOCAL_PACKAGES=ON \
        -DCPM_SOURCE_CACHE=${srcdir}/cpm_cache \
        -DWARNINGS_AS_ERRORS=OFF \
        -DKLOGG_USE_SENTRY=OFF \
        -DKLOGG_BUILD_TESTS=OFF \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5

    make -C "klogg-continuous/build" klogg
}

package() {
    make -C "klogg-continuous/build" DESTDIR="$pkgdir" install
    install -D -m644 "klogg-continuous/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
