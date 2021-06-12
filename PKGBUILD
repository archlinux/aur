# Author (initial package): Patrick Auernig <patrick.auernig@gmail.com>
# Author (fixes): Marco Neumann <marco@crepererum.net>

pkgname=sixfireusb-dkms
pkgver=0.6.2
pkgrel=9
pkgdesc="Kernel modules for the Terratec DMX6FireUSB soundcard, including firmware"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sixfireusb"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel')
makedepends=(
    'p7zip'
    'wget'
)
source=(http://sourceforge.net/projects/sixfireusb/files/sixfireusb-$pkgver.tar.bz2
        http://sourceforge.net/projects/sixfireusb/files/tools/fwinst.sh
        fwinst.patch
        pcm.patch
        control.patch
        chip.patch
        dkms.conf
        blacklist-sixfireusb-dkms.conf
)
sha512sums=('e79e4a62762626d966fa8c169b8666a0cfa3af8516e6f8a97e1a1d211d1deb1ed26bd2c5c8a4b563e03718c232e832686be783abbb66e5b49c8cc31858752068'
            '7e8eb7a78514f79b6ee2bb25357a233b1013884b836de5ea3784b7e5a5bdac423b7803ce92c9a31869b280f4b8edde595fdaca51aebf253eb6f6ffdee8ed1290'
            'fafabb05dafd1c03e715bcbdbb73c2fb4cc0e39695117e6b0260419bd2fa1dbeaf0982092a491724737ea31f09ef99e6e8cabce7e1dd98aca189a216530700b8'
            '5284cb5da0354eaba6a86e43634eac17097f20dc0120f4e3c06f9c9dc82a4659e2d487cde5bbab4c18a391a6db881255b48051afcf13fdad5c6a32a5e3aba576'
            'a6656a0a86db963e324c8bb3f3f1a9160c6962d8c01e42e02006886123e45f4a86bda7770b6561f107a781bb6436b1a3d37f7f2d005347dc22b1e510d10e4c47'
            '1e89a9c9a944900a033abbf5ef88d9b808779460300569e8ae99c1d4f911846a9c1c1f2d4f55e3773d51c42ad995eae0ea4ee5c8b26ef29f24a64803c852620d'
            'e15302d1b589296ddc234f1836438bdfc0b864d1a6f2cf808d99dc5ed8f82b3fcdf7a097128af1f4f2e90258c9c0f9098b6d73698147ca830e08acdec64d85fb'
            '154150d5f6959c174a883504464e15e0c728ed71fa7f18ee3e75fa6e6810b7cdb87fae4a9df50587f7324943b5027096f9ef6b98e33bdcf147039fca1049dbd5')

build() {
    cd "${srcdir}"
    patch --forward --input=fwinst.patch --output=fwinst-patched.sh --follow-symlink
    patch --strip=0 --forward --input=pcm.patch
    patch --strip=0 --forward --input=control.patch
    patch --strip=0 --forward --input=chip.patch
}

package() {
    cd ${srcdir}

    install -dm755 ${pkgdir}/usr/lib/firmware
    sh ./fwinst-patched.sh ${pkgdir}

    install -dm755 "${pkgdir}/usr/src/sixfireusb-${pkgver}"
    for f in `find sixfireusb-${pkgver} -type f`
    do
        f2=`basename ${f}`
        install -m644 ${srcdir}/sixfireusb-${pkgver}/${f2} "${pkgdir}/usr/src/sixfireusb-${pkgver}/${f2}"
    done

    install -m644 ${srcdir}/dkms.conf "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
    sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"

    install -dm755 "$pkgdir/etc/modprobe.d"
    install -m644 "$srcdir/blacklist-sixfireusb-dkms.conf" "$pkgdir/etc/modprobe.d"
}

