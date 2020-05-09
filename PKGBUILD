# Maintainer: Felix Golatofski
# Maintainer: Mufatti Alex <me@alexmufatti.it>

pkgname=mono5
_pkgname=mono
_gitcommit=feca91f7eb1b440a6520cf754370b98271339d1a
pkgver=5.20.1.34
pkgrel=2
pkgdesc="Free implementation of the .NET platform including runtime and compiler"
url='http://www.mono-project.com/'
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL')
depends=('zlib' 'libgdiplus>=4.2' 'sh' 'python' 'ca-certificates')
makedepends=('cmake' 'mono')
provides=("mono=${pkgver}" 'monodoc=${pkgver}')
conflicts=('mono' 'monodoc')
install=${_pkgname}.install
source=(${_pkgname}::"git+https://github.com/mono/mono#commit=${_gitcommit}"
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
  cd "${srcdir}"/${_pkgname}
  git describe --always --tags | sed 's/^v//;s/^mono-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${_pkgname}

  # build mono
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-mcs-docs=no
  make

  # build jay
  make -C mcs/jay
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install

  make -C mcs/jay DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  install -Dm 644 "${srcdir}/mono.binfmt.d" "${pkgdir}/usr/lib/binfmt.d/mono.conf"

  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/usr/lib/pkgconfig/mono.pc
  sed -i -e "s:/2.0/:/4.5/:g" "${pkgdir}"/usr/lib/pkgconfig/mono-nunit.pc
}

