# Author: butaford <butaford@gmail.com>
pkgname=rcon-git
pkgver=0.5
pkgrel=4
pkgdesc="Rcon is a command line application that can be used as a Source RCON client. It will send commands to the given server, and print the reply to stdout."
arch=('any')
url="https://github.com/n0la/rcon"
license=('BSD 2-Clause')
depends=()
makedepends=('cmake' 'git' 'check' 'libbsd' 'glib2' 'bash-completion')
source=("git+git://github.com/n0la/rcon.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	git describe --tags `git rev-list --tags --max-count=1`
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DINSTALL_BASH_COMPLETION=ON \
		-DCOMPLETIONS_DIR=/usr/share/bash-completion/completions
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install

    # Install the UNLICENSE because Arch has no pre-defined license for Public
    # Domain
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
