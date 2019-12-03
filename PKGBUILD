# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>

pkgname=keyman
pkgver=11.0.122
pkgrel=2
pkgdesc="IBus engine supporting over 1,000 layouts (former KMFL)"
arch=('i686' 'x86_64')
url="https://keyman.com/linux/"
license=('GPL')
depends=('ibus' 'webkit2gtk' 'python-magic' 'python-requests-cache' 'python-numpy' 'python-pillow')
makedepends=('meson' 'help2man')
optdepends=('keyman-onboard: on-screen keyboard')
replaces=('kmflcomp' 'libkmfl' 'ibus-kmfl')
conflicts=('kmflcomp' 'libkmfl' 'ibus-kmfl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keymanapp/keyman/archive/linux-release-stable-$pkgver.tar.gz")
sha256sums=('83c00969d08a1b652a8b0ac824817e6a76c7f5ba70764026c19a785229ae0582')

prepare() {
    _basedir="$srcdir/keyman-linux-release-stable-$pkgver/linux"

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
    _basedir="$srcdir/keyman-linux-release-stable-$pkgver/linux"

    # keyboardprocessor
    cd "$_basedir"
    meson --prefix /usr --buildtype=plain ../common/engine/keyboardprocessor keyboardprocessor
    ninja -C keyboardprocessor

    # extract headers
    mkdir -p "$srcdir/include/kmfl"
    cp "$_basedir/kmflcomp/include/"*.h "$srcdir/include/kmfl"
    cp "$_basedir/libkmfl/include/"*.h  "$srcdir/include/kmfl"

    # keyman base binaries
    for proj in kmflcomp libkmfl ibus-kmfl ibus-keyman; do
        cd "$_basedir/$proj"
        autoreconf --install --force
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
    cd "$_basedir/keyman-config"
    python setup.py build
    mkdir -p debian/man
    declare -A _km=(
        ['km-package-get']='Download a Keyman keyboard package'
        ['km-package-install']='Install a Keyman keyboard package'
        ['km-config']='Keyman keyboards installation and information'
        ['km-kvk2ldml']='Convert a Keyman on-screen keyboard file to LDML'
        ['km-package-list-installed']='List installed Keyman keyboard packages'
        ['km-package-uninstall']='Uninstall a Keyman keyboard package'
    )
    for _command in "${!_km[@]}"; do
        help2man --name="${_km[$_command]}"           \
                 --opt-include="maninc/$_command.inc" \
                 --no-info                            \
                 --output="debian/man/$_command.1"    \
                 ./$_command
    done
}

package() {
    _basedir="$srcdir/keyman-linux-release-stable-$pkgver/linux"

    # keyboardprocessor
    cd "$_basedir"
    DESTDIR="$pkgdir" ninja -C keyboardprocessor install

    # keyman base binaries
    for proj in kmflcomp libkmfl ibus-kmfl ibus-keyman; do
        cd "$_basedir/$proj"
        make DESTDIR="$pkgdir/" install
    done
    
    # keyman-config
    cd "$_basedir/keyman-config"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
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
}

#post_install() {
#    ibus restart
#}
