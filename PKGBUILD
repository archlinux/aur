# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# The following contributors are from the vim-youcompleteme-git AUR package
# Contributor: Babken Vardanyan <483ken 4tgma1l
# Contributor: stykr
# Contributor: Svenstaro
# Contributor: KaiSforza
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_use_python2=y
_use_system_boost=n

# this uses a downstream patch
# using system completers is not supported by upstream
# see https://github.com/Valloric/ycmd/pull/535
_search_system_completers=n

# clang completion is builtin and cannot be provided separately (?)
_clang_completer=y
_clang_completer_system_libclang=n

pkgname=vim-youcompleteme-core-git
pkgver=r2066.5198fd9a
pkgrel=1
pkgdesc='A code-completion engine for Vim'
arch=(i686 x86_64)
url='http://valloric.github.com/YouCompleteMe/'
license=('GPL3')
groups=('vim-plugins')
depends=('vim')
makedepends=('git' 'cmake')
provides=('vim-youcompleteme-git')
conflicts=('vim-youcompleteme-git')
source=('git+https://github.com/Valloric/YouCompleteMe.git'
        'git+https://github.com/Valloric/ycmd')
sha256sums=('SKIP' 'SKIP')
install="${pkgname}.install"

pkgver() {
	cd "${srcdir}/YouCompleteMe"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

if [ "${_use_python2}" == 'y' ]; then
	depends+=('python2>=2.7' 'python2-bottle' 'python2-waitress' 'python2-frozendict' 'python2-requests-futures' 'python2-future')
else
	depends+=('python>=3.2' 'python-bottle' 'python-waitress' 'python-frozendict' 'python-requests-futures' 'python-future')
fi

if [ "${_use_system_boost}" == 'y' ]; then
	depends+=('boost-libs')
	makedepends+=('boost')
fi

if [ "${_search_system_completers}" == 'y' ]; then
	source+=('system_completers.patch')
	sha256sums+=('6533f957fae4de2aa2d4be1903686328170ecd44c59487a7478aabc8544a966f')
	optdepends+=(
		'gocode-git: Go semantic completion'
		'godef-git: Go semantic completion'
		'nodejs-tern: JavaScript semantic completion'
		'racerd-git: Rust semantic completion'
		'typescript: Typescript semantic completion'
	)
	if [ "${_use_python2}" == 'y' ]; then
		optdepends+=('python2-jedihttp-git: Python semantic completion')
	else
		optdepends+=('python-jedihttp-git: Python semantic completion')
	fi
	# missing completers:
	# OmniSharp-Roslyn - ???
fi

if [ "${_clang_completer}" == 'y' ]; then
	if [ "${_clang_completer_system_libclang}" == 'y' ]; then
		depends+=('clang')
	else
		clang_version='4.0.0'
		if [[ "$(uname -m)" == 'x86_64' ]]; then
			clang_filename="clang+llvm-${clang_version}-x86_64-linux-gnu-ubuntu-14.04.tar.xz"
			sha256sums+=('1d15b6337ffc0876ed1a9827cae566e24639e0f5d7d186b2de04c38d762336b4'
									 'd6fc09a4e1be562859f2ddd44fa19b2d29896fec7e420ce9d6a2fa915028b174')
		else
			echo 'Prebuild Clang for x86 is not available.'
			exit 1
		fi
		source+=("http://llvm.org/releases/4.0.0/${clang_filename}"{,.sig})
		noextract+=("${clang_filename}")
		validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D')
		unset clang_version
	fi
fi

prepare() {
	cd "${srcdir}/YouCompleteMe"
	git reset --hard
	git -C 'third_party/ycmd' reset --hard
	git config submodule.third_party/ycmd.url "${srcdir}/ycmd"
	git submodule update --init 'third_party/ycmd'
	cd 'third_party/ycmd'

	if [ "${_search_system_completers}" == 'y' ]; then
		patch -p1 -i "${srcdir}/system_completers.patch"
	else
		echo '[1;33mNote:[0m'
		echo '  YouCompleteMe will be built with basic completion.'
		echo '  If you want semantic completion, you need to turn on _search_system_completers in the PKGBUILD.'
	fi

	if [ "${_clang_completer}" == 'y' -a "${_clang_completer_system_libclang}" != 'y' ]; then
		mkdir -p "${srcdir}/YouCompleteMe/third_party/ycmd/clang_archives"
		cp "${srcdir}/${clang_filename}" "${srcdir}/YouCompleteMe/third_party/ycmd/clang_archives"
	fi
}

build() {
	mkdir -p "${srcdir}/ycmd_build"
	cd "${srcdir}/ycmd_build"

	cmake_flags="-DUSE_PYTHON2=$([[ "${_use_python2}" == 'y' ]] && echo ON || echo OFF)"
	cmake_flags+=" -DUSE_SYSTEM_BOOST=$([[ "${_use_system_boost}" == 'y' ]] && echo ON || echo OFF)"

	if [ "${_clang_completer}" == 'y' ]; then
		cmake_flags+=' -DUSE_CLANG_COMPLETER=ON'
		if [ "${_clang_completer_system_libclang}" == 'y' ]; then
			cmake_flags+=' -DUSE_SYSTEM_LIBCLANG=ON'
		fi
	fi

	cmake ${cmake_flags} . "$srcdir/YouCompleteMe/third_party/ycmd/cpp"
	make ycm_core
}

package() {
	pkg_ycmd_dir="${pkgdir}/usr/share/vim/vimfiles/third_party/ycmd"
	src_ycmd_dir="${srcdir}/YouCompleteMe/third_party/ycmd"
	mkdir -p "${pkg_ycmd_dir}"

	cp -r "${srcdir}/YouCompleteMe/"{autoload,doc,plugin,python} "${pkgdir}/usr/share/vim/vimfiles"
	cp -r "${src_ycmd_dir}/"{ycmd,ycm_core.so,CORE_VERSION} "${pkg_ycmd_dir}"
	if [ "${_clang_completer}" == 'y' ]; then
		if [ "${_clang_completer_system_libclang}" == 'y' ]; then
			clang_version="$(clang --version|sed -n 's/clang version \([0-9.]\+\) .*/\1/p')"
			ln -s "/usr/lib/clang/${clang_version}/include/" "${pkg_ycmd_dir}/clang_includes"
			unset clang_version
		else
			cp -r "${srcdir}/${clang_filename}" "${src_ycmd_dir}/clang_includes" "${pkg_ycmd_dir}"
		fi
	fi

	find "${pkgdir}" \( -name .git -or -name 'test*' -or -name 'run_tests.py' -or -name 'CMakeFiles' \) -exec rm -fr {} +
}
