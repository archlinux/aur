pkgname=reiser4progs-git
pkgver=1.2.2
pkgrel=1
pkgdesc="Reiser4 filesystem programs"
arch=('x86_64' 'aarch64')
url="https://github.com/edward6/reiser4progs"
license=('GPL2')
depends=('libaal' 'util-linux-libs' 'readline')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'pkgconf')
provides=('reiser4progs')
conflicts=('reiser4progs')
options=('!strip')
source=("reiser4progs::git+https://github.com/edward6/reiser4progs.git")
sha256sums=('SKIP')

prepare() {
    cd reiser4progs

    grep -rlZ --include='*.c' --include='*.h' -E 'CPPFunction|VFunction|CPFunction|\bFunction\b' . 2>/dev/null \
        | xargs -0 -r sed -i \
            -e 's/\bCPPFunction\b/rl_completion_func_t/g' \
            -e 's/\bVFunction\b/rl_vintfunc_t/g' \
            -e 's/\bCPFunction\b/rl_compentry_func_t/g' \
        || true
}

build() {
    cd reiser4progs

    sh ./prepare || autoreconf -fiv

    export CC=${CC:-gcc}

    export CFLAGS="${CFLAGS} -std=gnu17 -fcommon -Wno-error -Wno-error=format-security -Wno-format-security"

    export ac_cv_sys_file_offset_bits=64

    ./configure --prefix=/usr --sbindir=/usr/bin --with-libaal=/usr --disable-static
    make
}

package() {
    cd reiser4progs
    make DESTDIR="$pkgdir" install

    if [ -d "$pkgdir/usr/sbin" ]; then
        mkdir -p "$pkgdir/usr/bin"
        mv -n "$pkgdir"/usr/sbin/* "$pkgdir/usr/bin/" 2>/dev/null || true
        rmdir "$pkgdir/usr/sbin" 2>/dev/null || true
    fi
}
