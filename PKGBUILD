# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=2.1.3
_pkgname="${pkgname%-bin}"
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64' 'aarch64')
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
source=("${pkgname}.patch")
_src_url_prefix="https://github.com/deepmind/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux"
source_x86_64=("${_src_url_prefix}-x86_64.tar.gz")
source_aarch64=("${_src_url_prefix}-aarch64.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('f899103e8d65c3e26bae97039fdec790a3ae80de93273414c233615562c0641a')
sha256sums_aarch64=('971afd93517d0079a57f577cfb296d042002d1f86a21b479169c943df1dcf9dc')

prepare() {
	cd "${_pkgname}-${pkgver}"

	# Patch testxml so that it works when the model directory is read only
	patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
	cd "${_pkgname}-${pkgver}/sample"

	# Compile sample programs
	make
}

package() {
	cd "${_pkgname}-${pkgver}"

	# Licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}/" \
		THIRD_PARTY_NOTICES

	# Include headers
	install -Dm644 -t "$pkgdir/usr/include/${_pkgname}" include/*.h

	# Libraries
	install -D -t "$pkgdir/usr/lib" \
		"lib/lib${_pkgname}.so.${pkgver}" \
		"lib/lib${_pkgname}_nogl.so.${pkgver}"
	# Library symlinks
	cp -r \
		"lib/lib${_pkgname}.so" \
		"lib/lib${_pkgname}_nogl.so" \
		"$pkgdir/usr/lib/"

	# Sample binaries
	install -Dm755 -t "$pkgdir/usr/lib/${_pkgname}" \
		bin/{basic,compile,derivative,record,simulate,testspeed,testxml}

	# Documentation
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}/sample" sample/*
	cp -r model "$pkgdir/usr/share/doc/${_pkgname}/model"

	# Complete bundled package for anything that expects it (like pip mujoco_py)
	_bundle_root="$pkgdir/opt/$_pkgname"
	# Include MuJoCo's bundled versions of libraries here.
	install -D -t "$_bundle_root/lib" \
		lib/libglew.so lib/libglewegl.so lib/libglewosmesa.so
	ln -s -t "$_bundle_root/lib" \
		"/usr/lib/lib${_pkgname}.so.${pkgver}" \
		"/usr/lib/lib${_pkgname}.so" \
		"/usr/lib/lib${_pkgname}_nogl.so.${pkgver}" \
		"/usr/lib/lib${_pkgname}_nogl.so"
	install -d "$_bundle_root/bin"
	ln -s -t "$_bundle_root/bin" \
		/usr/lib/${_pkgname}/{basic,compile,derivative,record,simulate,testspeed,testxml}
	ln -s "/usr/include/${_pkgname}" "$_bundle_root/include"
	ln -s "/usr/share/doc/${_pkgname}/model" "$_bundle_root/model"
	ln -s "/usr/share/doc/${_pkgname}/sample" "$_bundle_root/sample"
	ln -s -t "$_bundle_root" \
		"/usr/share/licenses/${_pkgname}/THIRD_PARTY_NOTICES"
}
