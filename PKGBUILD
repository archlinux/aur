# Maintainer: Adam Harvey <adam@adamharvey.name>
pkgname=delve
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A debugger for the Go programming language"
arch=("i686" "x86_64")
url="https://github.com/derekparker/delve"
license=("MIT")
groups=()
depends=('glibc')
makedepends=('go')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

# Delve has its own version tags that don't quite line up with Arch's normal
# versioning, and Git packages the tarballs without the preceding "v". It's all
# a bit ugly.
_delve_ver='1.0.0'
_delve_tag="v${_delve_ver}"

# Delve also expects that a standard GOPATH setup is available, and make fails
# pretty spectacularly in the release package.
_delve_pkg=github.com/derekparker/delve
_delve_srcdir="src/${_delve_pkg}"

source=("${url}/archive/${_delve_tag}.tar.gz")
noextract=()
md5sums=()
sha512sums=('128311bb7fd61b5b681c89060d7c0817da649fdbeef6367e627ca537ad4c3f07771d638e7e803c052c95bace8a7f5c8fb07feda1e06ce0ef34fd87143c29fece')
validpgpkeys=()

build() {
  export GOPATH="$(pwd)"
  mkdir -p src/github.com/derekparker
  mv "${pkgname}-${_delve_ver}" "${_delve_srcdir}"
  go install "${_delve_pkg}/cmd/dlv"
}

package() {
  install -Dm755 bin/dlv "$pkgdir/usr/bin/dlv"
  install -Dm644 "${_delve_srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
  install -Dm644 "${_delve_srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"

  # I have no particular desire to keep up with what's in the Documentation
  # directory; let's just copy everything and tell cp to drop the ownership
  # details.
  cp -dr --no-preserve=ownership "${_delve_srcdir}/Documentation" "$pkgdir/usr/share/doc/${pkgname%-*}/"
}
