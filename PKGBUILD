# Maintainer: Revvy <nothingtohide@revvy.de>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: @RubenKelevra <cyrond@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Anatol Pomozov
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=kubo
_old_pkgname=go-ipfs
pkgname="${_pkgname}-git"
pkgver=0.30.0.r15.gb71cf0d
pkgrel=1
pkgdesc="IPFS implementation in Go"
url="https://github.com/ipfs/kubo"
arch=('x86_64')
license=('MIT AND Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('fuse2: for mounting/advanced use')
provides=("${_pkgname}" 'ipfs' "${_old_pkgname}")
conflicts=("${_pkgname}" "${_old_pkgname}" "${_old_pkgname}-git")
replaces=("${_old_pkgname}-git")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i 's|/usr/local/bin/ipfs|/usr/bin/ipfs|' misc/systemd/*.service
  sed -i '/^User=ipfs$/d' misc/systemd/*.service
  sed -i '/^Group=ipfs$/d' misc/systemd/*.service
  go mod download
}

build() {
  cd "${_pkgname}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_REQUIRED="1"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -ldflags '-compressdwarf=false -linkmode=external'"
  make build
  cmd/ipfs/ipfs commands completion bash > ipfs-completion.bash
  cmd/ipfs/ipfs commands completion fish > ipfs-completion.fish
  cmd/ipfs/ipfs commands completion zsh > ipfs-completion.zsh
}

package() {
  cd "${_pkgname}"

  install -Dm 755 cmd/ipfs/ipfs "${pkgdir}/usr/bin/ipfs"
  install -Dm 644 -t "${pkgdir}/usr/lib/systemd/user/" misc/systemd/*.service
  install -Dm 644 -t "${pkgdir}/usr/lib/systemd/system/" misc/systemd/*.socket

  install -Dm 644 ipfs-completion.bash "${pkgdir}/usr/share/bash-completion/completions/ipfs"
  install -Dm 644 ipfs-completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ipfs.fish"
  install -Dm 644 ipfs-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_ipfs"

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-MIT
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-APACHE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
