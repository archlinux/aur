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
pkgver=r2004.1d1a4f4c
pkgrel=1
pkgdesc='A code-completion engine for Vim'
arch=(i686 x86_64)
url='http://valloric.github.com/YouCompleteMe/'
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
# missing completers:
# OmniSharp-Roslyn - ???

source=('git+https://github.com/Valloric/YouCompleteMe.git'
        'git+https://github.com/Valloric/ycmd'
        # this uses a downstream patch
        # using system completers is not supported by upstream
        # see https://github.com/Valloric/ycmd/pull/535
        'system_completers.patch')
sha256sums=('SKIP'
            'SKIP'
            '6533f957fae4de2aa2d4be1903686328170ecd44c59487a7478aabc8544a966f')

pkgver() {
	cd "${srcdir}/YouCompleteMe"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

if [ "${_clang_completer}" == 'y' ]; then
	depends+=('clang')
fi

prepare() {
	cd "${srcdir}/YouCompleteMe"
	git reset --hard
	git -C 'third_party/ycmd' reset --hard
	git config submodule.third_party/ycmd.url "${srcdir}/ycmd"
	git submodule update --init 'third_party/ycmd'
	cd 'third_party/ycmd'

	patch -p1 -i "${srcdir}/system_completers.patch"
}

build() {
	mkdir -p "${srcdir}/ycmd_build"
	cd "${srcdir}/ycmd_build"

	cmake_flags="-DUSE_PYTHON2=OFF -DUSE_SYSTEM_BOOST=ON"

	if [ "${_clang_completer}" == 'y' ]; then
		cmake_flags+=" -DUSE_CLANG_COMPLETER=ON -DEXTERNAL_LIBCLANG_PATH='/usr/lib/libclang.so'"
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

	find "${pkgdir}" \( -name .git -or -name 'test*' -or -name 'run_tests.py' -or -name 'CMakeFiles' \) -exec rm -fr {} +

	python -m compileall "$pkgdir"
}
