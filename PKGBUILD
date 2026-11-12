# Maintainer: codekoala <arch@cloudlery.com>
pkgname=aws-emulator-bin
_pkgname=aws-emulator
pkgver=1.0.322
pkgrel=1
pkgdesc='Local emulator for AWS services, for testing against the AWS CLI and SDKs (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/aws/aws-emulator'
license=('CC0-1.0' 'Apache-2.0')
depends=('glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
noextract=("${_pkgname}_${pkgver}-1_amd64.deb" "${_pkgname}_${pkgver}-1_arm64.deb")
validpgpkeys=('98BCF336A3BE53B734E967C52E5BF49BD940F624') # SSM Publishing <ssm-publishing@amazon.com>
_dlurl="https://downloads.aws.com/aws-emulator/packages/aws-emulator/LTS"
source=("${_pkgname}-LICENSE-${pkgver}::https://raw.githubusercontent.com/aws/aws-emulator/v${pkgver}/LICENSE")
source_x86_64=("${_dlurl}/${_pkgname}_${pkgver}-1_amd64.deb"{,.sig})
source_aarch64=("${_dlurl}/${_pkgname}_${pkgver}-1_arm64.deb"{,.sig})
sha256sums=('a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')
sha256sums_x86_64=('ef3c75e5d4196bf2c0170b55b75b01e340e0ef497e636b700a1efe68d68a60d7'
                   'SKIP')
sha256sums_aarch64=('8cfabb461ccfbfa75468393e8dfbf5216b07ef54fcf20584c11d02a9fc854b03'
                    'SKIP')

prepare() {
    # makepkg does not unpack .deb files; extract the payload manually
    mkdir -p deb
    bsdtar -xf "${_pkgname}_${pkgver}-1_"*.deb -C deb
    bsdtar -xf deb/data.tar.* -C deb
}

package() {
    install -Dm755 deb/opt/aws-emulator/bin/aws-emulator "${pkgdir}/usr/bin/aws-emulator"

    install -Dm644 "${_pkgname}-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 deb/opt/aws-emulator/THIRD_PARTY_LICENSES \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSES"
}
