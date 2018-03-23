# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# The following contributors are from the vim-youcompleteme-git AUR package
# Contributor: Babken Vardanyan <483ken 4tgma1l
# Contributor: stykr
# Contributor: Svenstaro
# Contributor: KaiSforza
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

# clang completion is builtin and cannot be provided separately (?)
_clang_completer=y

pkgname=neovim-youcompleteme-core-git
pkgver=r2282.788c293a
pkgrel=2
pkgdesc='A code-completion engine for Vim'
arch=(i686 x86_64)
url='https://valloric.github.io/YouCompleteMe/'
license=('GPL3')
depends=('neovim' 'boost-libs' 'python>=3.2' 'python-bottle' 'python-waitress' 'python-frozendict' 'python-requests-futures' 'python-future' 'python-neovim')
makedepends=('git' 'cmake' 'boost')
optdepends=(
	'gocode-git: Go semantic completion'
	'godef-git: Go semantic completion'
	'nodejs-tern: JavaScript semantic completion'
	'racerd-git: Rust semantic completion'
	'typescript: Typescript semantic completion'
	'python-jedihttp-git: Python semantic completion')
# https://github.com/Valloric/ycmd/pull/213
#'omnisharp-roslyn: C# semantic completion'

source=('git+https://github.com/Valloric/YouCompleteMe.git'
        'git+https://github.com/Valloric/ycmd')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "${srcdir}/YouCompleteMe"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

if [ "${_clang_completer}" == 'y' ]; then
	depends+=('clang>=6.0')
fi

prepare() {
	cd "${srcdir}/YouCompleteMe"
	git reset --hard
	git -C 'third_party/ycmd' reset --hard
	git config submodule.third_party/ycmd.url "${srcdir}/ycmd"
	git submodule update --init 'third_party/ycmd'
}

build() {
	mkdir -p "${srcdir}/ycmd_build"
	cd "${srcdir}/ycmd_build"

	cmake_flags="-DUSE_PYTHON2=OFF -DUSE_SYSTEM_BOOST=ON"

	if [ "${_clang_completer}" == 'y' ]; then
		cmake_flags+=" -DUSE_CLANG_COMPLETER=ON -DUSE_SYSTEM_LIBCLANG=ON"
	fi

	cmake ${cmake_flags} . "$srcdir/YouCompleteMe/third_party/ycmd/cpp"
	make ycm_core
}

package() {
	pkg_ycmd_dir="${pkgdir}/usr/share/nvim/runtime/third_party/ycmd"
	src_ycmd_dir="${srcdir}/YouCompleteMe/third_party/ycmd"
	mkdir -p "${pkg_ycmd_dir}"

	cp -r "${srcdir}/YouCompleteMe/"{autoload,doc,plugin,python} "${pkgdir}/usr/share/nvim/runtime"
	cp -r "${src_ycmd_dir}/"{ycmd,ycm_core.so,CORE_VERSION} "${pkg_ycmd_dir}"
	if [ "${_clang_completer}" == 'y' ]; then
		clang_version="$(clang --version|sed -n 's/clang version \([0-9.]\+\) .*/\1/p')"
		ln -s "/usr/lib/clang/${clang_version}/include/" "${pkg_ycmd_dir}/clang_includes"
		unset clang_version
	fi

        install -Ddm755 "${pkg_ycmd_dir}/third_party/JediHTTP"
        install -Ddm755 "${pkg_ycmd_dir}/third_party/tern_runtime/node_modules/"
        install -Ddm755 "${pkg_ycmd_dir}/third_party/gocode/"
        install -Ddm755 "${pkg_ycmd_dir}/third_party/godef/"
        ln -s /usr/bin/jedihttp "${pkg_ycmd_dir}/third_party/JediHTTP/jedihttp"
        ln -s /usr/lib/node_modules/tern "${pkg_ycmd_dir}/third_party/tern_runtime/node_modules/"
        ln -s /usr/bin/gocode "${pkg_ycmd_dir}/third_party/gocode/"
        ln -s /usr/bin/godef "${pkg_ycmd_dir}/third_party/godef/"

	find "${pkgdir}" \( -name .git -or -name 'test*' -or -name 'run_tests.py' -or -name 'CMakeFiles' \) -exec rm -fr {} +

	python -m compileall "$pkgdir"
}
