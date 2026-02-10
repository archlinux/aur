# Maintainer: Nick Dowsett <nick42d AT gmail DOT com>
# Contributor: Evert Vorster <superchief AT evertvorster DOT com>
# Contributor: Steven Seifried <gitlab@canox.net>

pkgname=clevo-drivers-dkms-git
_pkgname=clevo-drivers
pkgver=4.20.1
pkgrel=1
pkgdesc="Unofficial modification of TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface, to allow it to run on other Clevo hardware. Use at your own risk."
url="https://github.com/nick42d/clevo-drivers"
license=("GPL-2.0+")
arch=('x86_64')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-drivers-dkms'
		  'tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
conflicts=('tuxedo-drivers-dkms' 'tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
#backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=(git+https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers.git#tag=v${pkgver} patch.diff)
sha256sums=('fed283066751aa0604f8b43eed3ce4cb571bc83fa8ac9917bbaa06a12317c824'
            'd6bef54bcf39e5aa24b3f1148c4ffc65dd054a23ca3af44787a7d1010169b6b6')
sha512sums=('3a3f5e479958db64bb92056b86699612660db54ef077c6bc156ce9c778198df2921cb99392ffe5a021b11c3578772c666d0cfccd5ea0a347b9a8cb2d6ba4f4d7'
            'bcaf2a67bdc37e388931c458cf08fcb0bb05de2c83de51770b700b9aba2cece578366aec90c0edfa18e71cf688b7c203684da4c69a3fae17e7e253f0082036dd')

prepare(){
	echo "$(ls)"
	cd ${srcdir}/tuxedo-drivers
	echo "Current directory is: $(pwd)"
	pkgver=$(git tag | tail -1 | tr -d "v")
	echo "pkgver is "${pkgver}
	patch -Np1 -i ../patch.diff
}

package() {
    echo "Package step"
    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    ln -s ${srcdir}/tuxedo-drivers ${srcdir}/${_pkgname}-${pkgver}

    install -Dm644 "${_pkgname%}-$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
    sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"

    install -Dm644 "${_pkgname%}-$pkgver"/usr/lib/modprobe.d/*.conf -t "$pkgdir/usr/lib/modprobe.d/"
    install -Dm644 "${_pkgname%}-$pkgver"/usr/lib/udev/rules.d/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "${_pkgname%}-$pkgver"/usr/lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

    cp -avr "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
}

