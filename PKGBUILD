# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=opensgx-git
pkgver=r24.aa9466f
pkgrel=1
pkgdesc="an open platform for Intel SGX"
arch=('x86_64')
url="https://github.com/sslab-gatech/opensgx/"
license=('MIT')
depends=()
makedepends=('git' 'qemu')
options=()
install=
source=(
  'opensgx-git::git+https://github.com/sslab-gatech/opensgx.git'
  'opensgx-bin-paths.patch'
  'demo-include-sgx.patch'
  'opensgx-compile.patch'
  'sgx-qemu-path.patch'
  'sgx-h-paths.patch'
  'test-sh.patch'
  'sgx-compile'
)
md5sums=('SKIP'
         '58999f0f6a15026bf3f1a6c853f4f723'
         '6284157d5a2a1ce6ab44ca3577ab9eb2'
         'e862b28b09581142af78369c6c65ce66'
         '9ac0fa0ddae6d0e70f18992894bd1205'
         'e65b4d1335c29babacaa0d5dbcbffe3a'
         '26415403a05ac7da09e5fc4408328c5b'
         '35670fc0b02b2aa3773470587b0d65f4')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  msg2 "Fix QEMU path"
  patch -Np1 -i '../sgx-qemu-path.patch'

  msg2 "Fix binary paths in opensgx executable"
  patch -Np1 -i '../opensgx-bin-paths.patch'

  msg2 "Fix sgx header paths"
  patch -Np1 -i '../sgx-h-paths.patch'
  test -d user/include/sgx || mkdir user/include/sgx
  mv user/include/*.h user/include/sgx

  test -L user/include/polarssl || mv user/include/polarssl user/include/sgx/

  cd user/include
  ln -sfn sgx/* ./
  test -L qemu || ln -sfn ../../../qemu/target-i386/ sgx/qemu
  cd ../../

  msg2 "Make opensgx use sgx-compile"
  patch -Np1 -i '../opensgx-compile.patch'

  msg2 "Make test.sh use system sgx"
  patch -Np1 -i '../test-sh.patch'

  msg2 "Make hello.c use <sgx.h>"
  patch -Np1 -i '../demo-include-sgx.patch'

  msg2 "Configure QEMU"
  cd qemu
  ./configure-arch
}

build() {
  cd "$srcdir/$pkgname"

  msg2 "Build QEMU"
  cd qemu
  make

  msg2 "Build PolarSSL"
  cd ../user/polarssl_sgx
  make

  cd ..
  msg2 "Make .os needed for .sgx compilation"
  make $(make -d demo/hello.sgx | awk '{print $2}' | sed "s/'//g" | grep '\.o' | grep -v demo | xargs)
  make sgx.lds

  msg2 "Build userspace utilities"
  make
}

package() {
  cd "$srcdir/$pkgname"

  # Binaries
  install -d "$pkgdir/usr/bin"
  install -m755 ./{sgx,sgx-dbg,opensgx} -t "$pkgdir/usr/bin/"
  install -m755 user/{sgx-tool,sgx-test-runtime,sgx-runtime} -t "$pkgdir/usr/bin/"
  install -Dm755 qemu/x86_64-linux-user/qemu-x86_64 "$pkgdir/usr/share/sgx/qemu"
  install -m755 "$srcdir/sgx-compile" -t "$pkgdir/usr/bin/"

  # Libraries
  cd user
  install -d "$pkgdir/usr/lib/sgx"
  all=$(make -d demo/hello.sgx | awk '{print $2}' | sed "s/'//g" | grep '\.o' | grep -v demo)
  for f in $all; do
    install -Dm644 "$f" -t "$pkgdir/usr/lib/sgx/$(dirname "$f")"
  done
  cd ..
  install -Dm644 "user/sgx.lds" "$pkgdir/usr/lib/sgx"

  # Headers
  install -d "$pkgdir/usr/include/sgx/polarssl"
  install -d "$pkgdir/usr/include/sgx/qemu"
  install -m644 user/include/*.h -t "$pkgdir/usr/include/sgx"
  install -m644 user/include/polarssl/*.h -t "$pkgdir/usr/include/sgx/polarssl"
  install -m644 qemu/target-i386/*.h -t "$pkgdir/usr/include/sgx/qemu"
  mv "$pkgdir/usr/include/sgx/sgx-lib.h" "$pkgdir/usr/include/sgx.h"
}

# vim:set ts=2 sw=2 et:
