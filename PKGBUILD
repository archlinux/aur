# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Asparagus Maximus <asparagus.maximus@gmail.com>

pkgname=hdapsicon-git
pkgver=2eec2c7
pkgrel=1
pkgdesc="A standalone GTK applet for HDAPS disk protection status - formerly known as ThinkHDAPS"
arch=('any')
url="https://github.com/thpani/thinkhdaps"
license=("GPL")
depends=(pygtk gnome-python tp_smapi hdapsd)
source=("${pkgname}::git+https://github.com/thpani/thinkhdaps")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	# Use the tag of the last commit
	git describe --long --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare()
{
	cd "${srcdir}/${pkgname}"
	./autogen.sh
	./configure --prefix=/usr --enable-desktop
}

build()
{
	cd "${srcdir}/${pkgname}"
	make
}

package()
{
	make -C "${pkgname}" DESTDIR="${pkgdir}" install
	sed -i 's:^#!/usr/bin/python$:&2:' "${pkgdir}/usr/bin/${pkgname%%-git}"
}
