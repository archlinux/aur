# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>

pkgname=keyman
pkgver=16.0.144
pkgrel=1
pkgdesc="IBus engine supporting over 1,000 keyboard layouts (former KMFL)"
arch=('i686' 'x86_64')
url="https://keyman.com/linux/"
license=('GPL')
depends=('ibus' 'webkit2gtk' 'python-magic' 'python-requests-cache'
    'python-numpy' 'python-pillow' 'python-qrcode' 'python-lxml' 
    'python-sentry_sdk')
makedepends=('meson' 'git' 'python-setuptools' 'perl-locale-gettext' 'help2man'
    'python-build' 'python-installer' 'python-wheel')
optdepends=(
    'keyman-onboard: on-screen keyboard'
    'hotdoc: C API documentation generation'
)
replaces=('kmflcomp' 'libkmfl' 'ibus-kmfl')
conflicts=('kmflcomp' 'libkmfl' 'ibus-kmfl')
source=("$pkgname-$pkgver.tar.gz::https://downloads.keyman.com/linux/stable/$pkgver/keyman-$pkgver.tar.gz")
sha256sums=('55aa0eb4db5a38a0c1ba590781d8839e5f454710437a3a172dc328a1a393df9c')

build() {
    echo -e "\n\n### build 'keyman' ######\n\n"
    cd "$srcdir/keyman/core"
    #core/build.sh configure -- --prefix=/usr
    arch-meson ./ build
    meson compile -C build

    cd "$srcdir/keyman/linux/ibus-keyman"
    ./configure \
        KEYMAN_PROC_CFLAGS=" \
            -I$srcdir/keyman/core/build/include \
            -I$srcdir/keyman/common/include \
            -I$srcdir/keyman/core/include" \
        KEYMAN_PROC_LIBS=" \
            -L$srcdir/keyman/core/build/src -lkmnkbp0" \
        --prefix=/usr \
        --libexecdir=/usr/lib/ibus \
        --datadir=/usr/share
    make

    echo -e "\n\n### build 'keyman-config' ######\n\n"
    cd "$srcdir/keyman/linux/keyman-config"
    ./version.sh
    python -m build --wheel --no-isolation
    make man
}

check() {
    cd "$srcdir/keyman/core"
    # meson test -C build
}

package() {
    cd "$srcdir/keyman/core"
    meson install -C build --destdir "$pkgdir"

    cd "$srcdir/keyman/linux/ibus-keyman"
    make DESTDIR="$pkgdir/" install

    cd "$srcdir/keyman/linux/keyman-config"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # man
    install -Dm644 --target-directory="$pkgdir/usr/share/man/man1" ../../debian/man/*.1
    install -Dm644 --target-directory="$pkgdir/usr/share/keyman/icons" keyman_config/icons/*

    # icons app
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/24x24/apps" icons/24/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/32x32/apps" icons/32/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/48x48/apps" icons/48/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/64x64/apps" icons/64/km-config.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/128x128/apps" icons/128/km-config.png

    # icons mime
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/16x16/mimetypes" icons/16/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/24x24/mimetypes" icons/24/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/32x32/mimetypes" icons/32/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/48x48/mimetypes" icons/48/application-x-kmp.png
    install -Dm644 --target-directory="$pkgdir/usr/share/icons/hicolor/64x64/mimetypes" icons/64/application-x-kmp.png

    # desktop
    install -Dm644 --target-directory="$pkgdir/usr/share/applications" resources/km-config.desktop 

    # mime
    install -Dm644 resources/keyman.sharedmimeinfo "$pkgdir/usr/share/mime/packages/keyman.xml"

    # glib schemas
    install -Dm644 --target-directory="$pkgdir/usr/share/glib-2.0/schemas" resources/com.keyman.gschema.xml
    
    # bash completions
    install -Dm644 --target-directory="$pkgdir/usr/share/bash-completion/completions/" *.bash-completion
    for file in $pkgdir/usr/share/bash-completion/completions/*; do
        mv -- "$file" "${file%%.bash-completion}"
    done
}
