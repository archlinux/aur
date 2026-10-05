# Maintainer: nugget <vincent dot tantei at proton dot me>
#
# Generated from packaging/aur/PKGBUILD.in in the xunhen repository by
# packaging/aur/resolve.sh. Edit the template there, not this file.
#
# Build flags: Arch's Go guidelines ask for -buildmode=pie with external
# linking, which needs cgo and links against glibc. xunhen is pure Go and
# ships one static executable on every channel: no dynamic loader and no
# shared library. A cgo-free -buildmode=pie still names the dynamic loader,
# so it would break that, and external linking would add a libc dependency
# the program has no use for. This recipe therefore builds with cgo off and
# the default build mode, like the release archive, and keeps -trimpath,
# -mod=readonly, and -modcacherw from the guidelines.
#
# namcap therefore warns that the executable lacks PIE and full RELRO, both
# of which need external linking. It also calls it unstripped: makepkg's
# debug option moves the DWARF sections to xunhen-debug and keeps the ELF
# symbol table. All three warnings are expected.

pkgname=xunhen
pkgver=1.0.0
pkgrel=1
_version=1.0.0
_commit=0cb2312485642a2169fa2abbd6d481a69cb70660
pkgdesc="Browse the editing history that survived in Neovim undo files"
arch=('x86_64')
url="https://github.com/nuggocto/xunhen"
license=('Apache-2.0')
depends=()
makedepends=('go>=2:1.27.1')
checkdepends=('git')
source=("xunhen_${_version}_source.tar.gz::https://github.com/nuggocto/xunhen/releases/download/v${_version}/xunhen_${_version}_source.tar.gz")
sha256sums=('11b694b24f3ec646e5c6f256379c9c023eadc7d4159a77be290f10cc73ddba1d')

# The go command's environment for every step: no go.env file, no
# workspace, no toolchain download, and a module cache inside $srcdir.
_goenv() {
  export GOENV=off GOWORK=off GOTOOLCHAIN=local
  export GOPATH="$srcdir/gopath" GOMODCACHE="$srcdir/gomodcache"
  # -buildvcs=false here as well as in build(): the tests build the
  # command too, and the clone the recipe lives in is a git repository of
  # its own, not the source's.
  export GOFLAGS="-trimpath -mod=readonly -modcacherw -buildvcs=false"
  export CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOAMD64=v1
}

prepare() {
  cd "xunhen_${_version}_source"
  _goenv
  # The only step that reaches the network: go.sum verifies every module.
  go mod download
  go mod verify
}

build() {
  cd "xunhen_${_version}_source"
  _goenv
  export GOPROXY=off
  go build -buildvcs=false \
    -ldflags "-X main.version=v${_version} -X main.commit=${_commit}" \
    -o xunhen ./cmd/xunhen
}

check() {
  cd "xunhen_${_version}_source"
  _goenv
  export GOPROXY=off
  go test -count=1 -timeout=10m ./...
  # The same artifact checks as the release archive and the Nix package,
  # run against the executable this package installs.
  go run ./tools/verify -binary ./xunhen -version "v${_version}" \
    -commit "${_commit}" -go "$(go env GOVERSION)"
}

package() {
  cd "xunhen_${_version}_source"
  install -Dm755 xunhen "$pkgdir/usr/bin/xunhen"
  install -Dm644 LICENSE THIRD_PARTY_NOTICES.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  # The same documents as the release archive, whose build refuses a
  # relative link from one of them to a file the archive lacks. Symbolic
  # links to the license files keep the README's links to them working.
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 docs/install.md docs/usage.md docs/troubleshooting.md -t "$pkgdir/usr/share/doc/$pkgname/docs/"
  ln -s "../../licenses/$pkgname/LICENSE" "../../licenses/$pkgname/THIRD_PARTY_NOTICES.txt" \
    "$pkgdir/usr/share/doc/$pkgname/"
}
