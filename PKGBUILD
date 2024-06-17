# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=hellpot
_targetname=hellpot
pkgver=0.4.5
pkgrel=1
pkgdesc="HellPot is a portal to endless suffering meant to punish unruly HTTP bots."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/yunginnanet/HellPot"
license=('MIT')
makedepends=('go' 'git')
provides=('hellpot')
conflicts=('hellpot')
source=(
    "$_targetname::git+https://github.com/yunginnanet/HellPot.git#tag=v${pkgver}"
    "service"
    "tmpfiles"
    "sysusers"
    "config.toml"
)
backup=('etc/hellpot/config.toml')
sha256sums=('477dd095824ce8879ef3200ff95ded209ec3515340299df3b5975233ab27de30'
            '0136fd65b73e678d12ddff09cd5f71bfea360787cf7955770fe95b64dabe8274'
            'a370bd1f4f1caa1aa4777e3a6cb6c752f711721c9913e09c78a11d304bc53b37'
            'd462d4a84021cb2ce0052ba6c46ad0ea6e7aab7a9459d048de892d8503a99aee'
            '5663856679a38a69572683f9720c4a20aeaf3eb6a26f5ca067e23d4fcc2b28ac')

build() {
  cd "$srcdir/$_targetname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -X main.version=v${pkgver} -linkmode external" -o $_targetname ./cmd/HellPot
}

package() {
  cd "$srcdir"

  install -Dm755 $_targetname/$_targetname "${pkgdir}"/usr/bin/$_targetname
  install -Dm644 config.toml "${pkgdir}"/etc/$_targetname/config.toml
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/$_targetname.service
  install -Dm644 tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_targetname.conf
  install -Dm644 sysusers "${pkgdir}"/usr/lib/sysusers.d/$_targetname.conf
}
