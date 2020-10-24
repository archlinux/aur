# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>

pkgname=keyman
pkgver=13.0.103
pkgrel=2
pkgdesc="IBus engine supporting over 1,000 keyboard layouts (former KMFL)"
arch=('i686' 'x86_64')
url="https://keyman.com/linux/"
license=('GPL')
depends=('ibus' 'webkit2gtk' 'help2man' 'python-magic' 'python-requests-cache'
         'python-numpy' 'python-pillow' 'python-qrcode' 'python-lxml')
makedepends=('meson' 'git')
optdepends=('keyman-onboard: on-screen keyboard')
replaces=('kmflcomp' 'libkmfl' 'ibus-kmfl')
conflicts=('kmflcomp' 'libkmfl' 'ibus-kmfl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keymanapp/keyman/archive/linux-release-stable-$pkgver.tar.gz")
sha256sums=('30d9db0cd08aa4d6388f483aa32c58776fd9299acb542ded64da5d3d753f6949')

prepare() {
    _basedir="$srcdir/keyman-linux-release-stable-${pkgver}/linux"

    cd "$_basedir/ibus-kmfl"
    sed -i 's:${libexecdir}:/usr/lib/ibus:' src/kmfl.xml.in.in

    cd "$_basedir/ibus-keyman"
    sed -i 's:${libexecdir}:/usr/lib/ibus:' src/keyman.xml.in.in
    
    cd "$_basedir/keyman-config/keyman_config/"
    _majorvers=$(cat "$_basedir/../resources/VERSION.md")
    sed -e "s/_VERSION_/${pkgver}/" \
        -e "s/_MAJORVERSION_/${_majorvers}/" \
        version.py.in > version.py
}

build() {
    _basedir="$srcdir/keyman-linux-release-stable-${pkgver}/linux"

    # configure all subprojects
    cd "$_basedir"
    make reconf

    # keyboardprocessor
    echo
    echo
    echo "### keyboardprocessor #####################"
    echo
    echo
    cd "$_basedir"
    meson ../common/engine/keyboardprocessor keyboardprocessor
    cd keyboardprocessor
    meson configure -Dprefix=/usr
    ninja reconfigure
    ninja

    # extract headers
    mkdir -p "$srcdir/include/kmfl"
    cp "$_basedir/kmflcomp/include/"*.h "$srcdir/include/kmfl"
    cp "$_basedir/libkmfl/include/"*.h  "$srcdir/include/kmfl"

    # keyman base binaries
    for proj in kmflcomp libkmfl ibus-kmfl ibus-keyman; do
        echo
        echo
        echo "### $proj #####################"
        echo
        echo
        cd "$_basedir/$proj"
        #autoreconf --install --force
        ./configure \
            CPPFLAGS="-I$srcdir/include" \
            LDFLAGS="-L$_basedir/kmflcomp/src -L$_basedir/libkmfl/src" \
            KEYMAN_PROC_CFLAGS="-I$_basedir/keyboardprocessor/include -I$_basedir/../common/engine/keyboardprocessor/include" \
            KEYMAN_PROC_LIBS="-L$_basedir/libkmfl/src -L$_basedir/keyboardprocessor/src -lkmnkbp0" \
            --prefix=/usr \
            --libexecdir=/usr/lib/ibus \
            --datadir=/usr/share
        make
    done

    # keyman-config
    echo
    echo
    echo "### keyman-config #####################"
    echo
    echo
    cd "$_basedir/keyman-config"
    python setup.py build
}

package() {
    _basedir="$srcdir/keyman-linux-release-stable-${pkgver}/linux"

    # keyboardprocessor
    echo
    echo
    echo "### keyboardprocessor #####################"
    echo
    echo
    cd "$_basedir"
    DESTDIR="$pkgdir" ninja -C keyboardprocessor install

    # keyman base binaries
    for proj in kmflcomp libkmfl ibus-kmfl ibus-keyman; do
        echo
        echo
        echo "### $proj #####################"
        echo
        echo
        cd "$_basedir/$proj"
        make DESTDIR="$pkgdir/" install
    done
    
    # keyman-config
    echo
    echo
    echo "### keyman-config #####################"
    echo
    echo
    cd "$_basedir/keyman-config"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    make man
    install -Dm644 --target-directory="$pkgdir/usr/share/keyman/icons" keyman_config/icons/*
    install -Dm644 --target-directory="$pkgdir/usr/share/man/man1" debian/man/*.1
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
    install -Dm644 --target-directory="$pkgdir/usr/share/applications" debian/km-config.desktop
    # mime
    install -Dm644 debian/keyman.sharedmimeinfo "$pkgdir/usr/share/mime/packages/keyman.xml"
    # glib schemas
    install -Dm644 --target-directory="$pkgdir/usr/share/glib-2.0/schemas" com.keyman.gschema.xml
}

#post_install() {
#    ibus restart
#}
