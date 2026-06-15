# Maintainer: Dae Euhwa <daedaevibin@ik.me>
pkgname=voix
_pkgname=Voix # The case-sensitive name of the repository from git
pkgver=4.3.3
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
provides=('sudo' 'doas')
conflicts=('sudo' 'doas')
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
makedepends=('cmake>=3.18' 'clang' 'llvm' 'ninja' 'pkgconf' 'git' 'ccache' 'mold')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("https://github.com/Veridian-Zenith/Voix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32261635b513fd51bc3f79c83014733a763fae17080b582f6b8df14b3a981a13')

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
