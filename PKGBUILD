# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray<k@ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=0.3.1.r55.g0f77151
pkgrel=1
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/mo-jinran/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
makedepends=("nodejs" "npm")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
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
	
	echo "Pulling submodules"
	git submodule update --init --recursive -f
}

build() {
	cd LiteLoaderQQNT

	echo "Install node dependencies for builtin modules using NPM"
	cd builtins
	Builtins=$(ls)
	for i in ${Builtins[@]}
	do
		if [ -f ./${i}/package.json ]; then
			echo "Installing node dependencies for ${i}..."
			cd "${i}"
                	npm install
			cd ..
			echo "NPM Install for ${i} done."
	        fi
	done
	echo "Install node dependeccies done."
}

package() {
	mkdir -p "${pkgdir}/opt/QQ/resources/app/"
	cp -a "${_pkgname}" "${pkgdir}/opt/QQ/resources/app/LiteLoader"
	
	# cleaning up any .git dir from final package.
	cd "${pkgdir}/opt/QQ/resources/app/LiteLoader"
	rm -rf ./.git

	Builtins=$(ls ./builtins)
	for i in ${Builtins[@]}
	do
		rm -rf ./builtins/${i}/.git
	done
	# cleaning up done.
	
	# show tips to user.
	echo "======== TIPS ========"
	echo "If you reinstall/install/upgrade linuxqq after installing this package, "
	echo "you may need to reinstall this package to make LiteLoaderQQNT works."
	echo "======== TIPS ========"
}
