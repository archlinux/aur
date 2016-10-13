# Maintainer: Chris Cromer <chris@cromer.cl>
# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Philip Müller <philm|manjaro|org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_spkgrel=4
_repo=http://mirror.netcologne.de/archlinux/core/os

pkgbase=eudev-systemdcompat
pkgname=('eudev-systemd' 'libeudev-systemd')
pkgver=231
pkgrel=10
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.freedesktop.org/wiki/Software/systemd"
source_i686=("$_repo/i686/libsystemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz"
        "$_repo/i686/systemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz")
source_x86_64=("$_repo/x86_64/libsystemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
        "$_repo/x86_64/systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
        "gummibootx64.efi")
md5sums_i686=('e33f8c03adec815f9bece11ce623ed78'
              'bcbec1e89db4a7a142f860cd6479ff4d')
md5sums_x86_64=('f4ca6c04596a14fa720ce536a2aaf3ab'
                '54ea61ad80b4929c1a98121ef93793c4'
                'ef357b701d67fa39355cbc1c3b9d5afd')

package_eudev-systemd() {
    pkgdesc="systemd-sysuser and systemd-tmpfiles binary; systemd compatibility package"
    provides=("systemd=${pkgver}" "systemd-tools=${pkgver}")
    depends=('eudev' 'libseccomp')
    conflicts=('systemd-tools' 'systemd' 'eudev-systemdcompat')
    replaces=('eudev-systemdcompat')

    install -d "$pkgdir"/usr/{bin,lib/systemd}
    for f in usr/bin/{systemd-tmpfiles,systemd-sysusers};do
        mv -v $f "$pkgdir"/usr/bin
    done
    for f in usr/lib/systemd/libsystemd-shared*.so*;do
        mv -v $f $pkgdir/usr/lib/systemd
    done
}

package_libeudev-systemd() {
    pkgdesc="systemd client libraries without udev; systemd compatibility package"
    provides=("libsystemd=${pkgver}" 'libsystemd.so')
    depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz' 'libeudev')
    conflicts=('libsystemd' 'eudev-systemdcompat')
    replaces=('eudev-systemdcompat')

    install -d $pkgdir/usr/lib/systemd/boot/efi
    for f in usr/lib/libsystemd*.so*;do
        mv -v $f $pkgdir/usr/lib
    done

    if [[ $CARCH == 'x86_64' ]];then
        install $srcdir/gummibootx64.efi $pkgdir/usr/lib/systemd/boot/efi/systemd-bootx64.efi
    fi
}
