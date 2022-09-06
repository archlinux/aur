# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
_repo=spark-wine
_pkgname=spark-dwine-helper
pkgname=$_pkgname-git
pkgver=1.7.2.1.r1.ac923c3
pkgrel=1
pkgdesc="Helper scripts from Spark Store to make deepin-wine perform better"
arch=(any)
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=(
	'deepin-wine-helper'
	'p7zip'
	'zenity'
)
makedepends=('git')
optdepends=('noto-fonts-cjk: recommended fonts')
provides=("${_pkgname}" "${_pkgname}-settings")
conflicts=("${_pkgname}")
source=(git+$url.git)
md5sums=('SKIP')
_spark_run_v4=s-wine-helper/deepinwine/tools/spark_run_v4.sh
_settings=spark-dwine-helper-settings/opt/durapps/spark-dwine-helper/spark-dwine-helper-settings/settings.sh

pkgver() {
	cd "$srcdir/${_repo}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_repo}/$_pkgname"
	sed -i 's|/opt/durapps/|/usr/lib/|;s|#/bin/bash|#!/bin/bash|' \
		s-wine-helper/durapps/$_pkgname/scale-set-helper/set-wine-scale.sh \
		$_settings $_spark_run_v4
	sed -i 's|Exec=.*|Exec=/usr/bin/spark-dwine-helper-settings|' \
		spark-dwine-helper-settings/usr/share/applications/spark-dwine-helper-settings.desktop
}

package() {
	cd "$srcdir/${_repo}/${_pkgname}"
	cp -r spark-dwine-helper-settings/usr "$pkgdir"
	install -Dm755 $_settings "$pkgdir/usr/bin/$_pkgname-settings"
	install -d "$pkgdir/usr/lib"
	cp -r s-wine-helper/durapps/$_pkgname "$pkgdir/usr/lib"
	install -Dm755 $_spark_run_v4 "$pkgdir/opt/deepinwine/tools/spark_run_v4.sh"
}
