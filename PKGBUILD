# Maintainer: Krakn <dan.ray.beste@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname='mono-git'
_gitname='mono'
pkgver=5.18.0.225.r1530.d1a5fa3783b
pkgrel=1
pkgdesc='Free implementation of the .NET platform including runtime and compiler'
url='http://www.mono-project.com/'
arch=('i686' 'x86_64')
license=('custom=MITX11' 'custom=MSPL' 'BSD' 'GPL' 'LGPL2.1' 'MPL')
depends=('ca-certificates' 'libgdiplus' 'python' 'zlib')
makedepends=('cmake' 'git' 'mono')
provides=('mono' 'monodoc')
conflicts=('mono' 'monodoc')
install="${_gitname}.install"
source=(
  'git+https://github.com/mono/mono.git'
  'git+https://github.com/mono/aspnetwebstack.git'
  'git+https://github.com/mono/Newtonsoft.Json.git'
  'git+https://github.com/mono/cecil.git'
  'git+https://github.com/mono/rx.git#branch=rx-oss-v2.2'
  'ikvm::git+https://github.com/mono/ikvm-fork.git'
  'git+https://github.com/mono/ikdasm.git'
  'binary-reference-assemblies::git+https://github.com/mono/reference-assemblies.git'
  'nunit-lite::git+https://github.com/mono/NUnitLite.git'
  'nuget-buildtasks::git+https://github.com/mono/NuGet.BuildTasks'
  'cecil-legacy::git+https://github.com/mono/cecil.git#branch=mono-legacy-0.9.5'
  'git+https://github.com/mono/boringssl.git#branch=mono'
  'git+https://github.com/mono/corefx.git'
  'git+https://github.com/mono/bockbuild.git'
  'git+https://github.com/mono/linker.git'
  'git+https://github.com/mono/roslyn-binaries.git'
  'git+https://github.com/mono/corert.git'
  'git+https://github.com/mono/xunit-binaries.git'
  'git+https://github.com/mono/api-doc-tools.git'
  'git+https://github.com/mono/api-snapshot.git'
  'git+https://github.com/mono/llvm.git#branch=release_60'
  'git+https://github.com/mono/helix-binaries.git'
  'mono.binfmt.d'
)
sha256sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  '9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425'
)

pkgver() {
	cd "${_gitname}"

  local -r tag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
  local -r revision=$(git rev-list --count "${tag}"...HEAD)
  local -r hash=$(git rev-parse --short HEAD)

  # Suggestions for improvement welcome!
  echo "${tag/mono-}.r${revision}.${hash}"
}

prepare() {
  cd "${_gitname}"

  local submodules=(
    'aspnetwebstack'
    'Newtonsoft.Json'
    'cecil'
    'rx'
    'ikvm'
    'ikdasm'
    'binary-reference-assemblies'
    'nunit-lite'
    'nuget-buildtasks'
    'cecil-legacy'
    'boringssl'
    'corefx'
    'bockbuild'
    'linker'
    'roslyn-binaries'
    'corert'
    'xunit-binaries'
    'api-doc-tools'
    'api-snapshot'
    'llvm'
    'helix-binaries'
  )

  for module in "${submodules[@]}"; do
    local submodule="external/${module}"
    git submodule init "${submodule}"
    git config "submodule.${submodule}.url" "${srcdir}/${module}"
    git submodule update "${submodule}"
  done
}

build() {
  cd "${_gitname}"

  # Default prefix is /usr/local/
  # Default sysconfdir is /usr/local/etc/
  # Default sbindir is /usr/local/sbin/
  ./autogen.sh         \
    --prefix=/usr      \
    --sbindir=/usr/bin \
    --sysconfdir=/etc  \
    --with-mcs-docs=no

  # If a working installation of mono is not found, attempt to
  # bootstrap the project:
  if ! hash mono; then
    make get-monolite-latest
  fi
  
  make

  cd mcs/jay

  make
}

package() {
  install -D -m 644           \
    "${srcdir}/mono.binfmt.d" \
    "${pkgdir}/usr/lib/binfmt.d/mono.conf"

  cd "${_gitname}"

  make DESTDIR="${pkgdir}" install
  install	-D -m 644 \
    "LICENSE"       \
    "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

  cd mcs/jay

  make                       \
    DESTDIR="${pkgdir}"      \
    prefix=/usr              \
    INSTALL=../../install-sh \
    install

  # Fix .pc file to be able to request mono on what it depends, fixes
  # go-oo build:
  sed -i -e           \
    "s:/2.0/:/4.5/:g" \
    "${pkgdir}/usr/lib/pkgconfig/mono-nunit.pc"
  sed -i -e                 \
    "s:#Requires:Requires:" \
    "${pkgdir}/usr/lib/pkgconfig/mono.pc"
}

# vim: ts=2 sw=2 et:
