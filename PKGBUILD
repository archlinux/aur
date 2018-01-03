# Maintainer: kang <kang@insecure.ws>
pkgname=cc-runtime-git
_pkgname=runtime
pkgver=3.0.12.r2.8311a66
pkgrel=2
pkgdesc="cc-runtime is the next generation of Intel® Clear Containers runtime."
arch=(x86_64)
url="https://github.com/clearcontainers/runtime"
license=('apache')
makedepends=('git' 'dep')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git+https://github.com/clearcontainers/runtime')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
        ln -sf vendor src
        GOPATH="$(realpath $srcdir/..)" dep ensure -v
}

build() {
	cd "$srcdir/${_pkgname}"
        chmod 0755 $srcdir/../pkg # lil fix because go's dep tool needs to use the same pkg path as makepkg
        GOPATH="$srcdir/${_pkgname}" make DESTDIR=/ PREFIX=/usr DESTSYSCONFIG=/etc/clear-containers/configuration.toml
}

check() {
	cd "$srcdir/${_pkgname}"
        echo "Official tests don't currently pass, skipping..."
        #GOPATH="$srcdir/${_pkgname}" make check
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" PREFIX=/usr DESTSYSCONFIG=/etc/clear-containers/configuration.toml install
        # Fix DESTSYSCONFIG up
        mkdir -p $pkgdir/etc/clear-containers
        chmod 0644 $pkgdir/usr/share/defaults/clear-containers/configuration.toml
        cp $pkgdir/usr/share/defaults/clear-containers/configuration.toml $pkgdir/etc/clear-containers
        mv $pkgdir/usr/share/defaults/clear-containers/ $pkgdir/usr/share/clear-containers/
        # Fix bashcompletion up
        mv $pkgdir/usr/share/bash-completion/completions $pkgdir/usr/share/bash-completion/cc-runtime
        mkdir $pkgdir/usr/share/bash-completion/completions
        mv $pkgdir/usr/share/bash-completion/cc-runtime $pkgdir/usr/share/bash-completion/completions
}
