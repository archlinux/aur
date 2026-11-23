# Maintainer: codekoala <arch@cloudlery.com>
pkgname=aws-emulator-bin
_pkgname=aws-emulator
pkgver=1.0.587
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
# AWS signing key (SSM Publishing <ssm-publishing@amazon.com>). It is not on any keyserver; AWS
# publishes it at https://downloads.aws.com/keys/gpg/current.asc and documents the fingerprint at
# https://docs.aws.amazon.com/emulator/latest/userguide/getting-started-linux.html#getting-started-linux-verify
# A copy is in keys/pgp/. If makepkg reports an unknown key, run: gpg --import keys/pgp/*.asc
validpgpkeys=('98BCF336A3BE53B734E967C52E5BF49BD940F624')
_dlurl="https://downloads.aws.com/aws-emulator/packages/aws-emulator/LTS"
source=("${_pkgname}-LICENSE-${pkgver}::https://raw.githubusercontent.com/aws/aws-emulator/v${pkgver}/LICENSE")
source_x86_64=("${_dlurl}/${_pkgname}_${pkgver}-1_amd64.deb"{,.sig})
source_aarch64=("${_dlurl}/${_pkgname}_${pkgver}-1_arm64.deb"{,.sig})
sha256sums=('a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')
sha256sums_x86_64=('b589d53569ca4a709261d3c0bad08a35599954174ba2fa884c95b6bfe22f6c9d'
                   'SKIP')
sha256sums_aarch64=('39e62d2ea23af993fe0c067dd9bc1e31f6b5c36e398c978dd2bfd9414e9828b7'
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
