# Maintainer: CyanWoods <i at cyanwoods dot com>
pkgbase=spdk
pkgname=('spdk' 'python-spdk')
pkgver=23.01
pkgrel=3
pkgdesc='spdk: headers, libs, and scripts'
arch=('x86_64')
license=('BSD')
url='https://spdk.io/'
depends=('bash' 'dpdk' 'dtc' 'libaio' 'libarchive' 'libbsd' 'liburing' 'numactl' 'util-linux-libs')
makedepends=('cmake' 'git' 'meson' 'python-pyelftools' 'python-configshell-fb' 'python-grpcio' 'python-google-api-core' 'python-ipaddress')
provides=('spdk' 'python-spdk')
conflicts=()
source=("$pkgbase::git+https://github.com/spdk/spdk.git#tag=v${pkgver}")
sha256sums=('SKIP')
prepare() {
  cd "$srcdir/$pkgbase"
  git submodule update --init
}
build() {
  cd "$srcdir/$pkgbase"
  ./configure --prefix=/usr --with-dpdk --disable-examples --disable-tests --disable-unit-tests --enable-lto --with-uring --without-uring-zns
  make
}
package_spdk() {
  cd "$srcdir/$pkgbase"
  DESTDIR="${pkgdir}" make install

  # self-contained /usr/bin/spdk-setup
  echo '#!/usr/bin/env bash' >$pkgdir/usr/bin/spdk-setup
  cat scripts/{common,setup}.sh     >>$pkgdir/usr/bin/spdk-setup
  sed -ri '/^rootdir/d;/^source/d;s,\$rootdir,/usr,' $pkgdir/usr/bin/spdk-setup
  chmod +x $pkgdir/usr/bin/spdk-setup
  
  install -Dm644 "scripts/bash-completion/spdk" "$pkgdir/usr/share/bash-completion/completions/spdk"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
package_python-spdk() {
  arch=('any')
  pkgdesc='spdk: python support'
  depends=('python-configshell-fb' 'python-grpcio' 'python-google-api-core' 'python-pyparsing' 'python-ipaddress')

  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  #cd "$srcdir/$pkgbase/python"
  #python -m compileall .

  cd "$srcdir/$pkgbase"
  mkdir -p $pkgdir${site_packages}
  cp -a python/spdk $pkgdir${site_packages}

  install -Dm755 "scripts/spdkcli.py" "$pkgdir/usr/bin/spdkcli"
  sed -i '/sys\.path\.append/d' "$pkgdir/usr/bin/spdkcli"
  
  install -Dm755 "scripts/rpc.py" "$pkgdir/usr/bin/spdkrpc"
  sed -i '/sys\.path\.append/d' "$pkgdir/usr/bin/spdkrpc"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
