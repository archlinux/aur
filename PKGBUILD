# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=kconfig-frontends-git
_pkgname=${pkgname%-git}
pkgver=r279.gdf6a283
pkgrel=1
pkgdesc='Linux kernel-style Kconfig parser and configuration frontends for third-party projects (Git)'
arch=('x86_64' 'i686')
url="https://gitlab.com/ymorin/kconfig-frontends/"
license=('GPL')
depends=('python' 'perl')
makedepends=('gperf')
source=("git+https://gitlab.com/arkades.org/kconfig-frontends.git"
        "kconfig-config2h")
noextract=()
sha512sums=('SKIP'
         '2704d58e009e79a6ba098876dfca8dfc34da086d792b497424a73a679aeb97bc002d4267cc44422401b06338c42bc8651fdbede20779bae9c06a00590fe14234')

pkgver() {
    cd "$_pkgname"
    printf 'r%s.g%s\n' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	autoreconf -fi
	./configure --prefix=/usr --enable-frontends=mconf,conf,nconf
	make
}

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 -t ${pkgdir}/usr/bin kconfig-config2h
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
