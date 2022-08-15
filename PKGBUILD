# Maintainer: Erik Bender <erik.bender@develerik.dev>

_pkgname=git-credential-1password
_orga=develerik
_gourl=github.com/$_orga/$_pkgname

pkgname="${_pkgname}"
pkgver="1.2.0"
pkgrel=1
pkgdesc="Git credential.helper using 1Password for storage"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://$_gourl"
license=('ISC')
makedepends=('git' 'go>=1.18')
depends=('git' '1password-cli')
provides=('git-credential-1password')
conflicts=("$_pkgname-dev-git" "$_pkgname-bin" "$_pkgname-git")
source=("git+https://$_gourl.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  local flags

  _flags=(
    -X=$_gourl/cmd.Version="$pkgver"
    -s
    -w
    -linkmode=external
  )

  export CGO_ENABLED=0

  cd $srcdir/$_pkgname
  go build -ldflags="${_flags[*]}" -o "$_pkgname" $_gourl
}

package() {
  cd ${srcdir}/${_pkgname}
  install -DT -m0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
