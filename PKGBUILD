# Maintainer: Hill YU <hillyunews@gmail.com>
# Contributor: favonia <favonia@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=syncthing-inotify-git
_pkgname=syncthing-inotify
pkgver=0.8.5.r24.gaf6fbf9
pkgrel=1
pkgdesc="Inotify file watcher for Syncthing"
url="https://github.com/syncthing/syncthing-inotify"
license=('MPL')
arch=(any)
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('syncthing')
makedepends=('git' 'go' 'godep')
source=("$_pkgname-$pkgver::git+https://github.com/syncthing/syncthing-inotify.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/src/github.com/syncthing/${_pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
    mkdir -p "src/github.com/syncthing"
    mv "${_pkgname}-${pkgver}" "src/github.com/syncthing/${_pkgname}"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/syncthing/${_pkgname}"
    go get
    go get -u github.com/FiloSottile/gvt
    ${srcdir}/bin/gvt update github.com/zillode/notify
    go build
}


package() {
    cd "${srcdir}/src/github.com/syncthing/${_pkgname}"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "etc/linux-systemd/user/syncthing-inotify.service" "${pkgdir}/usr/lib/systemd/user/syncthing-inotify.service"
    install -Dm644 "etc/linux-systemd/system/syncthing-inotify@.service" "${pkgdir}/usr/lib/systemd/system/syncthing-inotify@.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
