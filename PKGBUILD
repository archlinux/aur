# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=try-git
pkgver=r204.b63d1e7
pkgrel=1
pkgdesc="Run a command and inspect its effects before changing your live system."
arch=('x86_64')
url="https://github.com/binpash/try"
license=('MIT')
depends=('bash' 'glibc' 'mergerfs')
makedepends=('git' 'pandoc')
checkdepends=('bash' 'curl' 'expect')
optdepends=('bash-completion: to have CLI completions')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('try::git+https://github.com/binpash/try.git'
        'destdir.patch'
        'ldflags.patch')
sha256sums=('SKIP'
            '03f9e5caf8cfe3ef18c997d149a58947fa952483e3b9fd34e3ff269277065b09'
            'dead4d4f8c201f4ed38f05b5e7f12d995a5b132e3e12d214cc0834d39482ad75')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

    # fix missing DESTDIR in Makefile
    patch -p1 < $srcdir/destdir.patch

    # fix missing LDFLAGS
    patch -p1 < $srcdir/ldflags.patch

    autoconf
}

build() {
	cd "$srcdir/${pkgname%-git}"

    msg2 "Note that the Kernel module \`overlay' might need to be manually loaded!"
    ./configure --prefix=/usr --enable-manpage
    make
}

check() {
	cd "$srcdir/${pkgname%-git}"

    make test
}

package() {
	cd "$srcdir/${pkgname%-git}"

    make DESTDIR=$pkgdir install

    # install extra files
    install -Dm644 "completions/try.bash" "$pkgdir/etc/bash_completion.d/try"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
