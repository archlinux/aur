# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=opensgx-git
pkgver=r92.08cbf4a
pkgrel=1
pkgdesc="an open platform for Intel SGX"
arch=('x86_64')
url="https://github.com/sslab-gatech/opensgx/"
license=('MIT')
depends=()
makedepends=('git')
options=()
install=
source=(
  'opensgx-git::git+https://github.com/sslab-gatech/opensgx.git'
  'opensgx-bin-paths.patch'
  'opensgx-compile.patch'
  'sgx-qemu-path.patch'
  'test-sh.patch'
  'sgx-compile'
)
md5sums=('SKIP'
         '3c79950a441f1ef7f39015345ceed58c'
         'e862b28b09581142af78369c6c65ce66'
         '9ac0fa0ddae6d0e70f18992894bd1205'
         '48523504a8c9c6b4fc9175d143d87bf1'
         '1043db8fc0a62624653c482a968ce093')

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

  msg2 "Make opensgx use sgx-compile"
  patch -Np1 -i '../opensgx-compile.patch'

  msg2 "Make test.sh use system sgx"
  patch -Np1 -i '../test-sh.patch'

  msg2 "Fixing hard-coded paths"
  sed -i '/#define KEY_PATH1/ s@".*"@"/etc/sgx/device.key"@' qemu/target-i386/sgx_helper.c

  msg2 "Configure QEMU"
  cd qemu && ./configure-arch
}

build() {
  cd "$srcdir/$pkgname"

  msg2 "Build QEMU"
  make -C qemu

  msg2 "Build libsgx"
  make -C libsgx

  msg2 "Build userspace utilities"
  make -C user
}

package() {
  cd "$srcdir/$pkgname"

  # Binaries
  msg2 "Installing binaries"
  install -d "$pkgdir/usr/bin"
  install -m755 ./{sgx,sgx-dbg,opensgx} -t "$pkgdir/usr/bin/"
  install -m755 user/{sgx-tool,sgx-runtime} -t "$pkgdir/usr/bin/"
  install -Dm755 qemu/x86_64-linux-user/qemu-x86_64 "$pkgdir/usr/share/sgx/qemu"
  install -m755 "$srcdir/sgx-compile" -t "$pkgdir/usr/bin/"

  # Libraries
  msg2 "Installing library files"
  cd user
  install -d "$pkgdir/usr/lib/sgx"
  all=$(make -dn demo/hello.sgx | grep 'Considering target file' | awk '{print $4}' | sed -e "s/'//g" -e 's/\.$//' | grep -E '\.a|\.o' | grep -v demo)
  for f in $all; do
    install -Dm644 "$f" "$pkgdir/usr/lib/sgx/$(basename "$f")"
  done
  cd ..
  install -Dm644 "user/sgx.lds" "$pkgdir/usr/lib/sgx"

  # Headers
  msg2 "Installing headers"
  install -d "$pkgdir/usr/include/sgx"
  install -m644 libsgx/include/*.h -t "$pkgdir/usr/include/sgx"
  install -m644 user/share/include/*.h -t "$pkgdir/usr/include/sgx"

  # Fix header prefixes
  msg2 "Fixing headers"
  for f in "$pkgdir/usr/include/sgx"/*.h; do
    sed -i -e 's@#include <sgx-@#include <sgx/@g' "$f"
    b="$(basename "$f")"
    if [ "$f" != "$(dirname "$f")"/"${b#sgx-}" ]; then
      mv "$f" "$(dirname "$f")"/"${b#sgx-}"
    fi
  done

  msg2 "Adding device key"
  install -d "$pkgdir/etc/sgx"
  install -m644 user/conf/device.key -t "$pkgdir/etc/sgx"
}

# vim:set ts=2 sw=2 et:
