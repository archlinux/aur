# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=nsbox-edge-git
pkgver=19.11.10.173.c73840b
pkgrel=1
pkgdesc='A multi-purpose, nspawn-powered container manager'
arch=('x86_64')
license=('mpl-2.0')
depends=('polkit' 'sudo')
optdepends=('gtk3: desktop file icon integration')
# NOTE: We use go-pie because nsbox-host needs to be a static binary, but go-pie-built
# static binaries will segfault.
makedepends=('gn' 'go' 'ninja' 'python')
source=("$pkgname::git+https://github.com/refi64/nsbox")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  python3 build/parse_release.py --root=$PWD --branch=edge \
    | python3 -c 'import json, sys; print(".".join(json.load(sys.stdin).values()))'
}

build() {
  cd "$pkgname"
  mkdir -p out
cat >out/args.gn <<EOF
libexec_dir = "lib"
EOF

  go mod vendor
  gn gen out
  export CC=gcc GOFLAGS=-trimpath
  ninja -C out
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr"
  cp -r out/install/etc "$pkgdir"
  cp -r out/install/{bin,lib,share} "$pkgdir/usr"
  chmod -R g-w "$pkgdir"
  chmod -R 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
