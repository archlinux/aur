# Author: butaford <butaford@gmail.com>
pkgname=rcon-git
_pkgname=rcon
pkgver=0.6
_pkgvergit=e7e2d9b
pkgrel=1
pkgdesc="Rcon is a command line application that can be used as a Source RCON client. It will send commands to the given server, and print the reply to stdout."
arch=('any')
url="https://github.com/n0la/${_pkgname}"
license=('BSD 2-Clause')
depends=()
makedepends=('cmake' 'git' 'check' 'libbsd' 'glib2' 'bash-completion')
source=("git+https://github.com/n0la/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
	git describe --tags `git rev-list --tags --max-count=1`
}

prepare() {
    cd "$srcdir/${_pkgname}"
    git checkout ${_pkgvergit}
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
