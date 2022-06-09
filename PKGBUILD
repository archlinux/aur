pkgname=libxft-bgra-git
_dir=libxft
pkgver=2.3.4.r126.06a3c0a
pkgrel=1
pkgdesc="libXft with BGRA glyph (color emoji) rendering & scaling patches by Maxime Coste"
arch=('x86_64')
license=('custom')
groups=('modified')
provides=('libxft')
conflicts=('libxft')
url="https://gitlab.freedesktop.org/xorg/lib/libxft.git"
depends=('fontconfig' 'libxrender' 'curl' 'xorg-util-macros')
makedepends=('git' 'pkgconf')
source=("git+$url" '1.patch')
md5sums=('SKIP' '49c10bb362132e2c0e37296ae95db279')

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk '/^Version/ {print $2}' NEWS | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_dir}"
    patch -p1 < ../1.patch
    sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "${_dir}"
    make DESTDIR="${pkgdir}" install
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
