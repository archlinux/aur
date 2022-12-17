# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-git
_pkgname=authelia
pkgver=4.37.4.r0.g434c5af2
pkgrel=1
pkgdesc="The Cloud ready multi-factor authentication portal for your Apps."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/authelia"
license=('Apache-2.0')
makedepends=(
  'gcc'
  'git'
  'go'
  'nodejs'
  'yarn'
)
provides=('authelia')
conflicts=(
  'authelia'
  'authelia-bin'
)
backup=('etc/authelia/configuration.yml')

source=("$_pkgname::git+https://github.com/$_pkgname/$_pkgname.git#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir/gopath" PATH="$PATH:$srcdir/gopath/bin"
  cd "$srcdir/$_pkgname/web"

  COMMIT=$(git rev-parse HEAD)
  TAG=$(git describe --tags --abbrev=0)
  CLEAN=$(git diff --quiet && echo "clean" || echo "dirty")
  STATE="untagged ${CLEAN}"
  DATE=$(date +"%a, %d %b %Y %R:%S %z")
  XOPTIONS="-X 'github.com/authelia/authelia/v4/internal/utils.BuildBranch=master' -X 'github.com/authelia/authelia/v4/internal/utils.BuildTag=${TAG}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildCommit=${COMMIT}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildDate=${DATE}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildState=${STATE}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildNumber=AUR'"

  yarn install --frozen-lockfile --ignore-scripts
  yarn build
  cd ..
  cp -R api internal/server/public_html/
  go build -ldflags "-w ${XOPTIONS}" -trimpath -o authelia cmd/authelia/*.go
}

package() {
  install -Dm644 "$srcdir/$_pkgname/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm700 "$srcdir/$_pkgname/config.template.yml" "$pkgdir/etc/$_pkgname/configuration.yml"
  install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
