# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
_repo=spark-wine
_pkgname=spark-dwine-helper
pkgname=$_pkgname-git
pkgver=2.5.r10.ed10de0
pkgrel=1
pkgdesc="Helper scripts from Spark Store to make deepin-wine perform better"
arch=(any)
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=(
	'bash'
	# 'dbus-python'
	'deepin-wine-helper'
	'hicolor-icon-theme'
	'p7zip'
	# 'python'
	# 'python-gobject'
	'spark-transhell'
	'zenity'
)
makedepends=('git')
optdepends=(
	'noto-fonts-cjk: recommended fonts'
	'python2: required by spark_get_tray_window script'
)
provides=("${_pkgname}=${pkgver}" "${_pkgname}-settings")
conflicts=("${_pkgname}")
source=(git+$url.git)
md5sums=('SKIP')
_deepinwine=s-wine-helper/deepinwine
_settings=spark-dwine-helper-settings/opt/durapps/spark-dwine-helper/spark-dwine-helper-settings/settings.sh

pkgver() {
	cd "$srcdir/${_repo}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_repo}/$_pkgname"
	sed -i 's|/opt/durapps/transhell/transhell.sh|/opt/bashimport/transhell.sh|;s|/opt/durapps/|/usr/lib/|;s|#/bin/bash|#!/bin/bash|' \
		s-wine-helper/durapps/$_pkgname/scale-set-helper/set-wine-scale.sh \
		$_settings $_deepinwine/tools/spark_run_v4.sh
	sed -i 's|Exec=.*|Exec=/usr/bin/spark-dwine-helper-settings|' \
		spark-dwine-helper-settings/usr/share/applications/spark-dwine-helper-settings.desktop
	# sed -i 's|python2|python3|' \
	# 	$_deepinwine/tools/spark_get_tray_window
}

package() {
	cd "$srcdir/${_repo}/${_pkgname}"
	cp -r spark-dwine-helper-settings/usr "$pkgdir"
	install -Dm755 $_settings "$pkgdir/usr/bin/$_pkgname-settings"
	install -d "$pkgdir/usr/lib" "$pkgdir/opt"
	cp -r s-wine-helper/durapps/$_pkgname "$pkgdir/usr/lib"
	cp -r $_deepinwine "$pkgdir/opt"
}
