# Author: butaford <butaford@gmail.com>
pkgname=rcon-git
pkgver=0.4.r16.g3718e63
pkgrel=1
pkgdesc="Rcon is a command line application that can be used as a Source RCON client. It will send commands to the given server, and print the reply to stdout."
arch=('i686' 'x86_64')
url="https://github.com/n0la/rcon"
license=('BSD' '2-Clause')
depends=()
makedepends=('cmake' 'git' 'check' 'libbsd' 'glib2')
source=("git+git://github.com/n0la/rcon.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DINSTALL_BASH_COMPLETION=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install

    # Install the UNLICENSE because Arch has no pre-defined license for Public
    # Domain
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
