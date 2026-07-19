# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix
_pkgname=Voix
pkgver=4.9.0
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
makedepends=('cmake>=3.18' 'clang' 'llvm' 'lld' 'ninja' 'pkgconf' 'git' 'ccache')
provides=('sudo' 'doas')
conflicts=('sudo' 'doas')
backup=('etc/pam.d/voix' 'etc/voix.conf')
install=voix.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4ff28b1140da54ca78625c753801b4cddb04605d7c96b6ca904faf8d483f795541af9632d344dc4f8958ba839f16496ccb64249c6536ae421fa3579a6f5723ad')

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
