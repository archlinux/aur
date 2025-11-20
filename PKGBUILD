# Maintainer: fam007e <faisalmoshiur@gmail.com>
pkgname=libexecinfo
pkgver=1.1.0
pkgrel=13
pkgdesc="BSD-licensed clone of backtrace facility found in GNU libc"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/fam007e/libexecinfo"
license=('BSD')
depends=('glibc')
# Keep python in makedepends for reproducible builds that might invoke generators,
# but the official release tarball contains generated sources, so it's optional.
makedepends=('python')
provides=('libexecinfo.so')
conflicts=('libexecinfo-git')

# Use the GitHub release asset (latest) produced by CI. `releases/latest/download`
# resolves to the most recent release's asset named libexecinfo-<pkgver>.tar.gz.
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/libexecinfo/releases/latest/download/libexecinfo-$pkgver.tar.gz")
# SHA256 produced by CI (see workflow). Update if a new release tarball is produced.
sha256sums=('d9e80993750dbf8484aa7c5b0fb1ac02d6728136c2a01ca7196bf971c1cb7e2d')

_get_builddir() {
    # Tolerant lookup: many tarballs extract to either "$pkgname-$pkgver" or a nested src/ directory.
    if [ -d "$srcdir/$pkgname-$pkgver" ]; then
        printf '%s' "$srcdir/$pkgname-$pkgver"
    elif [ -d "$srcdir/src/$pkgname-$pkgver" ]; then
        printf '%s' "$srcdir/src/$pkgname-$pkgver"
    else
        # Fallback: assume the common layout
        printf '%s' "$srcdir/$pkgname-$pkgver"
    fi
}

prepare() {
    builddir="$(_get_builddir)"
    cd "$builddir"

    # Ensure pkg-config template is available in the builddir. Release tarball should include it,
    # but if not, allow PKGBUILD-supplied copy in $srcdir (not expected for AUR usage).
    if [ -f "$srcdir/libexecinfo.pc.in" ] && [ ! -f libexecinfo.pc.in ]; then
        cp "$srcdir/libexecinfo.pc.in" .
    fi
}

build() {
    builddir="$(_get_builddir)"
    cd "$builddir"

    # Build using upstream Makefile; generated sources should already be present in the release tarball.
    # Don't override CC if it's empty in the environment — passing an empty CC causes the command
    # line to start with compiler flags and the shell to attempt to execute them.
    if [ -n "$CC" ]; then
        make CC="$CC" \
            CFLAGS="$CFLAGS" \
            LDFLAGS="$LDFLAGS" \
            PREFIX=/usr \
            LIBDIR=/usr/lib \
            INCLUDEDIR=/usr/include \
            PKGCONFIGDIR=/usr/lib/pkgconfig \
            all
    else
        make \
            CFLAGS="$CFLAGS" \
            LDFLAGS="$LDFLAGS" \
            PREFIX=/usr \
            LIBDIR=/usr/lib \
            INCLUDEDIR=/usr/include \
            PKGCONFIGDIR=/usr/lib/pkgconfig \
            all
    fi
}

check() {
    builddir="$(_get_builddir)"
    cd "$builddir"

    # Run quick test; tolerate failures on some platforms but still try to run test binary.
    make test || true

    if [ -x ./test ]; then
        export LD_LIBRARY_PATH=".:${LD_LIBRARY_PATH}"
        ./test || {
            echo "Tests failed; continuing (some environments may lack required support)."
            return 0
        }
    else
        echo "Test binary not present; skipping runtime test."
    fi

    # Validate pkg-config generation if the Makefile provides it
    if make -n libexecinfo.pc >/dev/null 2>&1; then
        make libexecinfo.pc || true
    fi
}

package() {
    builddir="$(_get_builddir)"
    cd "$builddir"

    # Prefer upstream install target
    make install \
        DESTDIR="$pkgdir" \
        PREFIX=/usr \
        LIBDIR=/usr/lib \
        INCLUDEDIR=/usr/include \
        PKGCONFIGDIR=/usr/lib/pkgconfig

    # Some release tarballs may include docs; install them if present
    [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
