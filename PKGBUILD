# Maintainer: TheCyberArcher@protonmail.ch>
# Contributor: skydrome <skydrome@i2pmail.org>

_pkgname=torsocks
pkgname=${_pkgname}-git
pkgver=2.5.0.r601.7868aab
pkgrel=1
pkgdesc='Torsocks allows you to use most socks-friendly applications in a safe way with Tor.'
url='https://gitlab.torproject.org/tpo/core/torsocks.git'
license=('GPL-2.0-only')
arch=('i686' 'x86_64')
conflicts=('torsocks')
provides=('torsocks')
backup=('etc/tor/torsocks.conf')
source=("git+https://gitlab.torproject.org/tpo/core/torsocks.git")
makedepends=('git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd torsocks
    ./autogen.sh
}

build() {
    cd torsocks
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc
    make
}

check() {
    cd torsocks
    make check
}

package() {
    cd torsocks
    make DESTDIR="$pkgdir" install
    install -Dm644 extras/torsocks-bash_completion "$pkgdir/usr/share/bash-completion/completions/torsocks"
    install -Dm644 extras/torsocks-zsh_completion  "$pkgdir/usr/share/zsh/site-functions/_torsocks"
}
