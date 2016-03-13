# Maintainer: Rafał Kozdrój <rafal.kozdroj+aur@gmail.com>

_with_nautilus_plugin=1

pkgname=('megasync-qt5')
pkgver=2.7.1
pkgrel=1
pkgdesc="Sync your files to your Mega account (qt5 version)"
arch=('i686' 'x86_64')
url="https://mega.nz/#sync"
license=('custom')
depends=('qt5-base' 'hicolor-icon-theme' 'openssl' 'sqlite' 'c-ares' 'crypto++' 'ca-certificates' 'libpng' 'curl' 'libuv')
makedepends=('git' 'qt5-tools' 'qtchooser')
source=("git+https://github.com/meganz/MEGAsync.git#commit=fd9cafb46ca9287ae2871aca24ea336a99fc9363"
        "git+https://github.com/meganz/sdk.git#commit=ad50d1188a8ea0d87c4d2425e446c0600638bb3c")
md5sums=('SKIP'
         'SKIP')
_qmake_config="release"

if [ $_with_nautilus_plugin = 1 ]; then
    pkgname+=('nautilus-megasync-qt5')
    makedepends+=('libnautilus-extension')
    _qmake_config+=" with_ext"
fi

prepare() {
    cd MEGAsync
    git submodule init
    git config submodule.src/MEGASync/mega.url "$srcdir/sdk"
    git submodule update
}

build() {
    export QT_SELECT=5

    cd MEGAsync/src/MEGASync/mega
    ./autogen.sh
    ./configure \
    --disable-silent-rules \
    --disable-curl-checks \
    --disable-megaapi \
    --with-cryptopp \
    --without-sodium \
    --with-zlib \
    --with-sqlite \
    --with-cares \
    --with-curl \
    --without-freeimage \
    --without-readline \
    --without-termcap \
    --disable-posix-threads \
    --disable-examples \
    --prefix=/usr

    cd ../..

    qmake CONFIG+="$_qmake_config" MEGA.pro
    lrelease MEGASync/MEGASync.pro
    make
}

package_megasync-qt5() {
    conflicts=('megatools' 'megasync')
    provides=('megasync')
    optdepends=("nautilus-megasync-qt5: for integration with nautilus")
    install=megasync.install

    cd MEGAsync
    install -Dm 644 LICENCE.md $pkgdir/usr/share/licenses/megasync-qt5/LICENCE.md
    install -Dm 644 installer/terms.txt $pkgdir/usr/share/licenses/megasync-qt5/terms.txt

    cd src/MEGASync
    install -Dm 755 megasync $pkgdir/usr/bin/megasync

    cd platform/linux/data
    install -Dm 644 megasync.desktop $pkgdir/usr/share/applications/megasync.desktop

    cd icons/hicolor
    for size in 16x16 32x32 48x48 128x128 256x256
    do
        install -Dm 644 $size/apps/mega.png $pkgdir/usr/share/icons/hicolor/$size/apps/mega.png
    done
}

package_nautilus-megasync-qt5() {
    pkgdesc="Upload your files to your Mega account from nautilus."
    depends=('nautilus' 'megasync-qt5')
    conflicts=('nautilus-megasync')
    provides=('nautilus-megasync')
    install=nautilus-megasync.install

    cd MEGAsync/src/MEGAShellExtNautilus
    install -Dm 644 libMEGAShellExtNautilus.so.1.0.0 $pkgdir/usr/lib/nautilus/extensions-3.0/libMEGAShellExtNautilus.so.1.0.0

    cd data/emblems
    for size in 32x32 64x64
    do
        install -dm 755 $pkgdir/usr/share/icons/hicolor/$size/emblems
        install -m 644 $size/mega-{pending,synced,syncing,upload}.{icon,png} $pkgdir/usr/share/icons/hicolor/$size/emblems/
    done

    cd $pkgdir/usr/lib/nautilus/extensions-3.0
    ln -s libMEGAShellExtNautilus.so.1.0.0 libMEGAShellExtNautilus.so.1.0
    ln -s libMEGAShellExtNautilus.so.1.0.0 libMEGAShellExtNautilus.so.1
    ln -s libMEGAShellExtNautilus.so.1.0.0 libMEGAShellExtNautilus.so

    install -m755 -d ${pkgdir}/usr/share/licenses
    ln -s megasync-qt5 ${pkgdir}/usr/share/licenses/nautilus-megasync-qt5
}
