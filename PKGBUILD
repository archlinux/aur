# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

_pkgname=tshock
pkgname=${_pkgname}-bin
pkgver=4.3.26
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=1
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI."
arch=(any)
url="http://tshock.co/xf"
license=("GPL3")
depends=("mono" "tmux")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}_${pkgver}.zip::https://github.com/Pryaxis/TShock/releases/download/v${pkgver}/${_pkgname}_${pkgver}.zip"
        'tshock.sh'
        'default.conf'
        'service'
        "tmpfiles"
        "sysusers")
noextract=("${_pkgname}_${pkgver}.zip")
sha512sums=('b61712988fb34324625bbba49779655c7b92e067a720b7d116c41583addec3592ae0a879a02e664fa172572512c0aad56038a4d1e5535f47e31108cb683e300c'
            'f0958448b53ff9851c47876b89f1cef6d3e33ce1b8cbe13167c685ed1c9d89a8bf0f01929d47200e4f0f964c3e7796a2d9ca558e5d9f1269db3f2e4537a6c97a'
            'd530a528ba84d57dfcb360e03ec62b1b38da6fa2383bef8cdb0cd039ba6466b053dd99a130a858c86405c8957ba86a0a080f2f56089843a7055662fa41cee102'
            '7c1788f21664f038c32da6c0cbe817404a83f81b7b8be07bb0483d5ffd35991a07b647b18d7aa316db369edd4e7eab21c1b81ab3b45aa2c3692c6c63673a3fdb'
            'a04b458932bb3882b9d40f9b5a9074b681e60cb3284635d1efb7e54293f39df334e7ae526dabf50f633ecdde980f287a939d3ea6eb0d4098663fbda21af70a65'
            '5752f8453fbb4d973ebe71bba371ae7b0ddd2313ccd17de89b3942d024e295805324085640756e7118e4cc76abee675f5e253526261cb62cb76b0bc155aca317')

backup=("etc/conf.d/${_pkgname}")

package() {
    install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/usr/bin/tshock"

    install -Dm644 "${srcdir}/default.conf" "${pkgdir}/etc/conf.d/${_pkgname}/default.conf"

    # Install sysusers
    install -Dm644 "${srcdir}/sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"

    # Install tmpfiles
    install -Dm644 "${srcdir}/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

    # Install service
    install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/tshock@.service"

    # Unzip server files
    install -d "${pkgdir}/srv/tshock"
    bsdtar -x -f "${srcdir}/${_pkgname}_${pkgver}.zip" -C "${pkgdir}/srv/tshock"
}
