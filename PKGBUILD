# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="multisystem"
pkgver=1.0321
pkgrel=1
pkgdesc="A GUI tool to create a usb system that can boot multiple distro's"
url="http://liveusb.info/dotclear/index.php"
arch=('i686' 'x86_64')
license=('GPL3')
if pacman -Qq vim-runtime >/dev/null 2>&1; then
    depends=('vim' 'cdrkit' 'cryptsetup' 'dosfstools' 'gksu' 'grub' 'gtkdialog-svn' 'gvfs' 'hdparm' 'imagemagick' 'lsb-release' 'lsof' 'mtools' 'parted' 'qemu' 'rsync' 'squashfs-tools' 'sudo' 'syslinux' 'unzip' 'wmctrl' 'xdotool' 'xterm' 'zenity');
else
    depends=('xxd' 'cdrkit' 'cryptsetup' 'dosfstools' 'gksu' 'grub' 'gtkdialog-svn' 'gvfs' 'hdparm' 'imagemagick' 'lsb-release' 'lsof' 'mtools' 'parted' 'qemu' 'rsync' 'squashfs-tools' 'sudo' 'syslinux' 'unzip' 'wmctrl' 'xdotool' 'xterm' 'zenity');
fi
optdepends=('fatresize: The FAT16/FAT32 non-destructive resizer.')
provides=("${pkgname}")
install="${pkgname}.install"
source=("http://liveusb.info/${pkgname}/${pkgname}.tar.bz2"
        "http://liveusb.info/${pkgname}/depot/dists/all/main/binary-i386/Packages")
sha256sums=('2316c3824d5019022b6736307ec97d769892f7b6319a893b19c5187e9e83eec6'
            'f7826d558703b0ae9b7fe33828af89312b6a168c467fd6bc7365639a7b93cec1')

_multisystem="#!/usr/bin/sh
exec /usr/local/share/multisystem/gui_multisystem.sh
fi"

_update_grub2="#!/bin/sh
grub-mkconfig -o /boot/grub/grub.cfg"

_liveusb_desktop="[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Icon[fr_FR]=/usr/local/share/pixmaps/multisystem-liveusb.png
Name[fr_FR]=MultiSystem
Comment[fr_FR]=Grub2 MultiSystem boot iso
Exec=/usr/local/share/multisystem/gui_multisystem.sh
Name=MultiSystem
Comment=Grub2 MultiSystem boot iso
Icon=/usr/local/share/pixmaps/multisystem-liveusb.png
Categories=Application;Utility;"

_vbox_desktop="[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Icon[fr_FR]=/usr/local/share/pixmaps/multisystem-vbox.png
Name[fr_FR]=MultiSystem VirtualBox test iso
Comment[fr_FR]=Isofile drop and test with VirtualBox
Exec=/usr/local/share/multisystem/VBox_livecd_gui.sh
Name=MultiSystem VirtualBox test iso
Comment=Isofile drop and test with VirtualBox
Icon=/usr/local/share/pixmaps/multisystem-vbox.png
Categories=Application;Utility;"

pkgver() {
    cd "${srcdir}"
    cat Packages | grep -e 'Version: ' | sed -e '1d;s/Version: //'
}

build() {
    cd "${srcdir}"
    echo -e "$_multisystem" | tee multisystem_bin
    echo -e "$_update_grub2" | tee update-grub2    
    echo -e "$_liveusb_desktop" | tee multisystem-liveusb.desktop
    echo -e "$_vbox_desktop" | tee multisystem-vbox.desktop
    
    cd "${srcdir}/${pkgname}"
    sed -i '/fatresize/d' dependances.txt
    sed -i '/kvm/d' dependances.txt
    sed -i '227,236d' gui_multisystem.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d ${pkgdir}/usr/local/share/${pkgname}
    mv * ${pkgdir}/usr/local/share/${pkgname}
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/local/share/pixmaps

    cd "${srcdir}"
    install -m 644 *.desktop ${pkgdir}/usr/share/applications
    install -m 755 multisystem_bin ${pkgdir}/usr/bin/multisystem
    install -m 755 update-grub2 ${pkgdir}/usr/bin

    cd "${pkgdir}/usr/local/share/${pkgname}"
    install -m 644 img/*.png ${pkgdir}/usr/local/share/pixmaps
    install -m 644 pixmaps/multisystem-liveusb.png ${pkgdir}/usr/local/share/pixmaps
    install -m 644 pixmaps/multisystem-vbox.png ${pkgdir}/usr/local/share/pixmaps
}
