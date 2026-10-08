# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='frida-tools'
pkgver=14.11.0
pkgrel=1
pkgdesc='CLI tools for Frida'
arch=('any')
url='https://github.com/frida/frida-tools'
license=('LGPL-2.0-or-later WITH WxWindows-exception-3.1')
depends=(
	'python'
	'python-colorama'
	'python-frida>=17.22.0'
	'python-frida<18'
	'python-prompt_toolkit'
	'python-pygments'
	'python-websockets>=17'
	'python-websockets<18'
)
makedepends=(
	'meson'
	'ninja'
	'nodejs'
	'npm'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
provides=("python-frida-tools=${pkgver}")
conflicts=('python-frida-tools')
replaces=('python-frida-tools')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'websockets-17.patch'
)
b2sums=(
	'c1649938787276abd2e2b394f36c268be27507a12c996132fed9ebe144e10cf462538f15559abe41381779e4343953717562f61df711888edeea8ed93740c19a'
	'a411259c37883879719fe6c444eb50138e0ae78984e6014ce0d7b7dccc2899440dfb3de6aa41491630b411207d8aa2db56e2ea515cad8691c284cc2de5b32a6e'
)

prepare() {
	local _npm_dir
	local _npm_cache="${srcdir}/npm-cache"

	cd -- "${pkgname}-${pkgver}" || return 1
	patch -Np1 --fuzz=0 -i "${srcdir}/websockets-17.patch"

	mkdir -p -- "${_npm_cache}"
	export npm_config_cache="${_npm_cache}"
	export npm_config_audit=false
	export npm_config_fund=false

	for _npm_dir in \
		agents/fs \
		agents/itracer \
		agents/repl \
		agents/tracer \
		apps/tracer \
		bridges; do
		(
			cd -- "${_npm_dir}" || exit 1
			npm ci --ignore-scripts
		)
	done
}

build() {
	export FRIDA_VERSION="${pkgver}"
	export npm_config_cache="${srcdir}/npm-cache"
	export npm_config_offline=true
	export npm_config_audit=false
	export npm_config_fund=false

	cd -- "${pkgname}-${pkgver}" || return 1
	meson setup --prefix=/usr --wrap-mode=nodownload build
	meson compile -C build
	python -m build --wheel --no-isolation
}

check() {
	local _test_dir="${srcdir}/${pkgname}-${pkgver}/.frida-compile-library-test"
	local _test_output="${_test_dir}/dist"
	local _test_source="${_test_dir}/index.ts"

	rm -rf -- "${_test_dir}"
	mkdir -p -- "${_test_dir}"
	printf '%s\n' 'export function add(a: number, b: number) { return a + b; }' > "${_test_source}"

	cd -- "${pkgname}-${pkgver}" || return 1
	PYTHONPATH="${PWD}" python -c 'import frida_tools.tracer'
	PYTHONPATH="${PWD}" python -m frida_tools.compiler \
		--library \
		--output "${_test_output}" \
		"${_test_source}"
	find "${_test_output}" -type f -print -quit | grep -q .
}

package() {
	cd -- "${pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -Dm644 completions/frida.fish \
		"${pkgdir}/usr/share/fish/vendor_completions.d/frida.fish"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
