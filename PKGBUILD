# Maintainer: Dae Euhwa <daedaevibin@ik.me>
pkgname=voix
_pkgname=Voix # The case-sensitive name of the repository from git
pkgver=4.1.1
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap')
makedepends=('cmake>=3.18' 'clang' 'llvm' 'ninja' 'pkgconf' 'git' 'yaml-cpp' 'ccache')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("git+https://github.com/Veridian-Zenith/Voix.git#tag=v$pkgver")
sha256sums=('bcbfa157c8e6e64e13dd33686e2c1d4152f72070905a2e5a18bceaee28b0be61')


build() {
    cd "$_pkgname"
    CC=clang CXX=clang++ cmake -B build -G Ninja -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DENABLE_PERMISSIONS=OFF
    cmake --build build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # Apply permissions manually for AUR packaging
    chown root:root "$pkgdir/usr/bin/voix"
    chmod 4755 "$pkgdir/usr/bin/voix"
}
