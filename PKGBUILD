# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Earnestly <zibeon@googlemail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=glibc-minimal-git
pkgver=2.33.r62.gebcf45a16c
pkgrel=1
pkgdesc='GNU C Library'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers' 'tzdata' 'filesystem')
optdepends=('gd: graph image generation with memusage'
            'perl: for mtrace')
makedepends=('git' 'python')
# XXX Arch Linux's valgrind package requires an exact version
provides=("glibc=${pkgver%%.r*}" "glibc")
conflicts=('glibc')
backup=('etc/gai.conf' 'etc/nscd.conf')
options=('staticlibs')
install='glibc-git.install'
source=('git+https://sourceware.org/git/glibc.git'
        'locale-gen')
sha256sums=('SKIP'
            'SKIP')

# remove default hardening for building libraries
#CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

pkgver() {
    cd glibc
    # wtf is tag "glibc-2.26.9000"
    git describe --exclude '*.*.9000' | sed 's/^glibc-//; s/-/.r/; s/-/./'
}

build() {
    mkdir -p build
    cd build

#    if [[ ${CARCH} = "i686" ]]; then
        # Hack to fix NPTL issues with Xen, only required on 32bit platforms
#        export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
#    fi

    { printf 'slibdir=/usr/lib\n'
      printf 'rtlddir=/usr/lib\n'
      printf 'sbindir=/usr/bin\n'
      printf 'rootsbindir=/usr/bin\n'
    } >> configparms

    "$srcdir"/glibc/configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --with-headers=/usr/include \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-add-ons \
        --enable-bind-now \
        --enable-cet \
        --enable-kernel=5.11 \
        --enable-lock-elision \
        --enable-multi-arch \
        --enable-stack-protector=strong \
        --enable-stackguard-randomization \
        --disable-profile \
        --disable-werror \
	--without-selinux 


#    printf 'build-programs=no\n' >> configparms
    make

    # Re-enable hardening for programs.
#    sed -i '/build-programs=/s/no/yes/' configparms
#    { printf 'CC += -D_FORTIFY_SOURCE=2\n'
#      printf 'CXX += -D_FORTIFY_SOURCE=2\n'
#    } >> configparms
#    make

}

#check() {
#    cd build

    # Remove harding in preparation to run test-suite.
#    sed -i '/FORTIFY/d' configparms
#    make check || true
#}

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

    # Provided by libxcrypt; keep the old shared library for backwards compatibility
    rm -f "$pkgdir"/usr/include/crypt.h "$pkgdir"/usr/lib/libcrypt.{a,so}

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
