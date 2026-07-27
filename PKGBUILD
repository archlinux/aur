# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix
_pkgname=Voix
pkgver=4.9.1
pkgrel=2
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
makedepends=('cmake>=3.30' 'clang' 'lld' 'ninja' 'pkgconf' 'ccache')
provides=('sudo' 'doas')
conflicts=('sudo' 'doas')
backup=('etc/pam.d/voix' 'etc/voix.conf')
install=voix.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('599f18357ab35bb5c134c72df513af7e7b9fdef793ca6ae6887fd3d6f51a31ca')

build() {
    cd "$_pkgname-$pkgver"
    CC=clang CXX=clang++ cmake -B build -G Ninja -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DENABLE_PERMISSIONS=OFF
    cmake --build build
}

package() {
    cd "$_pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    chown root:root "$pkgdir/usr/bin/voix"
    chmod 4755 "$pkgdir/usr/bin/voix"

    mkdir -p "$pkgdir/var/lib/voix"

    ln -sf /usr/bin/voix "$pkgdir/usr/bin/sudo"
    ln -sf /usr/bin/voix "$pkgdir/usr/bin/doas"
}
