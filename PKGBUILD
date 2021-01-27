# PKGBUILD to build and install SCIONLab natively on Archlinux

# Maintainer: Thorben Krüger <thorben.krueger@ovgu.de>
pkgname=scionlab-git
pkgver=v2020.12.r5.ga90f354e
pkgrel=4
epoch=
pkgdesc="A global research network to test the SCION next-generation internet architecture"
arch=('x86_64')
url="https://www.scionlab.org"
license=('Apache')
groups=('scion')
depends=('glibc' 'python')
makedepends=('git')
optdepends=('openvpn: attach to SCIONLab through NAT/dynamic IP (recommended)')
install=scionlab.install
source=("scion::git+https://github.com/netsec-ethz/scion.git#branch=scionlab"
	"scion-border-router@.service"
	"scion-control-service@.service"
	"scion-daemon.service"
	"scion-dispatcher.service"
	"scion-ip-gateway.service"
	"scionlab-openvpn@.service"
	"scionlab.target"
	"dispatcher.toml"
	"sciond.toml"
	"sig.toml"
	"scionlab-script-openvpn-service.patch"
	"https://golang.org/dl/go1.14.14.linux-amd64.tar.gz")
md5sums=('SKIP'
         '9202be206a0a2f30eb30d552efd6f9a6'
         '47dc3b0aae88537d388e9f1f28017320'
         '80a32802ea6c327633886680bfa48968'
         '7fb9f77cb907d11c904919f8820107a1'
         'ab42451f6421da4b1dfd525ed9317185'
         '7d3bece9d0ecde9550fdc3c1bab2d9ab'
         '9c41fd9c5286945e28112011e0d0fa87'
         'bc455aa2b37c6198f38e2d4c37f4e556'
         '7de52e9e95df78c9203014b66f91c57d'
         'a27e871f88ec0aae900eaa26c504771f'
         '5b66ba4a134980b10193ff7c5a70a673'
         '973925f5d03d1f072a5588b8dd8581b9')
_scionlab_source="https://github.com/netsec-ethz/scionlab.git"
_scionlab_revision="7cacae28b4a06ca511dd27ccdfa9e160b60eff4d"
noextract=()
validpgpkeys=()


pkgver() {
  cd "scion"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  #cd "$pkgname-$pkgver"
  #unset GIT_LFS_SKIP_SMUDGE
  
  cd "$srcdir/"
  git clone $_scionlab_source scionlab
  pushd scionlab
  git checkout -q $_scionlab_revision
  patch -p1 -i "$srcdir/scionlab-script-openvpn-service.patch"
  popd
  pushd scion
  find . -type f -name "*.go" -exec sed -i 's|/run/shm|/dev/shm|g' {} +
  popd

}

build() {
  cd "$srcdir/scion"
  #cd "$pkgname-$pkgver"
  "$srcdir/go/bin/go" build -o ./bin/ -v \
     -ldflags="-s -w -X github.com/scionproto/scion/go/lib/env.StartupVersion=$(git describe --tags)-scionlab"\
     ./go/posix-router/\
     ./go/cs/\
     ./go/posix-gateway/\
     ./go/sciond/\
     ./go/dispatcher/\
     ./go/scion/\
     ./go/scion-pki/\
     ./go/tools/pathdb_dump/
}

check() {
  cd "$srcdir/${pkgname%-git}"
  # nop
}

package() {
  for SysFile in "scion-border-router@.service"\
		   "scion-control-service@.service"\
		   "scion-daemon.service"\
		   "scion-dispatcher.service"\
		   "scion-ip-gateway.service"\
		   "scionlab-openvpn@.service"\
		   "scionlab.target"
  do
    install -Dm644 "$SysFile" "$pkgdir/usr/lib/systemd/system/$SysFile"
  done
  for ConfFile in "dispatcher.toml"\
		    "sciond.toml"\
		    "sig.toml"
  do
    install -Dm644 -gscion -oscion "$ConfFile" "$pkgdir/etc/scion/$ConfFile"
  done
  pushd "$srcdir/${pkgname%-git}"
  install -Dm755 scionlab/hostfiles/scionlab-config "$pkgdir/usr/bin/scionlab-config"
  popd
  pushd "$srcdir/scion"
  #cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pushd "bin"
  install -Dm755 posix-router "$pkgdir/usr/bin/scion-border-router"
  install -Dm755 cs "$pkgdir/usr/bin/scion-control-service"
  install -Dm755 posix-gateway "$pkgdir/usr/bin/scion-ip-gateway"
  install -Dm755 dispatcher "$pkgdir/usr/bin/scion-dispatcher"
  for binary in $(find . -type f -name "scion*" -print)
  do
    install -Dm755 "$binary" "$pkgdir/usr/bin/$binary"
  done
  popd
}
