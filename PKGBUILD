# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix
_pkgname=Voix
pkgver=4.13.3
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

# The tagged source tarball is published together with a detached, armored GPG
# signature (<artifact>.asc), which makepkg verifies against validpgpkeys before
# anything is extracted or built.
#
# Primary ed25519 release key (full 40-character fingerprint):
#   7887165D6B07DE7785BD536E5239ACB42207EE03   Dae Euhwa <daedaevibin@ik.me>
# Published on keys.openpgp.org. Import it before building if it is missing:
#   gpg --recv-keys 7887165D6B07DE7785BD536E5239ACB42207EE03
# AUR helpers (paru/yay) fetch a missing validpgpkey automatically.
validpgpkeys=('7887165D6B07DE7785BD536E5239ACB42207EE03')

# The signed source archive is a byte-identical copy of the GitHub tag tarball
# and unpacks as Voix-${pkgver}/, matching the `cd` in build() below.
source=(
    "voix-src-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/voix-src-${pkgver}.tar.gz"
    "voix-src-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/voix-src-${pkgver}.tar.gz.asc"
)
sha256sums=('519e6835cee9b4efe1b18656a636bb37ff3e3ce8392d066ba80985f96756f32f'
            'SKIP')

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
