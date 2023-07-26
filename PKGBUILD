# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.qq.tim.spark
pkgver=3.4.3.22064spark5
pkgrel=1
pkgdesc="Tencent TIM Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="https://tim.qq.com/"
license=('unknown')
depends=(
	'bash'
	'deepin-wine5'
	'hicolor-icon-theme'
	'spark-dwine-helper'
)
conflicts=('com.qq.tim.dcs')
# install=tim.install
_upstream_arch=all
source=(
	"https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${pkgname}/${pkgname}_${pkgver}_${_upstream_arch}.deb"
	"reg.patch"
)
sha512sums=(
	'fbbb0ee76699d5d335403efbb3b2ee25adf9fcec32fcb895161b3c6d022b4daf8c4c97532c0fd240565f8f7ce3fdb14e3bfaf968cead46a237715c04f6404ad9'
	'5730066dc9bf3689e3db1c08ba83b516efc0bcc7fe6ff47198b43dd352718a6942d01190da87fe010816bf1e9e0e453a09fd15314e4004c309e7f52725b32528'
)

prepare() {
	_bottle_archive="${srcdir}/dpkgdir/opt/apps/com.qq.tim.spark/files/files.7z"
	mkdir -p "${srcdir}/dpkgdir"
	tar -xpvf data.tar.xz -C "${srcdir}/dpkgdir"
	7z x $_bottle_archive user.reg -o"${srcdir}/"
	patch -p1 -d "${srcdir}/" < "${srcdir}/reg.patch"
	7z a $_bottle_archive "${srcdir}/user.reg"

	cd "${srcdir}/dpkgdir"
	mkdir usr
	mv opt/apps/${pkgname}/entries usr/share
    sed -i 's/TIM.exe/tim.exe/' usr/share/applications/com.qq.tim.spark.desktop
	sed -i 's|START_SHELL_PATH=.*|START_SHELL_PATH="/opt/deepinwine/tools/spark_run_v4.sh"|' opt/apps/${pkgname}/files/run.sh
	rm -rf opt/apps/${pkgname}/{entries/,info}
}

package() {
	cd "${pkgdir}"
	mv "${srcdir}"/dpkgdir/* .
}
