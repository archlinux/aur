# Maintainer: taotieren <admin@taotieren.com>

pkgname=ksa
pkgver=0.80
pkgrel=2
#epoch=0
pkgdesc="Kanxue Security Access. 看雪安全接入,无需公网IP,远程接入内网"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' )
license=('unknow')
#groups=('')
depends=('unzip')
#source_x86_64=("KSA_${pkgver}_linux_x86_64.zip::KSA_${pkgver}_linux.zip")
#source_i686=("KSA_${pkgver}_linux_i686.zip::KSA_${pkgver}_linux.zip")
#source_armv7h=("KSA_${pkgver}_linux_arm.zip::KSA_${pkgver}_linux.zip")
#source_aarch64=("KSA_${pkgver}_linux_arm64.zip::KSA_${pkgver}_linux.zip")

source=("KSA_${pkgver}.zip::https://ksa.kanxue.com/view/img/product/KSA_${pkgver}.zip"
    "ksa.service")
#desktops=("ksa-linux.desktop")
#source+=(${desktops[@]})
#sha256sums_i686=('b4cafff1b7ee02ec404ca784d8605d4d61f7fdc4551baebb56cbaa08770359ce')
#sha256sums_x86_64=('b4cafff1b7ee02ec404ca784d8605d4d61f7fdc4551baebb56cbaa08770359ce')
#sha256sums_armv7h=('b4cafff1b7ee02ec404ca784d8605d4d61f7fdc4551baebb56cbaa08770359ce')
#sha256sums_aarch64=('b4cafff1b7ee02ec404ca784d8605d4d61f7fdc4551baebb56cbaa08770359ce')

sha256sums=('168fbb25a106f170fa626871c7b1653c72b57a4e3ead082d81f4504f8ed8280f'
    '44bebc2bfddc4f0b3873f7ae68c7b7d0c4d49edd1a63795062b3a2198c37fb77')

#install=$pkgname.install
url="https://ksa.kanxue.com/"
conflicts=("ksa")
replaces=("ksa")
#DLAGENTS=("https::/usr/bin/env curl -o %o -d accept_license_agreement=accepted -d non_emb_ctr=confirmed")
options=(!strip)

# prepare() {
#     #Change src path name
#     if [ ${CARCH} = "i686" ]; then
#         mv KSA_${pkgver}_linux_i686 KSA
#     fi
#     if [ ${CARCH} = "x86_64" ]; then
#         mv KSA_${pkgver}_linux_x86_64 KSA
#     fi
#     if [ ${CARCH} = "armv7h" ]; then
#         mv KSA_${pkgver}_linux_arm KSA
#     fi
#     if [ ${CARCH} = "aarch64" ]; then
#        mv KSA_${pkgver}_linux_arm64 KSA
#     fi
# }

package(){
    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/KSA" \
            "${pkgdir}/usr/bin/"

    install -Dm644 "${srcdir}/ksa.service" "${pkgdir}/usr/lib/systemd/system/ksa.service"

    cd "${srcdir}/KSA_${pkgver}/KSA_linux"
    install -Dm644 ksa.conf "${pkgdir}/opt/KSA"

    # Bulk copy everything
    if [ ${CARCH} = "armv7h" ]; then
        install -Dm755 ksa_arm "${pkgdir}/opt/KSA/ksa"
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 ksa_arm64 "${pkgdir}/opt/KSA/ksa"
    elif [ ${CARCH} = "x86_64" ]; then
        install -Dm755 ksa_x64 "${pkgdir}/opt/KSA/ksa"
    else install -Dm755 ksa_x86 "${pkgdir}/opt/KSA/ksa"
    fi

    for f in ksa; do
        ln -sf /opt/KSA/"$f" "${pkgdir}/usr/bin"
    done

}
