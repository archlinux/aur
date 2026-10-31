# Maintainer: Nick Dowsett <nick42d AT gmail DOT com>
# Contributor: Evert Vorster <superchief AT evertvorster DOT com>
# Contributor: Steven Seifried <gitlab@canox.net>

pkgname=clevo-drivers-dkms-git
_pkgname=clevo-drivers
pkgver=4.25.0
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
source=(git+https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers.git#tag=v${pkgver} patch.diff dkms.conf)
sha256sums=('34fdc4c9fc4884296382d53dd353452cd69564f2ee87ac911414bbaa2bff0d5f'
            'd6bef54bcf39e5aa24b3f1148c4ffc65dd054a23ca3af44787a7d1010169b6b6'
            '1a279f80eb476f1b32ea0c07e0501bc771363ecfbee835b6f884914310c74afd')
sha512sums=('7f8180cb0c9b4a27caacceb6e48a2e5137b01daa6163b102ebddc1a958ab804904785b4cd634a3da0b7f5ba0081bad1c510d8d133dc73ad1223f24665135cf9e'
            'bcaf2a67bdc37e388931c458cf08fcb0bb05de2c83de51770b700b9aba2cece578366aec90c0edfa18e71cf688b7c203684da4c69a3fae17e7e253f0082036dd'
            '0b1cb630ffb9e0226bb772e703373ce031f57d58313c69a549deca7b0011ec1bc90f7803682897d9daa779bc0aecebd17ca6f0b1399506f576bdd2f374d8b0d1')

prepare(){
    cd "${srcdir}/tuxedo-drivers"
    echo "Applying patch.diff to tuxedo-drivers..."
    patch -Np1 -i ../patch.diff
}

package() {
    echo "Package step"
    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    ln -sfn "${srcdir}/tuxedo-drivers" "${srcdir}/${_pkgname}-${pkgver}"

    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    install -Dm644 "${_pkgname}-${pkgver}"/files/usr/lib/modprobe.d/*.conf -t "$pkgdir/usr/lib/modprobe.d/"
    install -Dm644 "${_pkgname}-${pkgver}"/files/usr/lib/udev/rules.d/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "${_pkgname}-${pkgver}"/files/usr/lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

    cp -avr "${_pkgname}-${pkgver}"/src/* "$pkgdir/usr/src/${_pkgname}-${pkgver}/"
}

