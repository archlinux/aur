pkgname=reiser4progs-git
pkgver=progs.pending.1.12420.g23e8ccb64
pkgrel=1
pkgdesc="Утилиты для файловой системы Reiser4 (mkfs.reiser4, fsck.reiser4, debugfs.reiser4, measurefs.reiser4) — собрано из живого git апстрима, т.к. AUR-версия заброшена"
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

pkgver() {
    cd reiser4progs
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
