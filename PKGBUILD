# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=2.00
_pkgname="${pkgname%-bin}"
_pkgnamever="${_pkgname}${pkgver/.}"
pkgrel=3
pkgdesc="A fast and accurate physics engine for research and development."
arch=('x86_64')
url="https://www.roboti.us"
license=('custom')
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
backup=("usr/share/licenses/${_pkgname}/mjkey.txt")
source=("$url/download/${_pkgnamever}_linux.zip"
        "${_pkgnamever}_resourcelicense.txt::https://www.roboti.us/resourcelicense.txt"
        "${pkgname}.patch"
        "mjkey://mjkey.txt")
sha256sums=("ba8560040f6ca47dbd89e4731bc9e06080a99eba4583cda95cdedca802389153"
            "4baa3f457085060d512b24997e448e93a47745ac0de3165b4020f09fbc9befc2"
            "1a4ba8d66acbde166071d4dadaf0c27a5474243d577683aa4f520d7a52c0dc58"
            "SKIP")
DLAGENTS+=("mjkey::/usr/bin/echo %u - ${BOLD}${RED} Obtain a license from $url/license.html and place mjkey.txt in \"$PWD\" ${ALL_OFF}")

prepare() {
	cd "${_pkgnamever}_linux"

	# License Key
	if ! [ -f "${srcdir}/mjkey.txt" ]; then
		echo ""
		echo "MuJoCo Requires a License"
		echo "========================="
		echo "Obtain a license from $url/license.html"
		echo "Place mjkey.txt in the same directory as PKGBUILD"
		echo ""
		exit 1
	fi

	# MuJoCo examples expect license key in current directory.
	# Change this to the license install location.
	sed -i'' -e "s#\"mjkey.txt\"#\"/usr/share/licenses/${_pkgname}/mjkey.txt\"#g" sample/*.cpp

	# Patch testxml so that it works when the model directory is read only
	patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
	cd "${_pkgnamever}_linux/sample"

	# Compile sample programs
	make
}

package() {
	cd "${_pkgnamever}_linux"

	# Licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" \
		"${srcdir}/mjkey.txt" "doc/REFERENCE.txt"
	install -Dm644 "${srcdir}/${_pkgnamever}_resourcelicense.txt" \
		"$pkgdir/usr/share/licenses/${_pkgname}/resourcelicense.txt"

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
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" doc/README.txt
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
