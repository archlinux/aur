# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray<k@ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=0.3.1.r54.gc9f8836
pkgrel=1
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/mo-jinran/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
makedepends=("nodejs" "npm")
conflicts=("linuxqq-appimage")
provides=("liteloader-qqnt")
install=${pkgname}.install
source=("git+${url}.git")
md5sums=('SKIP')

pkgver(){
    cd LiteLoaderQQNT
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare () {
	cd LiteLoaderQQNT
	
	# pull submodules
	git submodule update --init --recursive
}

build() {
	cd LiteLoaderQQNT

	# install node depends for modules
	cd builtins	
	Builtins=$(ls)
	for i in ${Builtins[@]}
	do
		if [ -f ./${i}/package.json ]; then
			cd "${i}"
                	npm install
			cd ..
	        fi
	done
}

package() {
	mkdir -p "${pkgdir}/opt/QQ/resources/app/"
	cp -a "${_pkgname}" "$pkgdir/opt/QQ/resources/app/LiteLoader"

	echo "======== TIPS ========"
	echo "If you reinstall/install/upgrade linuxqq after installing this package, "
	echo "you may need to reinstall this package to make LiteLoaderQQNT works."
	echo "======== TIPS ========"
}
