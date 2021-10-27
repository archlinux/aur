# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=2.1.0
_pkgname="${pkgname%-bin}"
_pkgnamever="${_pkgname}${pkgver//./}"
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64')
url="https://www.mujoco.org"
license=('Apache')
# A headless version could exclude all of these gl dependencies
# but I figure the graphical use-case is common enough that it's better to
# include them and avoid issues when people are not aware that they should
# install the optional dependencies.
# Avoiding library confusion is especially important because the official mujoco
# workflow is to load the custom library binaries that come packaged, which is
# hopefully unnecessary and undesirable here.
# This package is designed to avoid LD_PRELOAD and LD_LIBRARY_PATH hacks.
depends=('libgl' 'glew' 'glfw')
provides=('mujoco')
conflicts=('mujoco')
source=("$url/download/${_pkgnamever}-linux-x86_64.tar.gz"
        "${pkgname}.patch")
sha256sums=("a436ca2f4144c38b837205635bbd60ffe1162d5b44c87df22232795978d7d012"
            "SKIP")

prepare() {
	cd "${_pkgnamever}"

	# Patch testxml so that it works when the model directory is read only
	patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
	cd "${_pkgnamever}/sample"

	# Compile sample programs
	make
}

package() {
	cd "${_pkgnamever}"

	# Licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}/" \
		THIRD_PARTY_NOTICES

	# Include headers
	install -Dm644 -t "$pkgdir/usr/include/${_pkgname}" include/*.h

	# Libraries
	install -D -t "$pkgdir/usr/lib" \
		"bin/lib${_pkgnamever}.so" \
		"bin/lib${_pkgnamever}nogl.so"

	# Sample binaries
	install -Dm755 -t "$pkgdir/usr/lib/${_pkgname}" \
		bin/{basic,compile,derivative,record,simulate,testspeed,testxml}

	# Documentation
	# install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" doc/README.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}/model" model/*
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}/sample" sample/*

	# Complete bundled package for anything that expects it (like pip mujoco_py)
	_bundle_root="$pkgdir/opt/$_pkgname"
	# Include MuJoCo's bundled versions of libraries here.
	install -Dm644 -t "$_bundle_root/bin" \
		bin/libglew.so bin/libglewegl.so bin/libglewosmesa.so \
		bin/libglfw3.a bin/libglfw.so.3
	ln -s -t "$_bundle_root/bin" \
		"/usr/lib/lib${_pkgnamever}.so" "/usr/lib/lib${_pkgnamever}nogl.so"
	ln -s -t "$_bundle_root/bin" \
		/usr/lib/${_pkgname}/{basic,compile,derivative,record,simulate,testspeed,testxml}
	ln -s "/usr/include/${_pkgname}" "$_bundle_root/include"
	ln -s "/usr/share/doc/${_pkgname}" "$_bundle_root/doc"
	ln -s "/usr/share/doc/${_pkgname}/model" "$_bundle_root/model"
	ln -s "/usr/share/doc/${_pkgname}/sample" "$_bundle_root/sample"
}
