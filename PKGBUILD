# Maintainer: yasakei <yas.studios.en@gmail.com>
pkgname=neutron
pkgver=3.1.0_beta
pkgrel=1
pkgdesc="A Fast, Modern Scripting Language Built for Performance"
arch=('x86_64')
url="https://github.com/yasakei/neutron"
license=('custom:Neutron Public License')
provides=("neutron")
conflicts=("neutron-git" "neutron-bin")
depends=('curl' 'jsoncpp' 'glibc' 'gcc-libs')
makedepends=('cmake' 'git' 'gcc' 'pkgconf')
source=("git+https://github.com/yasakei/neutron.git#tag=${pkgver/_/-}"
        "git+https://github.com/yasakei/nt-box.git"
        "git+https://github.com/yasakei/docs.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${srcdir}/neutron"
  git submodule init nt-box docs
  git config submodule.nt-box.url "${srcdir}/nt-box"
  git config submodule.docs.url "${srcdir}/docs"
  git -c protocol.file.allow=always submodule update nt-box docs
}

build() {
  cd "${srcdir}/neutron"
  
  # Build using CMake
  # NEUTRON_UNSAFE_OPTIMIZATIONS is OFF by default, keeping it that way for package
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr 
    
  cmake --build build
}

package() {
  cd "${srcdir}/neutron"
  
  # Install core components using CMake's install target
  DESTDIR="$pkgdir" cmake --install build
  
  # --- Replicate additional steps from scripts/install.sh ---
  
  # 1. Install Box binary (if not handled by CMake)
  # CMakeLists.txt adds nt-box subdir but might not install the target.
  # We check for the output box binary. Location depends on nt-box/CMakeLists.txt
  # Usually build/nt-box/box or build/bin/box. 
  # We search for it.
  local box_bin=$(find build -name box -type f -executable | head -n 1)
  if [ -n "$box_bin" ]; then
    install -Dm755 "$box_bin" "$pkgdir/usr/bin/box"
  fi

  # 2. Install Headers
  # install.sh copies all headers: cp -r "./include/." "$INCLUDE_DIR/"
  # CMake might only install some. We ensure all are installed.
  install -d "$pkgdir/usr/include"
  cp -r include/* "$pkgdir/usr/include/"

  # 3. Install Source and Library files (for fallback compilation/runtime usage)
  install -d "$pkgdir/usr/share/neutron/src"
  cp -r src/* "$pkgdir/usr/share/neutron/src/"
  
  install -d "$pkgdir/usr/share/neutron/libs"
  cp -r libs/* "$pkgdir/usr/share/neutron/libs/"

  # 4. Install Documentation
  install -d "$pkgdir/usr/share/neutron/docs"
  cp -r docs/* "$pkgdir/usr/share/neutron/docs/"

  # 5. Install License and README
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Also copy to share/neutron as install.sh does
  install -Dm644 LICENSE "$pkgdir/usr/share/neutron/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/neutron/README.md"

  # 6. Install nt-box components (Native module builder)
  install -d "$pkgdir/usr/share/neutron/nt-box"
  if [ -f "nt-box/CMakeLists.txt" ]; then
      cp -r nt-box/. "$pkgdir/usr/share/neutron/nt-box/"
  elif [ -d "${srcdir}/nt-box" ]; then
      msg "Submodule nt-box empty/missing in tree, using srcdir/nt-box"
      cp -r "${srcdir}/nt-box/." "$pkgdir/usr/share/neutron/nt-box/"
  else
      warning "nt-box sources not found!"
  fi
  
  msg "Note: nt-box components installed to /usr/share/neutron/nt-box"
  msg "install.sh usually puts them in /usr/local/bin/nt-box"
}
