pkgname=mingw-w64-mono
_gitcommit=20bb4f9a6d310d4aae1529776ff45291ed676e51
pkgver=6.12.0.86
pkgrel=1
pkgdesc='Free implementation of the .NET platform including runtime and compiler (mingw-w64)'
url='https://www.mono-project.com/'
arch=('any')
license=('GPL' 'LGPL2.1' 'MPL')
depends=('mingw-w64-zlib' 'mingw-w64-libatomic_ops')
makedepends=('mingw-w64-configure' 'git')
options=(!strip !buildflags staticlibs)
source=("git+https://github.com/mono/mono#commit=${_gitcommit}"
        git+https://github.com/mono/aspnetwebstack
        git+https://github.com/mono/Newtonsoft.Json
        git+https://github.com/mono/cecil
        git+https://github.com/mono/rx
        git+https://github.com/mono/ikvm-fork
        git+https://github.com/mono/ikdasm
        git+https://github.com/mono/reference-assemblies
        git+https://github.com/mono/NUnitLite
        git+https://github.com/mono/NuGet.BuildTasks
        git+https://github.com/mono/boringssl
        git+https://github.com/mono/corefx
        git+https://github.com/mono/bockbuild
        git+https://github.com/mono/linker
        git+https://github.com/mono/roslyn-binaries
        git+https://github.com/mono/corert
        git+https://github.com/mono/xunit-binaries
        git+https://github.com/mono/api-doc-tools
        git+https://github.com/mono/api-snapshot)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd mono
  git describe --tags | sed 's/^v//;s/^mono-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mono
  git submodule init
  git config submodule."external/aspnetwebstack".url "${srcdir}/aspnetwebstack"
  git config submodule."external/Newtonsoft.Json".url "${srcdir}/Newtonsoft.Json"
  git config submodule."external/cecil".url "${srcdir}/cecil"
  git config submodule."external/rx".url "${srcdir}/rx"
  git config submodule."external/ikvm".url "${srcdir}/ikvm-fork"
  git config submodule."external/ikdasm".url "${srcdir}/ikdasm"
  git config submodule."external/reference-assemblies".url "${srcdir}/reference-assemblies"
  git config submodule."external/nunit-lite".url "${srcdir}/NUnitLite"
  git config submodule."external/nuget-buildtasks".url "${srcdir}/NuGet.BuildTasks"
  git config submodule."external/cecil-legacy".url "${srcdir}/cecil"
  git config submodule."external/boringssl".url "${srcdir}/boringssl"
  git config submodule."external/corefx".url "${srcdir}/corefx"
  git config submodule."external/bockbuild".url "${srcdir}/bockbuild"
  git config submodule."external/linker".url "${srcdir}/linker"
  git config submodule."external/roslyn-binaries".url "${srcdir}/roslyn-binaries"
  git config submodule."external/corert".url "${srcdir}/corert"
  git config submodule."external/xunit-binaries".url "${srcdir}/xunit-binaries"
  git config submodule."external/api-doc-tools".url "${srcdir}/api-doc-tools"
  git config submodule."external/api-snapshot".url "${srcdir}/api-snapshot"
  git submodule update --recursive
}

build() {
  cd mono
  NOCONFIGURE=1 ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  cd mono
  for _arch in ${_architectures}; do
    cd "$srcdir/mono/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
