# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='frida-tools'
pkgver=14.10.4
pkgrel=1
pkgdesc='CLI tools for Frida'
arch=('any')
url='https://github.com/frida/frida-tools'
license=('LGPL-2.0-or-later WITH WxWindows-exception-3.1')
depends=(
	'python'
	'python-colorama'
	'python-frida>=17.10.0'
	'python-frida<18'
	'python-prompt_toolkit'
	'python-pygments'
	'python-websockets>=16'
	'python-websockets<17'
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
	'websockets-16.patch'
)
b2sums=(
	'1bdddf8a492d0312977b96f1b8366dd27660247bb3e7dfaf59bed94901fe71c9ce9d9bbb1be445d85ad174322b6b71a7a5f3bbebfc929cb7045b58f5763b6717'
	'5a74d5c0b47acde240dd678db3f42a2487979af62619f7a26f524520e24a1d3e973833b18ee3851c6dde04d04984199e5ff13da411f73ed7580e4b547e27c22d'
)

prepare() {
	local _npm_dir
	local _npm_cache="${srcdir}/npm-cache"

	cd -- "${pkgname}-${pkgver}" || return 1
	patch -Np1 --fuzz=0 -i "${srcdir}/websockets-16.patch"

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

package() {
	cd -- "${pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -Dm644 completions/frida.fish \
		"${pkgdir}/usr/share/fish/vendor_completions.d/frida.fish"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
