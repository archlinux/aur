# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: AwesomeHaircut <jesusbalbastro at gmail com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

_pkgname=droidcam
pkgname=${_pkgname}-dev
pkgver=2.1.2
pkgrel=1
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64' 'aarch64')
url="https://github.com/dev47apps/${_pkgname}"
license=('GPL')
install=${_pkgname}.install
backup=("etc/modprobe.d/${_pkgname}.conf")
makedepends=('gtk3' 'libappindicator-gtk3' 'ffmpeg' 'libusbmuxd')
conflicts=("${_pkgname}" "${_pkgname}-dkms")
options=('!strip')
source=("${_pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip"
        "${_pkgname}-modules.conf" "${_pkgname}-modprobe.conf"
        ${_pkgname}.desktop)

sha512sums=('0a7d479418b349c0ad965da7875467c6897a2fb2fe6a59a791af7fbd69b45fd43cdf900fbc16d1ff939bdd71bafef6c1c6e1bfda8497c3fcbb73f23d2cc083dd'
            '715be186aff2eca7b383ca5bef00e34d08363fd688cea49080828e8b31db3b43d9605d4e2951ffdece9e80a94645e065189617f87337b0084946f20f61f76588'
            'ed250836033eab59eabc81a1346168d886fbe026c56a43f04d0e153b2a9593d03be6846e114cde664fe00135a24b8bf55f46ece6ecee6aca52f651f29a3bb28b'
            'df0968e8da3b733e29cdda07f0f6f278d4be71d241b21d37631ed8c45b104fea718d05c395b306be8aba2c7acc1a9d69807c4ab9404812b684426ba6d879eea4')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

}

build() {
    cd ${_pkgname}-${pkgver}

    # Also libusbmuxd requires an override while linking.
    make  USBMUXD=-lusbmuxd-2.0
}

package() {
    depends=('alsa-lib' "v4l2loopback-dkms" 'ffmpeg' 'libjpeg-turbo' 'libusbmuxd' 'linux-headers' 'speex')
    optdepends=('gtk3: use GUI version in addition to CLI interface'
                'libappindicator-gtk3: use GUI version in addition to CLI interface')
    provides=("${_pkgname}=${pkgver}")

    pushd ${_pkgname}-${pkgver}

    # Install droidcam program files
    mkdir -p ${pkgdir}/opt/${_pkgname}
    install -Dm755 ${_pkgname} "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    install -Dm755 ${_pkgname}-cli "${pkgdir}/opt/${_pkgname}/${_pkgname}-cli"
    install -Dm644 "${srcdir}/${_pkgname}-modprobe.conf" "${pkgdir}/etc/modprobe.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/${_pkgname}-modules.conf" "${pkgdir}/etc/modules-load.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 README.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 icon2.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 icon2.png "${pkgdir}/opt/${_pkgname}-icon.png"

    # Symlink
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    ln -s /opt/${_pkgname}/${_pkgname}-cli "${pkgdir}/usr/bin/${_pkgname}-cli"
}

