# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgbase=prjxray
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-tools-git" "python-$_pkgbase-git")
pkgver=r3602.51132a11
pkgrel=1
pkgdesc="Documenting the Xilinx 7-series bit-stream format"
arch=(x86_64)
url="https://github.com/SymbiFlow/prjxray"
license=('ISC')
depends=()
_pythondepends=('python' 'python-fasm' 'python-intervaltree' 'python-numpy'
                'python-pyjson5' 'python-yaml' 'python-simplejson')
makedepends=('git' 'cmake' 'python-setuptools')
makedepends+=("${_pythondepends[@]}")
optdepends=('prjxray-db: The pre-built database')
checkdepends=('python-pytest')
source=("git+$url"
        "git+https://github.com/arsenm/sanitizers-cmake"
        "git+https://github.com/google/googletest"
        "git+https://github.com/gflags/gflags"
        "git+https://github.com/google/cctz"
        "git+https://github.com/abseil/abseil-cpp"
        "git+https://github.com/jbeder/yaml-cpp"
        '0001-fix-set-C-standard-to-14.patch'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5f47ffb9b89b976046588968f9a5038da7612211c1a85b396d62a24973941730')

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgbase"

	# include fasm2frames in python package
	mv utils/fasm2frames.py prjxray/
	sed -E 's/(fasm2frames=)utils/\1prjxray/' -i setup.py

	local _mods=(sanitizers-cmake googletest gflags cctz abseil-cpp yaml-cpp)

	git submodule init
	for mod in "${_mods[@]}"; do
		git config "submodule.third_party/$mod.url" "$srcdir/$mod"
	done

	cd third_party
	git submodule update "${_mods[@]}"

	cd abseil-cpp
	patch -p1 < "$srcdir/0001-fix-set-C-standard-to-14.patch"
}

build() {
	cmake -B build -S "$_pkgbase" \
		-DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	make -C build

	cd "$_pkgbase"
	python setup.py build
}

check() {
	cd "$_pkgbase"

	env PYTHONPATH=. pytest tests/
}

package_prjxray-tools-git() {
	depends+=('gcc-libs')
	provides=("${pkgname%%-git}" "prjxray" "prjxray-git")
	conflicts=("${pkgname%%-git}" "prjxray")
	replaces=("prjxray-git")

	make -C build DESTDIR="$pkgdir/" install
	install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-prjxray-git() {
	arch=(any)
	depends+=("${_pythondepends[@]}")
	provides=("${pkgname%%-git}")
	conflicts=("${pkgname%%-git}")

	cd "$_pkgbase"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
