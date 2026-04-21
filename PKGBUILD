# Maintainer: Dae Euhwa <daedaevibin@ik.me>
pkgname=voix
_pkgname=Voix # The case-sensitive name of the repository from git
pkgver=4.1.2
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
makedepends=('cmake>=3.18' 'clang' 'llvm' 'ninja' 'pkgconf' 'git' 'ccache')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("git+https://github.com/Veridian-Zenith/Voix.git#tag=v$pkgver")
sha256sums=('a6ff973e8d8daf3069ad4533c896b4777cdaee075a7dadb5f34d6a4475165787')


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
