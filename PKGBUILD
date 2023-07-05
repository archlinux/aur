# Maintainer: shadichy <shadichy.dev@gmail.com>
pkgbase=systemback
sb=$pkgbase
pkgname=("lib${sb}" "${sb}-cli" "${sb}")
pkgver=1.8.9
pkgrel=4
pkgdesc='Simple system backup and restore application with extra features'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/shadichy/systemback-archlinux'
license=('GPL')
depends=('util-linux' 'util-linux-libs' 'parted' 'qt5-base>=5.5.0' 'procps-ng' 'gnu-free-fonts' 'dosfstools' 'squashfs-tools' 'libxcrypt-compat')
optdepends=('btrfs-progs' 'jfsutils' 'reiserfsprogs' 'xfsprogs' 'update-grub')
makedepends=('ncurses' 'qt5-tools' 'make' 'procps-ng' 'libisoburn')
source=(git+https://github.com/shadichy/systemback-archlinux.git)
md5sums=('SKIP')

build() {
    cd "${srcdir}/${sb}-archlinux/${sb}"
    qmake-qt5 $([ "$LLVM" ] && [ "$LLVM" != 0 ] && echo "-spec linux-clang")
    make -j$(nproc --all)
    lrelease-qt5 systemback.pro
}

package_libsystemback() {
    pkgdesc='Libary for Systemback'

    mkdir -p ${pkgdir}/usr/lib/${sb}
    mkdir -p ${pkgdir}/usr/include/lib${sb}
    mkdir -p ${pkgdir}/usr/share/${sb}/scripts
    mkdir -p ${pkgdir}/usr/share/licenses/${sb}

    cd "${srcdir}/${sb}-archlinux/${sb}"

    install -dm755 ${pkgdir}/usr/lib/${sb}
    install -dm755 ${pkgdir}/usr/include/lib${sb}
    install -dm755 ${pkgdir}/usr/share/${sb}/scripts
    install -dm755 ${pkgdir}/usr/share/licenses/${sb}

    install -m755 lib${sb}/lib${sb}.so* ${pkgdir}/usr/lib/${sb}
    install -m755 lib${sb}/*.hpp ${pkgdir}/usr/include/lib${sb}
    install -m755 lib${sb}/scripts/* ${pkgdir}/usr/share/${sb}/scripts
    install -m755 LICENSE ${pkgdir}/usr/share/licenses/${sb}
}
package_systemback-cli() {
    depends+=('ncurses' "lib${sb}")

    mkdir -p ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/usr/bin

    cd "${srcdir}/${sb}-archlinux/${sb}"

    install -m755 ${sb}-cli/${sb}-cli ${pkgdir}/usr/bin
}
package_systemback() {
    depends+=('libx11' 'zenity' "lib${sb}" 'grub' 'mtools' 'arch-install-scripts' 'mkinitcpio-live-boot' 'xz' 'zstd' 'xterm')
    optdepends+=('kdialog' 'amd-ucode' 'intel-ucode' 'systemback-efiboot')

    mkdir -p ${pkgdir}/etc/${sb}
    mkdir -p ${pkgdir}/etc/xdg/autostart

    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib/${sb}

    mkdir -p ${pkgdir}/usr/share/${sb}/lang
    mkdir -p ${pkgdir}/usr/share/polkit-1/actions/

    appdir=usr/share/applications
    mkdir -p ${pkgdir}/$appdir

    icondir=usr/share/icons/hicolor
    mkdir -p ${pkgdir}/$icondir/128x128/apps
    mkdir -p ${pkgdir}/$icondir/256x256/apps
    mkdir -p ${pkgdir}/$icondir/48x48/apps
    mkdir -p ${pkgdir}/$icondir/64x64/apps

    cd "${srcdir}/${sb}-archlinux/${sb}"

    install -dm664 ${pkgdir}/etc/${sb}
    install -dm644 ${pkgdir}/usr/share/${sb}/lang
    install -dm644 ${pkgdir}/usr/share/polkit-1/actions/

    install -dm644 ${pkgdir}/$icondir/128x128/apps
    install -dm644 ${pkgdir}/$icondir/256x256/apps
    install -dm644 ${pkgdir}/$icondir/48x48/apps
    install -dm644 ${pkgdir}/$icondir/64x64/apps

    install -dm755 ${pkgdir}/etc/xdg/autostart
    install -dm755 ${pkgdir}/$appdir

    install -dm755 ${pkgdir}/usr/lib/${sb}
    install -dm755 ${pkgdir}/usr/bin

    install -m660 ${sb}.conf ${pkgdir}/etc/${sb}
    install -m644 lang/*.qm ${pkgdir}/usr/share/${sb}/lang
    install -m644 org.${sb}.sbsustart.policy ${pkgdir}/usr/share/polkit-1/actions/

    install -m644 icons/128x128/${sb}.png ${pkgdir}/$icondir/128x128/apps
    install -m644 icons/256x256/${sb}.png ${pkgdir}/$icondir/256x256/apps
    install -m644 icons/48x48/${sb}.png ${pkgdir}/$icondir/48x48/apps
    install -m644 icons/64x64/${sb}.png ${pkgdir}/$icondir/64x64/apps

    install -m755 sbschedule.desktop ${pkgdir}/etc/xdg/autostart
    install -m755 org.${sb}.${sb}.desktop ${pkgdir}/$appdir
    ln -s org.${sb}.${sb}.desktop ${pkgdir}/$appdir/${sb}.desktop

    install -m755 sbscheduler/sbscheduler \
        sbsustart/sbsustart \
        sbsysupgrade/sbsysupgrade \
        ${pkgdir}/usr/lib/${sb}

    install -m755 ../sbsustart \
        ${sb}/${sb} \
        ${pkgdir}/usr/bin
}
