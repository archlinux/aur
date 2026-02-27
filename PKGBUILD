# Contributor: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: zfo <zfoofz1@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=ldc
pkgname=("${_pkgname}-git" 'liblphobos-git')
groups=('dlang' 'dlang-ldc')
pkgver=v1.42.0.beta3.9.g2e33c9c487
epoch=1
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and libphobos2"
arch=('i686' 'x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
makedepends=('git' 'cmake' 'llvm' 'lld' 'ldc' 'bash-completion' 'ninja')
# Disable lto as linking the ldc2 binary fails, see https://github.com/ldc-developers/ldc/issues/5074
options=(!lto)

source=("git+https://github.com/ldc-developers/ldc.git"
        "git+https://github.com/ldc-developers/phobos.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags HEAD | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.phobos.url "${srcdir}/phobos"
  git -c protocol.file.allow=always submodule update

  # LLVMDebuginfod required curl
  sed -i "s/-lLLVMDebuginfod/-lLLVMDebuginfod -lcurl/" tools/CMakeLists.txt

  # patch the config file to be /etc/ldc2-git.conf
  sed 's/ldc2[.]conf/ldc2-git.conf/' -i driver/configfile.cpp
  sed 's/ldc2[.]conf"/ldc2-git.conf"/' -i CMakeLists.txt cmake/Modules/LdcConfig.cmake
  sed 's/=phobos2-ldc,druntime-ldc/=phobos2-ldc-git,druntime-ldc-git/' -i CMakeLists.txt

  # patch ldc to properly link to ldc-git (needed for ldmd)
  sed 's/LDC_EXE ldc2/LDC_EXE ldc2-git/' -i CMakeLists.txt
  sed 's/LDMD_EXE ldmd2/LDMD_EXE ldmd2-git/' -i CMakeLists.txt

  # patch bash-completion
  sed 's/\(ldc2\?\)\b/\1-git/g' -i packaging/bash_completion.d/ldc2
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build && cd build

  local args=(
    #env

    # Use host DMD
    # This 1) ensures we use the main dmd package, and not something in the user's $PATH;
    # and 2) compilation with ldc links Phobos/Druntime as shared libraries;
    # dmd does static linking to the rescue!
    #DMD=/usr/bin/dmd

    cmake -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_SKIP_RPATH=ON \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc-git \
    -DBUILD_LTO_LIBS=ON \
    -DLDC_WITH_LLD=OFF \
    -DD_COMPILER_FLAGS="-link-defaultlib-shared=false -linker=lld --flto=thin" \
    # This is the git version - use static linking by default
    -DBUILD_SHARED_LIBS=OFF \
    ..
  )
  "${args[@]}"

  ninja
}

check() {
    cd "$srcdir/ldc/build"
    ninja all-test-runners
}

package_ldc-git() {
  depends=('liblphobos-git' 'llvm-libs' 'gcc' 'compiler-rt' 'curl')
  backup=('etc/ldc2-git.conf')
  provides=("d-compiler")

  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="$pkgdir" ninja install

  # rename binaries
  for f in profdata prune-cache build-plugin profgen; do
    mv "${pkgdir}/usr/bin/ldc-$f" \
       "${pkgdir}/usr/bin/ldc-git-$f"
  done
  mv "${pkgdir}/usr/bin/timetrace2txt" "${pkgdir}/usr/bin/timetrace2txt-git"


  # move bash-completion
  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  mv "$pkgdir/usr/share/bash-completion/completions/ldc2" "$pkgdir/usr/share/bash-completion/completions/ldc2-git"
  rm -rf "$pkgdir/etc/bash_completion.d"

  # remove liblphobos files
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/lib"

  # remove misc
  rm -rf "${pkgdir}/usr/bin/ldc-build-runtime"

  # symlinks
  ln -s ldc2-git "${pkgdir}/usr/share/bash-completion/completions/ldc-git"
  ln -s ldc2-git "${pkgdir}/usr/bin/ldc-git"
  ln -s ldmd2-git "${pkgdir}/usr/bin/ldmd-git"

  # licenses
  install -D -m644 "${srcdir}/ldc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_liblphobos-git() {
  provides=('d-runtime' 'd-stdlib')
  depends=('curl')
  options=('staticlibs')

  cd "${srcdir}/ldc/build"
  DESTDIR="$pkgdir" ninja install

  # remove ldc files
  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/etc/"
  rm -rf "${pkgdir}/usr/share/bash-completion/"

  # rename libraries
  for f in libphobos2-ldc libdruntime-ldc libdruntime-ldc-debug libdruntime-ldc-lto  \
                          libphobos2-ldc-debug libphobos2-ldc-lto \
                          libldc-jit libldc-jit-rt libldc-profile-rt; do
    for ext in a so; do
      test -e "${pkgdir}/usr/lib/$f.$ext" && \
          mv "${pkgdir}/usr/lib/$f.$ext" "${pkgdir}/usr/lib/$f-git.$ext"
    done
  done

  # licenses
  install -D -m644 "${srcdir}/ldc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
