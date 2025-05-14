# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>

pkgname=keyman
pkgver=18.0.236
pkgrel=1
pkgdesc="IBus engine supporting over 2000 languages"
arch=('i686' 'x86_64')
url="https://keyman.com/linux/"
license=('GPL')
depends=('ibus' 'libevdev'
        # the following dependences are only needed for keyman-config
        'python-qrcode' 'python-sentry_sdk' 'python-fonttools'
        'python-pyxdg' 'python-dbus' 'python-requests' 'python-requests-cache'
        'python-numpy' 'python-pillow' 'python-magic' 'python-lxml')
makedepends=('cmake' 'meson'
        # the following dependences are only needed for keyman-config
        'python-build' 'python-installer' 'python-setuptools' 'help2man')
optdepends=('keyman-onboard: on-screen keyboard')
source=("https://downloads.keyman.com/linux/stable/$pkgver/keyman-$pkgver.tar.gz"
    https://downloads.keyman.com/linux/stable/$pkgver/keyman-$pkgver.tar.gz.asc)
sha256sums=('b3ce70a5a59602674812e1a06dc6701bbb08d9115f7cedeb70b0bd6ff8d71355'
            'SKIP')
validpgpkeys=('6C8EEADE607D434C74FD34FDC8E614F58F1B65E0')

prepare(){
    cd "$srcdir/keyman/linux"

    # GCC 15 warning
    sed -i 's/^#define __ORDEROUTPUTDEVICE_H__/#define __ORDEREDOUTPUTDEVICE_H__/' \
        keyman-system-service/src/OrderedOutputDevice.h

    # avoid adding `dpkg` dependency
    sed -i 's/if dpkg --compare-versions .*; then/if false; then/' \
        keyman-config/build.sh
}

build() {
    
    # build and config are based on the project's DEB packaging
    # https://github.com/keymanapp/keyman/blob/master/linux/debian/rules

    cd "$srcdir/keyman"

    linux/keyman-system-service/build.sh configure -- \
        --wrap-mode=nodownload \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var

    core/build.sh --no-tests configure:arch build:arch -- \
        --wrap-mode=nodownload \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libdir=lib \
        --libexecdir=lib

    linux/ibus-keyman/build.sh configure build -- \
        --wrap-mode=nodownload \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        -Dkeyman_deb_pkg_build=false

    linux/keyman-config/build.sh configure build
    cd "$srcdir/keyman/linux/keyman-config"
    sed -i -e "s/^__pkgversion__ = \"[^\"]*\"/__pkgversion__ = \"$pkgver\"/g" \
        keyman_config/version.py
    make compile-po
}

package() {
    cd "$srcdir/keyman"
    DESTDIR=$pkgdir core/build.sh --no-tests install:arch
    DESTDIR=$pkgdir linux/keyman-system-service/build.sh install
    DESTDIR=$pkgdir linux/ibus-keyman/build.sh install

    # keyman-config

    cd "$srcdir/keyman/linux/keyman-config"
    python -m installer --destdir="$pkgdir" build/*.whl
    # icons
    install -d "$pkgdir/usr/share/keyman/icons"
    cp keyman_config/icons/* "$pkgdir/usr/share/keyman/icons"
    # man pages
    install -d "$pkgdir/usr/share/man/man1"
    cp ../../debian/man/*.1 "$pkgdir/usr/share/man/man1"
    # locales
    install -d "$pkgdir/usr/share/"
    cp -r locale/ "$pkgdir/usr/share/"
    rm "$pkgdir/usr/share/locale/"*.po*
    # desktop
    install -Dm644 --target-directory="$pkgdir/usr/share/applications" resources/km-config.desktop
    # mime
    install -Dm644 resources/keyman.sharedmimeinfo "$pkgdir/usr/share/mime/packages/keyman.xml"
    # app icons
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/24x24/apps" icons/24/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/32x32/apps" icons/32/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/48x48/apps" icons/48/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/64x64/apps" icons/64/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/128x128/apps" icons/128/km-config.png
    # mime icons
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/16x16/mimetypes" icons/16/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/24x24/mimetypes" icons/24/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/32x32/mimetypes" icons/32/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/48x48/mimetypes" icons/48/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/64x64/mimetypes" icons/64/application-x-kmp.png
    # glib schemas
    install -Dm644 --target-directory="$pkgdir/usr/share/glib-2.0/schemas" resources/com.keyman.gschema.xml
    # bash completions
    install -Dm644 --target-directory="$pkgdir/usr/share/bash-completion/completions/" *.bash-completion
    for file in $pkgdir/usr/share/bash-completion/completions/*; do
        mv -- "$file" "${file%%.bash-completion}"
    done
}
