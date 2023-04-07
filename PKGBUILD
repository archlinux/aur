# FleuOS Calamares
pkgname=fleu-calamares
pkgver=3.2.32.1
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=('i686' 'x86_64')
url="https://dancheg97.ru/dancheg97/calamares"
license=('LGPL')
conflicts=('calamares-net' 'calamares-dev' 'calamares' 'calamares-git')

depends=('kconfig' 'kcoreaddons' 'kiconthemes' 'ki18n' 'kio' 'solid' 'yaml-cpp' 'kpmcore' 'mkinitcpio-openswap'
         'boost-libs'  'hwinfo' 'qt5-svg' 'polkit-qt5' 'gtk-update-icon-cache' 'plasma-framework'
         'qt5-xmlpatterns' 'squashfs-tools' 'libpwquality' 'yad' 'gtk-update-icon-cache')
# 'ckbcomp'
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations' 'git' 'boost')

backup=('usr/share/calamares/modules/bootloader.conf'
        'usr/share/calamares/modules/displaymanager.conf'
        'usr/share/calamares/modules/initcpio.conf'
        'usr/share/calamares/modules/unpackfs.conf')

source+=("https://github.com/calamares/calamares/releases/download/v${pkgver}/calamares-${pkgver}.tar.gz"
         git+https://dancheg97.ru/dancheg97/calamares#branch=main)

sha256sums=('SKIP'
            'SKIP')

prepare() {
    cp -a ${srcdir}/calamares/* ${srcdir}/calamares-${pkgver}
    rm -rf ${srcdir}/calamares
    cd ${srcdir}/calamares-${pkgver}
    sed -i -e 's/"Install configuration files" OFF/"Install configuration files" ON/' CMakeLists.txt

    # change branding
    sed -i -e "s/default/fleuos/g" src/branding/CMakeLists.txt

}

build() {
    cd ${srcdir}/calamares-${pkgver}

    mkdir -p build
    cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DWITH_KF5DBus=OFF \
              -DBoost_NO_BOOST_CMAKE=ON \
              -DSKIP_MODULES="webview interactiveterminal initramfs \
                              initramfscfg dracut dracutlukscfg \
                              dummyprocess dummypython dummycpp \
                              dummypythonqt services-openrc services-systemd \
                              keyboardq localeq welcomeq"
        make
}

package() {
    cd ${srcdir}/calamares-${pkgver}/build
    make DESTDIR="$pkgdir" install
    install -Dm644 "../data/calamares.desktop" "$pkgdir/usr/share/applications/calamares.desktop"
    install -Dm755 "../data/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
    install -Dm644 "../data/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
    chmod 750 "$pkgdir"/etc/polkit-1/rules.d
}
