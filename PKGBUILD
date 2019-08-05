# Maintainer: Martchus <martchus@gmx.net>
# Contributor: emersion <contact@emersion.fr>

# This package contains a cross toolchain to compile for MacOSX. It bundles:
# * MacOSX 10.13 SDK
# * wrapper for Clang provided by osxcross
# * wrapper and toolchain file for using Clang with CMake
# * symlinks for ccache, so it will be used when cross compiling if it is enabled in /etc/makepkg.conf

# Difference between this package and osxcross-git maintained by emersion in the AUR:
# * osxcross-git does not stick to a particular commit
# * osxcross-git does not provide CMake wrapper scripts
# * osxcross-git violates "package etiquette" by putting stuff under /usr/local/osxcross (this package
#   uses /opt/osxcross)
# * osxcross-git will likely not work for building other apple-darwin-* packages provided
#   by me, such as apple-darwin-qt5-base (so if you want to build these, use this package)
# * osxcross-git does not provide symlinks for ccache

# Note that this package includes a MacOSX SDK and hence is not redistributable. Hence it might be worth
# splitting it into:
# * apple-darwin-sdk-macosx: contains the particular MacOSX SDK (the only part users would still need
#   to build from sources)
# * apple-darwin-osxcross: contains the actual sources of osxcross reporitory
# * apple-darwin-toolchain: contains the Clang toolchain built with scripts in apple-darwin-osxcross
# * apple-darwin-gcc: contains the GCC toolchain built with scripts in apple-darwin-osxcross

pkgname=apple-darwin-osxcross
_pkgname=osxcross
_osxcrossrevccount=325
_osxcrosscommit=16efae8
_sdkname=MacOSX10.13.sdk
_darwinversion=17
_prefix=/opt/osxcross # install everything under /opt/osxcross since the toolchain and SKD don't fit well in the regular fs structure
pkgver=$_osxcrossrevccount.$_osxcrosscommit
pkgrel=1
pkgdesc='OS X cross toolchain for Linux, FreeBSD and NetBSD'
arch=('x86_64')
url='https://github.com/tpoechtrager/osxcross'
license=('MIT')
depends=()
makedepends=('git' 'libxml2' 'clang>=3.2' 'cmake' 'python' 'libc++')
optdepends=('clang>=3.2: Use Clang (rather than GCC)'
            'llvm: Link Time Optimization support and ld64 -bitcode_bundle support'
            'uuid: ld64 -random_uuid support'
            'xar: ld64 -bitcode_bundle support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/tpoechtrager/${_pkgname}.git#commit=${_osxcrosscommit}"
        "https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/$_sdkname.tar.xz"
        'apple-darwin-cmake.sh'
        'toolchain-apple-darwin.cmake')
sha256sums=('SKIP'
            'b28b6489ae9287b4f3575bdd6d5450f33e6ea1d2f706d5579f839a494937e8ab'
            '23fc0013add1d33857019ea539851af20a70efa3c387fc289625ba1dbd755573'
            '8de19cc38ac2f7b8c4bec060eb36df167d814353c1139f88ed9a1cfb5bc03bc0')
options=('!strip')
_architectures="i386-apple-darwin$_darwinversion x86_64-apple-darwin$_darwinversion x86_64h-apple-darwin$_darwinversion"

#pkgver() {
#  cd "$srcdir/$_pkgname"
#  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
#}

prepare() {
  msg2 '"Package" SDK'
  cd "$srcdir"
  # be evil and just copy over headers from libc++ package
  cp -r /usr/include/c++/v1 "$_sdkname/usr/include/c++"
  bsdtar cJf "$srcdir/$_pkgname/tarballs/$_sdkname.tar.xz" "$_sdkname"

  msg2 'Prepare osxcross'
  cd "$srcdir/$_pkgname"
  sed -i -e 's|-march=native||g' build_clang.sh wrapper/build.sh
}

build() {
  cd "$srcdir/$_pkgname"
  export UNATTENDED=yes
  export OSX_VERSION_MIN=10.13

  msg2 'Build osxcross'
  ./build.sh

  msg2 'Build toolchain file and wrapper for CMake'
  cd "$srcdir"
  for _arch in ${_architectures}; do
    sed -e "s|@TRIPLE@|${_arch}|g" -e "s|@PREFIX@|${_prefix}/SDK/${_sdkname}/usr|g" -e "s|@OSXCROSSDIR@|${_prefix}|g" toolchain-apple-darwin.cmake > toolchain-${_arch}.cmake
    sed -e "s|@TRIPLE@|${_arch}|g" -e "s|@PREFIX@|${_prefix}/SDK/${_sdkname}/usr|g" -e "s|@OSXCROSSDIR@|${_prefix}|g" apple-darwin-cmake.sh > ${_arch}-cmake
  done
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/${_prefix%/*}"
  cp -r target "$pkgdir/${_prefix}"
  install -d "${pkgdir}/${_prefix}/share/apple-darwin"

  # install files for CMake and ccache
  cd "$srcdir"
  for _arch in ${_architectures}; do
    # install toolchain file and wrapper for CMake
    install -t "${pkgdir}/${_prefix}/share/apple-darwin" -m 644 toolchain-${_arch}.cmake
    install -t "${pkgdir}/${_prefix}/bin" -m 755 ${_arch}-cmake

    # add symlinks for ccache
    local ccachedir="${pkgdir}/${_prefix}/lib/ccache/bin"
    mkdir -p "${ccachedir}"
    pushd "${ccachedir}"
    for app in clang clang++; do
      ln -s /usr/bin/ccache ./${_arch}-${app}
    done
    popd
  done

}
