# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>

_provide_nondkms=true
_provide_dkms=true
_provide_header=true
_provide_udev_rule=true

pkgbase='winesync'
pkgname=()
pkgver=5.15
pkgrel=1
pkgdesc="Wine synchronization primitive driver"
arch=('any')
url='https://repo.or.cz/linux/zf.git/shortlog/refs/heads/winesync3'
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
_nondkms_depends=('linux')
_dkms_depends=('dkms')
_nondkms_makedepends=('linux-headers' 'dkms')
_dkms_optdepends=('linux-headers: build the module for Arch kernel')
_module_provides=("WINESYNC-MODULE=$pkgver")
_header_provides=("$pkgbase-header=$pkgver")
_udev_rule_provides=("$pkgbase-udev-rule=$pkgver")
_header_conflicts=("$pkgbase-header")
_udev_rule_conflicts=("$pkgbase-udev-rule")
license=('GPL2')
options=('!strip')
_commit=ee18b220dde45003cd7ce7360fe3e633678b97df
source=("winesync.c-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/drivers/misc/winesync.c"
        "winesync.h-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/include/uapi/linux/winesync.h"
        '99-winesync.rules'
        'Makefile'
        'dkms.conf'
        'exported-symbols-hack.diff')
sha256sums=('25b8100561939b85a775cd415db6f57ba452cc05a03dacfcc515469793520831'
            'ad35e082b3e75080bde77a9c3c2f300efdec3cab64c0603eadbc301de9f33242'
            '9b22d9976a83785e6a1cfc4a3aa230a8c5e4e903730bbafc598ec86bfaa35c3e'
            '05735aa1fef1eda3c6dca8b7a0c2a7eebf1eba8af38f608b4b1c34d4acbad453'
            '4f5a34a3d9cbc91789c6b42f3aa7a73e52d94610d34c4733abcd285abf446769'
            '3806d2440ee0c32d6b0c3be3077dbd437a11ccf2426874db92771fbc3f5f8519')

if [ "${PRINTSRCINFO:-0}" -eq 1 ]; then
    _provide_nondkms=true
    _provide_dkms=true
    _provide_header=true
    _provide_udev_rule=true
fi

if [ "$_provide_nondkms" = true ]; then
    pkgname+=("$pkgbase")
    makedepends+=("${_nondkms_makedepends[@]}")
fi
if [ "$_provide_dkms" = true ]; then
    pkgname+=("$pkgbase-dkms")
fi
if [ "$_provide_header" = true ]; then
    pkgname+=("$pkgbase-header")
fi
if [ "$_provide_udev_rule" = true ]; then
    pkgname+=("$pkgbase-udev-rule")
fi

if [ "$_provide_nondkms" = true ] || [ "$_provide_dkms" = true ]; then
prepare() {
    _supported_kernvers=('5.15')
    _regex=("${_supported_kernvers[@]//./\\\\.}")
    _regex="^($(IFS='|'; printf '%s' "${_regex[*]}"))(\\.|\$)"
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" -e "s/@KERNVER_REGEX@/$_regex/g" "$srcdir/dkms.conf"
}
fi

if [ "$_provide_nondkms" = true ]; then
build() {
    _kernver="$(cat /usr/src/linux/version)"
    install -Dm644 "$srcdir/Makefile" "$srcdir/$pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/winesync.h-$_commit" "$srcdir/$pkgbase-$pkgver/include/uapi/linux/winesync.h"
    install -Dm644 "$srcdir/winesync.c-$_commit" "$srcdir/$pkgbase-$pkgver/src/drivers/misc/winesync.c"
    install -Dm644 "$srcdir/dkms.conf" "$srcdir/$pkgbase-$pkgver/dkms.conf"
    install -Dm644 "$srcdir/exported-symbols-hack.diff" "$srcdir/$pkgbase-$pkgver/patches/exported-symbols-hack.diff"
    mkdir "$srcdir/build"
    fakeroot dkms build --sourcetree "$srcdir" --dkmstree "$srcdir/build" -m "$pkgbase/$pkgver" -k "$_kernver"
}
package_winesync() {
    pkgdesc="Wine synchronization primitive driver - out-of-tree module"
    arch=("$CARCH")
    depends=("${_nondkms_depends[@]}")
    provides=("${_module_provides[@]}")
    _kernver="$(cat /usr/src/linux/version)"
    install -t "$pkgdir/usr/lib/modules/$_kernver/extramodules" -Dm644 "$srcdir/build/$pkgbase/$pkgver/$_kernver/$CARCH/module"/*
    find "$pkgdir" -name '*.ko' -exec xz -T1 '{}' \+
}
fi
if [ "$_provide_dkms" = true ]; then
package_winesync-dkms() {
    pkgdesc="Wine synchronization primitive driver - out-of-tree module (dkms version)"
    depends=("${_dkms_depends[@]}")
    optdepends=("${_dkms_optdepends[@]}")
    provides=("${_module_provides[@]}")
    install -Dm644 "$srcdir/Makefile" "$pkgdir/usr/src/$pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/winesync.h-$_commit" "$pkgdir/usr/src/$pkgbase-$pkgver/include/uapi/linux/winesync.h"
    install -Dm644 "$srcdir/winesync.c-$_commit" "$pkgdir/usr/src/$pkgbase-$pkgver/src/drivers/misc/winesync.c"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
    install -Dm644 "$srcdir/exported-symbols-hack.diff" "$pkgdir/usr/src/$pkgbase-$pkgver/patches/exported-symbols-hack.diff"
}
fi
if [ "$_provide_header" = true ]; then
package_winesync-header() {
    pkgdesc="Wine synchronization primitive driver - header file"
    provides+=("${_header_provides[@]}")
    conflicts+=("${_header_conflicts[@]}")
    install -Dm644 "$srcdir/winesync.h-$_commit" "$pkgdir/usr/include/linux/winesync.h"
}
fi
if [ "$_provide_udev_rule" = true ]; then
package_winesync-udev-rule() {
    pkgdesc="Wine synchronization primitive driver - udev rule"
    provides+=("${_udev_rule_provides[@]}")
    conflicts+=("${_udev_rule_conflicts[@]}")
    install -Dm644 "$srcdir/99-winesync.rules" "$pkgdir/usr/lib/udev/rules.d/99-winesync.rules"
}
fi
