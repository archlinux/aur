# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=try-git
pkgver=r258.833624c
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
        'destdir.patch')
sha256sums=('SKIP'
            'd89dfdbc0432c4e67a0dc0aa9716ad425e1a3d5608c1469b40ad4250fa2b727d')

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"

    # fix missing DESTDIR in Makefile
    patch -p1 < $srcdir/destdir.patch

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
