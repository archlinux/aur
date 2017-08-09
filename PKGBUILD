# Maintainer: Martchus <martchus@gmx.net>
# Contributor: emersion <contact@emersion.fr>

# This package contains a cross toolchain to compile for MacOSX. It bundles:
# * MacOSX 10.11 SDK
# * wrapper for Clang provided by osxcross
# * wrapper and toolchain file for using Clang with CMake
# * GCC toolchain (including libstdc++) which is built using the script provided by osxcross
#   Note that GCC is only available for i386, x86_64 but not for x86_64h
# * symlinks for ccache, so it will be used when cross compiling if it is enabled in /etc/makepkg.conf

# Difference between this package and osxcross-git maintained by emersion in the AUR:
# * osxcross-git does not stick to a particular commit
# * osxcross-git does not provide GCC toolchain (only Clang wrapper)
# * osxcross-git does not provide CMake toolchain file
# * osxcross-git violates "package etiquette" by putting stuff under /usr/local/osxcross (this package
#   uses /opt/osxcross)
# * osxcross-git will likely not work for building other apple-darwin-* packages provided
#   by me, such as apple-darwin-qt5-base (so if you want to build these, use my this package)
# * osxcross-git does not provide symlinks for ccache

# Note that this package includes a MacOSX SDK and hence is not redistributable. Hence it might be worth
# splitting it into:
# * apple-darwin-sdk-macosx10.11: contains the MacOSX SDK, the only part users would still need to build
#   from sources
# * apple-darwin-osxcross: contains the actual sources of osxcross reporitory
# * apple-darwin-toolchain: contains the Clang toolchain built with scripts in apple-darwin-osxcross
# * apple-darwin-gcc: contains the gcc toolchain built with scripts in apple-darwin-osxcross

pkgname=apple-darwin-osxcross
_pkgname=osxcross
# There's no official release of osxcross yet, so let's just stick to a Git revision
_osxcrosscommit=a0c5314
# Use the same GCC and isl version as used by regular gcc package
_gccver=7.1.1
_gcccommit=d791474f3fc2133fa0c310e566988b0cbdff321e
_islver=0.18
pkgver=272.$_osxcrosscommit
pkgrel=1
pkgdesc='OS X cross toolchain for Linux, FreeBSD and NetBSD'
arch=('x86_64')
url='https://github.com/tpoechtrager/osxcross'
license=('MIT')
depends=()
makedepends=('git' 'libxml2' 'clang>=3.2')
optdepends=('clang>=3.2: Use Clang (rather than GCC)'
            'llvm: Link Time Optimization support and ld64 -bitcode_bundle support'
            'uuid: ld64 -random_uuid support'
            'xar: ld64 -bitcode_bundle support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/tpoechtrager/${_pkgname}.git#commit=${_osxcrosscommit}"
        'https://s3.dockerproject.org/darwin/v2/MacOSX10.11.sdk.tar.xz'
        'apple-darwin-cmake.sh'
        'toolchain-apple-darwin.cmake'
        '0001-Use-GCC-from-Git-checkout.patch'
        "git+https://gcc.gnu.org/git/gcc.git#commit=${_gcccommit}"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
        'Revert-eeb6872bf.patch')
sha256sums=('SKIP'
            '694a66095a3514328e970b14978dc78c0f4d170e590fa7b2c3d3674b75f0b713'
            'fc3c25980c6d8e32721217b43b7ae272d309a67c94a5ddd105c668d0ea7eb91e'
            'fa4a430ef0ce168cfbeef4660a67ad08c3e1508ae89ab78b1ea14bb2f6709cb2'
            '34ddb0fb6c08bc19ded7f608264696d7972601b635ee7ece548005286b4ba884'
            'SKIP'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            'c537bce5e9aa2b6fcdec3c1e7f94017633cb5ff5af59beda699262be3c06cca5')
noextract=('MacOSX10.11.sdk.tar.xz')
options=('!strip')
_architectures='i386-apple-darwin15 x86_64-apple-darwin15 x86_64h-apple-darwin15'

#pkgver() {
#  cd "$srcdir/$_pkgname"
#  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
#}

prepare() {
  cd "${srcdir}/gcc"

  msg2 'Prepare GCC (using same steps as in regular GCC package)'
  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80717
  git apply ../Revert-eeb6872bf.patch

  msg2 'Prepare osxcross'
  cd "$srcdir/$_pkgname"
  git apply ../0001-Use-GCC-from-Git-checkout.patch
  sed -i -e 's|-march=native||g' build_clang.sh wrapper/build.sh
  # create symlink to SDK file so osxcross can find it
  pushd tarballs && ln -sf ../../MacOSX10.11.sdk.tar.xz MacOSX10.11.sdk.tar.xz && popd
}

build() {
  cd "$srcdir/$_pkgname"
  export UNATTENDED=yes
  export OSX_VERSION_MIN=10.5
  export ENABLE_FORTRAN=1
  export GCC_VERSION="$_gccver"
  export GCC_CHECKOUT="${srcdir}/gcc"

  msg2 'Build osxcross'
  ./build.sh

  msg2 'Build GCC (using build script provided by osxcross)'
  ./build_gcc.sh

  msg2 'Build toolchain file and wrapper for CMake'
  cd "$srcdir"
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" toolchain-apple-darwin.cmake > toolchain-${_arch}.cmake
    sed "s|@TRIPLE@|${_arch}|g" apple-darwin-cmake.sh > ${_arch}-cmake
  done
  # TODO: Also create a wrapper and a toolchain file for GCC
}

package() {
  cd "$srcdir/$_pkgname"

  # install everything under /opt/osxcross since the toolchain and SKD don't fit well in the regular fs structure
  mkdir -p $pkgdir/opt
  cp -r target $pkgdir/opt/osxcross
  install -d "${pkgdir}"/opt/osxcross/share/apple-darwin

  # install files for CMake and ccache
  cd "$srcdir"
  for _arch in ${_architectures}; do
    # install toolchain file and wrapper for CMake
    install -t "${pkgdir}"/opt/osxcross/share/apple-darwin -m 644 toolchain-${_arch}.cmake
    install -t "${pkgdir}"/opt/osxcross/bin -m 755 ${_arch}-cmake

    # add symlinks for ccache
    local ccachedir="${pkgdir}/opt/osxcross/lib/ccache/bin"
    mkdir -p "${ccachedir}"
    pushd "${ccachedir}"
    for app in clang clang++ gcc g++; do
      ln -s /usr/bin/ccache ./${_arch}-${app}
    done
    popd
  done

}
