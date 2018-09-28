# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Earnestly <zibeon@googlemail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=glibc-git
pkgver=2.28.r164.g81dca813cc
pkgrel=1
pkgdesc='GNU C Library'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers' 'tzdata' 'filesystem')
optdepends=('gd: graph image generation with memusage')
makedepends=('git')
# XXX Arch Linux's valgrind package requires an exact version
provides=("glibc=${pkgver%%.r*}")
conflicts=('glibc')
backup=('etc/gai.conf' 'etc/nscd.conf')
options=('staticlibs')
install='glibc-git.install'
source=('git+https://sourceware.org/git/glibc.git'
        'locale-gen'
        '0001-Revert-elf-Correct-absolute-SHN_ABS-symbol-run-time-.patch'
        'bz20338.patch')
sha256sums=('SKIP'
            '05fbb88877cdddc99ef25e48304d6e5ac236660c20925d461cb4e90ebcb3b7de'
            'dd717ee59e778d808545f4f3f3f436bfc678a2d3937589d649b70767025e7e1e'
            '959d4f41edd004bddd9091c4d8c8c3aa07d79a04bfdb89d59f9f26fe5a74d32a')

pkgver() {
    cd glibc
    # wtf is tag "glibc-2.26.9000"
    git describe --exclude '*.*.9000' | sed 's/^glibc-//; s/-/.r/; s/-/./'
}

prepare() {
    mkdir -p build

    cd glibc
    # https://sourceware.org/bugzilla/show_bug.cgi?id=20338
    patch -p1 -i ../bz20338.patch
    # revert commit breaking proprietary electron apps for now; this is lld's fault
    # but it's too serious a regression to break software in the wild until users
    # have a solution. See https://bugs.archlinux.org/task/59550 and
    # https://github.com/electron/electron/issues/13972#issuecomment-411532741
    patch -p1 -i ../0001-Revert-elf-Correct-absolute-SHN_ABS-symbol-run-time-.patch
}

build() {
    cd build

    if [[ ${CARCH} = "i686" ]]; then
        # Hack to fix NPTL issues with Xen, only required on 32bit platforms
        export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
    fi

    { printf 'slibdir=/usr/lib\n'
      printf 'rtlddir=/usr/lib\n'
      printf 'sbindir=/usr/bin\n'
      printf 'rootsbindir=/usr/bin\n'
    } >> configparms

    # remove fortify for building libraries
    CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

    "$srcdir"/glibc/configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --with-headers=/usr/include \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-add-ons \
        --enable-bind-now \
        --enable-cet \
        --enable-lock-elision \
        --enable-multi-arch \
        --enable-stack-protector=strong \
        --enable-stackguard-randomization \
        --disable-profile \
        --disable-werror

    printf 'build-programs=no\n' >> configparms
    make

    # Re-enable hardening for programs.
    sed -i '/build-programs=/s/no/yes/' configparms
    { printf 'CC += -D_FORTIFY_SOURCE=2\n'
      printf 'CXX += -D_FORTIFY_SOURCE=2\n'
    } >> configparms
    make

}

check() {
    cd build

    # Remove harding in preparation to run test-suite.
    sed -i '/FORTIFY/d' configparms
    make check || true
}

package() {
    make -C build install_root="$pkgdir" install

    install -dm0755 "$pkgdir"/usr/lib/locale
    install -dm0755 "$pkgdir"/etc/locales
    install -Dm0755 locale-gen "$pkgdir"/usr/bin/locale-gen
    install -Dm0644 glibc/posix/gai.conf "$pkgdir"/etc/gai.conf
    install -Dm0644 glibc/nscd/nscd.conf "$pkgdir"/etc/nscd.conf
    install -Dm0644 glibc/nscd/nscd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/nscd.conf
    install -Dm0644 glibc/nscd/nscd.service "$pkgdir"/usr/lib/systemd/system/nscd.service

    # Only support UTF-8 charmaps.
    find "$pkgdir"/usr/share/i18n/charmaps ! -name UTF-8.gz -type f -delete

    # We generate these in the post-install with ldconfig -r .
    rm "$pkgdir"/etc/ld.so.cache

    # Shipped in tzdata
    rm -f "$pkgdir"/usr/bin/{tzselect,zdump,zic}

    # handle selectively stripping unless debug packages are requested
    if check_option 'debug' n; then
        options+=('!strip')
        # I use 2> /dev/null for all of these due to many false-positives as it
        # attempts to strip scripts or other unstrippable files.
        find "$pkgdir"/usr/bin -type f -executable -exec strip $STRIP_BINARIES {} + 2> /dev/null || true
        find "$pkgdir"/usr/lib -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true

        # Do not strip these for gdb and valgrind functionality.
        find "$pkgdir"/usr/lib \
          -not -name 'ld-*.so' \
          -not -name 'libc-*.so' \
          -not -name 'libpthread-*.so' \
          -not -name 'libthread_db-*.so' \
          -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
    fi
}
