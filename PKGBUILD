# Maintainer: wchurch58

pkgname=barrier-fresh
pkgver=2.1.1
pkgrel=1
pkgdesc="Open-source KVM software based on Synergy"
arch=('x86_64')
url="https://github.com/debauchee/barrier"
license=("custom:GPL2WithOpenSSLException")
depends=('curl' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'xorgproto' 'libxtst' 'libxi' 'avahi' 'libsm' 'libice' 
	'openssl' 'qt5-base' 'hicolor-icon-theme')
makedepends=('cmake')

source=('barrier::git+https://github.com/debauchee/barrier')
#0001-Handle-removal-of-cmake-macro-qt5_use_modules.patch

sha256sums=('SKIP')

#prepare() {
# cd barrier
#
#for patch in "${srcdir?}"/*.patch; do
#        patch -Np1 -i "${patch?}"
#    done
#
#}

build() {

mkdir -p barrier/build
    cd barrier/build


cmake -DBARRIER_VERSION_MAJOR=1 -DBARRIER_VERSION_MINOR=9 -DBARRIER_VERSION_PATCH=0 -DBARRIER_VERSION_STAGE=snapshot -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
make -j1

}
package() {
    # Install binaries:
    cd barrier/build
    DESTDIR="${pkgdir?}" make install

    # Install the license:
    cd ..
    install -m 644 -D LICENSE "${pkgdir?}/usr/share/licenses/barrier/LICENSE"

    # Install the manpages:
    mkdir -p "${pkgdir?}/usr/share/man/man1"
    install -m 644 doc/*.1 "${pkgdir?}/usr/share/man/man1"

    # Install the examples:
    mkdir -p "${pkgdir?}/usr/share/doc/barrier"
    install -m 644 doc/barrier.conf* "${pkgdir?}/usr/share/doc/barrier"
}
