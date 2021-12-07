# Maintainer: Donald Carr <sirspudd _at_ gmail dot com>

pkgname=mfgtools-git-noproxy
pkgver=1.4.174.r2.g64ca58f
pkgrel=1
epoch=
pkgdesc="uuu (Universal Update Utility), mfgtools 3.0. Freescale/NXP I.MX Chip image deploy tools."
arch=('x86_64')
url="https://github.com/NXPmicro/mfgtools"
license=('BSD')
groups=()
depends=('bzip2' 'zlib' 'libusb' 'libzip' 'openssl')
makedepends=('cmake' 'git')
checkdepends=()
optdepends=()
provides=('uuu' 'mfgtool')
conflicts=('mfgtools' 'mfgtools-git')
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags |  sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/uuu_//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 /dev/stdin "${pkgdir}/etc/bash_completion.d/uuu-complete.bash" << EOF
_uuu_autocomplete()
{
     COMPREPLY=($(/usr/bin/uuu $1 $2 $3))
}
complete -o nospace -F _uuu_autocomplete  uuu
EOF
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -dm0755  "${pkgdir}/etc/udev/rules.d/"
    ./uuu/uuu -udev > "${pkgdir}/etc/udev/rules.d/70-uuu.rules"

}
