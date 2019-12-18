# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
pkgname=(xilinx-hw-server)
pkgver=2019.2
pkgrel=1
pkgdesc="A software suite produced by Xilinx for synthesis and analysis of HDL designs, superseding Xilinx ISE with additional features for system on a chip development and high-level synthesis."
arch=('x86_64')
url="https://www.xilinx.com/products/design-tools/vivado.html"
license=('custom')
_dirname='Xilinx_HW_Server_Lin_2019.2_1106_2127'
# bug fix from https://forums.xilinx.com/t5/Installation-and-Licensing/Intaller-hans-at-quot-generating-installed-device-list-quot-in/td-p/658743
depends=()
options=(!strip)
source=("file://Xilinx_HW_Server_Lin_2019.2_1106_2127.tar.gz"
        "install_config.txt"
	"hwserver.service")
md5sums=('d26a93b008260514876ce996a1a4f6b8'
         'e7baf62a7c90cf1dad587961fc583ba6'
         'b4e824139733d66274d54048b9afc9a0')

prepare() {
    cd $srcdir/$_dirname
    cp $srcdir/install_config.txt ./
    sed -i 5iDestination=${srcdir}/extracted install_config.txt
}
build() {
    cd $srcdir/$_dirname
    LANG=C && LC_ALL=C && unset QT_PLUGIN_PATH && ./xsetup -a XilinxEULA,3rdPartyEULA,WebTalkTerms -b Install -c install_config.txt
    # FIXME: clean log files
    rm -rf ~/.Xilinx
}
package() {
    mkdir -p ${pkgdir}/opt/xilinx/HWSRVR
    mkdir -p ${pkgdir}/usr/lib/systemd/system/
    mv ${srcdir}/extracted/HWSRVR/${pkgver}/* ${pkgdir}/opt/xilinx/HWSRVR/
    install -Dm644 hwserver.service ${pkgdir}/usr/lib/systemd/system/hwserver.service
}
