# Maintainer: Dae Euhwa <daedaevibin@ik.me>
pkgname=voix
_pkgname=Voix # The case-sensitive name of the repository from git
pkgver=4.3.0
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
provides=('sudo' 'doas')
conflicts=('sudo' 'doas')
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp' 'ccache' 'llvm' 'clang' 'mold' 'audit')
makedepends=('cmake>=3.18' 'clang' 'llvm' 'ninja' 'pkgconf' 'git' 'ccache' 'mold')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("https://github.com/Veridian-Zenith/Voix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('78169da8e32f90a71bd5a6481875c00658817b56ed4a9376fc536a3f84363a30')

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

    # Apply permissions manually for AUR packaging
    chown root:root "$pkgdir/usr/bin/voix"
    chmod 4755 "$pkgdir/usr/bin/voix"

    # Create compatibility symlinks
    ln -sf /usr/bin/voix "$pkgdir/usr/bin/sudo"
    ln -sf /usr/bin/voix "$pkgdir/usr/bin/doas"
}
