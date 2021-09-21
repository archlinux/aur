_pkgbase=mxu11x0
pkgname=${_pkgbase}-dkms
pkgver=5.14.6
pkgrel=1
pkgdesc="Kernel module for Moxa UPort 11x0 serial to USB converters"
url="http://www.moxa.com"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
makedepends=('unzip' 'tar')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: build module against the Arch kernel'
            'linux-lts-headers: build module against the LTS kernel'
            'linux-zen-headers: build module against the ZEN kernel'
            'linux-hardened-headers: build module against the HARDENED kernel')
source=(
    "https://www.moxa.com/getmedia/502ff380-9944-4af7-8ed2-20883d2ae702/moxa-uport-1100-series-linux-kernel-5.x-driver-v5.0.zip"
    'dkms.conf'
    'mxu11x0.c.patch')
sha512sums=('019de09b4aee3d0c5ed5a0393e42e52768780fc1611bce4c21c3496584e294be303dbf896456cbcdf6c4be8ad94e6b44d8f4537b546fa6c356f0cd8b7835f9a1'
    'd321cb599264f3efb2a6f5bb50048aa95cd823f18e65bf5b709db06313f59266a44ccb9bc460a502457de418b8cbacef6b96c23c144f7695785ebe74b5e13a4c'
    '63c6340ca06a2e2a0a2522e9ba36860670fdb9366ede1d908d4f9a95850165cb53015ccf08c0ef291a2c26b372fa81f1338650b65195307b6c204a4e0c0c2ddf'
)

prepare() {
    tar -xzf driv_linux_uport_v5.0_build_19110614.tgz
    [[ -d ${_pkgbase}-${pkgver} ]] || mkdir ${_pkgbase}-${pkgver}
    mv mxu11x0/driver/Makefile mxu11x0/driver/*.[hc] ${_pkgbase}-${pkgver}
    patch ${_pkgbase}-${pkgver}/mxu11x0.c mxu11x0.c.patch
}

package() {
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
    mkdir -p "${pkgdir}/etc/modules-load.d/"
    echo "${_pkgname}" > "${pkgdir}/etc/modules-load.d/${_pkgbase}.conf"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${_pkgbase}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    cp -dr "${_pkgbase}-${pkgver}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
