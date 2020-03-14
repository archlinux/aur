# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono-alt-csc
_gitcommit=fe64a4765e6d1dbb41d5c86708fcb02aa519247a
pkgver=6.4.0.198
pkgrel=1
pkgdesc='Free implementation of the .NET platform including runtime and compiler. "csc" is renamed to "mono-csc". "csi" is renamed to "mono-csi".'
url='https://www.mono-project.com/'
arch=('x86_64')
license=('GPL' 'LGPL2.1' 'MPL')
depends=('zlib' 'libgdiplus>=4.2' 'sh' 'python' 'ca-certificates')
makedepends=('cmake' 'git')
provides=('monodoc' "mono=${pkgver}")
conflicts=('monodoc' 'mono')
replaces=('mono')
install=mono.install
source=(${pkgname}::"git+https://github.com/mono/mono#commit=${_gitcommit}"
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
        git+https://github.com/mono/api-snapshot
        mono.binfmt.d)
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
            'SKIP'
            '9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/^mono-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
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
  cd ${pkgname}
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-mcs-docs=no
  make
  make -C mcs/jay
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  make -C mcs/jay DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  mv "${pkgdir}/usr/bin/csc" "${pkgdir}/usr/bin/mono-csc"
  mv "${pkgdir}/usr/bin/csi" "${pkgdir}/usr/bin/mono-csi"
  install -Dm 644 "${srcdir}/mono.binfmt.d" "${pkgdir}/usr/lib/binfmt.d/mono.conf"
}

# vim: ts=2 sw=2 et:
