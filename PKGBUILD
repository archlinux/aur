# Maintainer: Dae Euhwa <daedaevibin@ik.me>
pkgname=voix
_pkgname=Voix # The case-sensitive name of the repository from git
pkgver=2.5.0
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap')
makedepends=('cmake>=4.2' 'clang' 'ninja' 'pkgconf' 'git')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("git+https://github.com/Veridian-Zenith/Voix.git")
sha256sums=('SKIP')


build() {
    cd "$_pkgname"
    CC=clang CXX=clang++ cmake -B build -G Ninja -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc
    cmake --build build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
    # Ensure restrictive config permissions
    install -o root -g root -m 0600 "$pkgdir/etc/voix.conf"
    setcap 'CAP_AUDIT_WRITE,CAP_DAC_READ_SEARCH+eip' "$pkgdir/usr/bin/voix"
}
