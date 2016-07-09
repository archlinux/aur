# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
# Contributor: yan12125
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
pkgver=r1821.c4a410b
pkgrel=3
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
        'git+https://github.com/Valloric/ycmd'
        'boost-python3.patch'::'https://github.com/Valloric/ycmd/pull/537.patch')
sha256sums=('SKIP' 'SKIP'
            'bb42d14ef0ca04618c6f3a30e9a754388a0231f00e798509b803638974e656e5')
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
		clang_version='3.8.0'
		if [[ "${CARCH}" == 'x86_64' ]]; then
			clang_filename="clang+llvm-${clang_version}-x86_64-linux-gnu-ubuntu-14.04.tar.xz"
			sha256sums+=('3120c3055ea78bbbb6848510a2af70c68538b990cb0545bac8dad01df8ff69d7'
									 '7cc55f1a1cc3e5478581e66c79ffa5ab4d7495076e6164b52d7b1a63816751a7')
		else
			clang_filename="clang+llvm-${clang_version}-i686-fedora23.tar.xz"
			sha256sums+=('063a5430b1895a1565831ab0b840cdb14f22ee9fad38e82b9bb8be76e49f1a8b'
									 '2628015b84703215ff0fea3d374fe1cd82cfcc38c304fec22fbab6b9abdc92f2')
		fi
		source+=("http://llvm.org/releases/3.8.0/${clang_filename}"{,.sig})
		noextract+=("${clang_filename}")
		validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D')
		unset clang_version
	fi
fi

prepare() {
	cd "${srcdir}/YouCompleteMe"
	git config submodule.third_party/ycmd.url "${srcdir}/ycmd"
	git submodule update --init 'third_party/ycmd'
	cd 'third_party/ycmd'
	git reset --hard

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

	if [ "${_use_python2}" != 'y' -a "${_use_system_boost}" == 'y' ]; then
		patch -i "${srcdir}/boost-python3.patch" -p1
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
			cmake_flags+=" -DEXTERNAL_LIBCLANG_PATH='/usr/lib/libclang.so'"
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
	cp -r "${srcdir}/YouCompleteMe/third_party/retries" "${pkgdir}/usr/share/vim/vimfiles/third_party"
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
