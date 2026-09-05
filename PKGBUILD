# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix
_pkgname=Voix
pkgver=4.12.1
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
makedepends=('cmake>=3.30' 'clang' 'lld' 'ninja' 'pkgconf' 'ccache')
provides=('sudo' 'doas')
conflicts=('sudo' 'doas')
backup=('etc/pam.d/voix' 'etc/voix.conf')
install=voix.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b9701ac2aa903a5eb5dc03b32680560433582d4fc3257817e386d8bc830e585')

build() {
    cd "$_pkgname-$pkgver"
    # ARCH-triggered: native build for x86_64; cross-compile for aarch64
    if [ "$ARCH" = "aarch64" ]; then
        CC=clang CXX=clang++ cmake -B build -G Ninja -Wno-dev \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_SYSCONFDIR=/etc \
            -DENABLE_PERMISSIONS=OFF \
            -DCMAKE_C_FLAGS="--target=aarch64-linux-gnu" \
            -DCMAKE_CXX_FLAGS="--target=aarch64-linux-gnu -std=c++26 -fexperimental-library"
    else
        CC=clang CXX=clang++ cmake -B build -G Ninja -Wno-dev \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_SYSCONFDIR=/etc \
            -DENABLE_PERMISSIONS=OFF
    fi
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
