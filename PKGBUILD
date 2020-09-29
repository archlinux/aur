# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=stm32cubemonitor
pkgver=1.0.0
pkgrel=2
pkgdesc="graphical software for helping debug and diagnose STM32 applications while they are running by reading and displaying their variables in real-time"
arch=('x86_64')
url="https://my.st.com/content/my_st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-performance-and-debuggers/stm32cubemonitor.html"
license=('custom')
depends=('gtk3' 'nodejs' 'nss' 'libxss' 'libnotify' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux')
provides=("${pkgname}-bin")
conflicts=("${pkgname}-bin")
options=('!strip')
_pkg_file_name=en.STM32CubeMonitor_lin.zip
source=("local://${_pkg_file_name}")
sha256sums=('d82c5282b8d3f64c68b58426bacd1b2139e3984bdb6df6262d3efa67712c9dfd')

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "The package can be downloaded here: "
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

prepare() {
  install -dm755 build
  bsdtar -xf STM32CubeMonitor_lin/${pkgname}_${pkgver}_amd64.deb -C build
}

package() {
  tar -xf build/data.tar.xz -C ${pkgdir}
  
  install -dm755 ${pkgdir}/opt
  mv ${pkgdir}/usr/lib/${pkgname} ${pkgdir}/opt
  rm -rf ${pkgdir}/usr/lib
  rm -rf ${pkgdir}/usr/share/lintian

  # soft link
  ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # license
  install -Dm644 STM32CubeMonitor_lin/licenses/licenses_list_STM32CubeMonitor.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
