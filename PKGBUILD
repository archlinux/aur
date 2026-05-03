# Maintainer: Alexander Pohl <alex@ahpohl.com>

pkgbase=libfronius
pkgname=('libfronius' 'libfronius-docs')
pkgver=1.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/ahpohl/libfronius"
license=('MIT')
makedepends=('cmake' 'git' 'doxygen' 'pkgconf' 'libmodbus')
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libfronius.git#tag=v${pkgver}")
sha256sums=('60ceabaedf5a0b91867d9dac770629a031f10afe1c2db0ff7818024c7c65718a')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  # Generate Doxygen docs
  doxygen Doxyfile
}

package_libfronius() {
  pkgdesc="Library to access Fronius inverters and meters"
  depends=('libmodbus')
  optdepends=('libfronius-docs: HTML documentation')
  options=('strip' 'debug' 'staticlibs')
  
  cd "$srcdir/$pkgbase-$pkgver"
  cmake --install build --prefix "${pkgdir}/usr"

  # License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_libfronius-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"
  optdepends=('graphviz: diagrams for docs')
  options=('!strip' '!debug')
  arch=('any')
  
  cd "$srcdir/$pkgbase-$pkgver"

  # Readme
  install -d "$pkgdir/usr/share/doc/$pkgbase"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgbase/README.md"

  # License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # HTML files
  if [[ -d "docs/html" ]]; then
    cp -a "docs/html" "$pkgdir/usr/share/doc/$pkgbase/"
  else
    echo "Warning: Doxygen HTML documentation not found. Did you run doxygen in build()?"
  fi
}
