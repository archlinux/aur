# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>

_provide_nondkms=false
_provide_dkms=true
_provide_header=true
_provide_udev_rule=true

pkgbase='winesync'
pkgname=()
pkgver=5.16
pkgrel=4
pkgdesc="Wine synchronization primitive driver"
arch=('any')
url='https://repo.or.cz/linux/zf.git/shortlog/refs/heads/winesync4'
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
_commit=9ac10c6e711ec096274ecc676ae83a7cf2a1213f
source=("winesync.c-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/drivers/misc/winesync.c"
        "winesync.h-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/include/uapi/linux/winesync.h"
        '99-winesync.rules'
        'Makefile'
        'dkms.conf')
sha256sums=('0da3cfeb8ab2f6b16083d92e7fa9a526a402802cd2a114d86a8a6947a42e8be8'
            'd21b36d59c6cd69190fe51b6e60505464053cf5450b05a1625bbfcf9b0f26620'
            '9b22d9976a83785e6a1cfc4a3aa230a8c5e4e903730bbafc598ec86bfaa35c3e'
            '05735aa1fef1eda3c6dca8b7a0c2a7eebf1eba8af38f608b4b1c34d4acbad453'
            '6c6e611dea280973933135aa9c9a37bc95d542f2cd029b51cb71e4a28ee95cf7')

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
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" "$srcdir/dkms.conf"
}
fi

if [ "$_provide_nondkms" = true ]; then
build() {
    _kernver="$(cat /usr/src/linux/version)"
    install -Dm644 "$srcdir/Makefile" "$srcdir/$pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/winesync.h-$_commit" "$srcdir/$pkgbase-$pkgver/include/uapi/linux/winesync.h"
    install -Dm644 "$srcdir/winesync.c-$_commit" "$srcdir/$pkgbase-$pkgver/src/drivers/misc/winesync.c"
    install -Dm644 "$srcdir/dkms.conf" "$srcdir/$pkgbase-$pkgver/dkms.conf"
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
