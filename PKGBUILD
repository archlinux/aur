# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=immugw
pkgver=1.3.0
pkgrel=1
pkgdesc='A REST proxy for immudb'
arch=('x86_64')
url='https://github.com/codenotary/immugw'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/immugw/immugw.toml')
options=('!lto')
_commit='df2e5124957fc5b4992dd4592605608dd64c0742'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'config.toml'
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha512sums=('SKIP'
            '6212ba5b0f2689706d6c071c38d9b3fa417b6f38d8700777e0f60aad1ca45fd1201271bd52670c36c9bcc3238165aead2b2cf37ab0202208397594bd7eb8672c'
            '381e38db8a37b615f145c281649cae227d6f5bf4d834d5ee934a6e739c55da24d508ed25905f5d57702ff9cb2e06bdf3ab5fa19dd19beca7d5876107d2c3003e'
            '243fe6bc2cdf2c5de6765d351c658716dae7a6489548556c4384d9cce39e82ccdb8566767521a3f6620cd993c2b6e8aed9d2ed2ae1bec79fb468be2cffc5b825'
            'e56b4139b1cdb7040c553a9b3eb1ad134b5a6549e9144f62f35f0f6915b933f893384f45c8572269e75bdfd203a73bbeda84bee06905342a33815f73f404f7b8')
b2sums=('SKIP'
        '1057732b9db56df01c516f4a97bf1e97f0fcc8dbb35f90c7419401780d1d95cdcb4c17bc0a6d92eb7a798be6e8c9170a6063fdb5b79cab240b1bae077bd79234'
        '57b8038a35a22c53ea5896aa29d1d8aec4ac2d10af884ef9e06f1f82ccc6536de7af2b3bff69c460735b14508dfb236a76cc34a39f20854270f9d319f76ecf49'
        '8b49799d2e15d3a2f166ca3c42e3e4236f7b163e17e288b291703453aa4d74d7f723dd733e03d53e5fd9619d799b5d68fb51f86ab418a06dfbb59ae640cde7b9'
        '7ac7320c7d0f4d7ce16639c5ed49c53085d2ee44437be3907a62536ee2827135b19b0b22eb5bd91c05a470cb63d8b13963d3160f72bda0c267dfb96be2c82501')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build_output

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS \
    -X github.com/codenotary/immugw/cmd/version.Version=$pkgver \
    -X github.com/codenotary/immugw/cmd/version.Commit=$_commit \
    -X github.com/codenotary/immugw/cmd/version.BuiltBy=aur@archlinux \
    -X github.com/codenotary/immugw/cmd/version.BuiltAt=$(date -d@"$SOURCE_DATE_EPOCH" +%s)" \
    -o build_output \
    ./cmd/...
}

check() {
  cd "$pkgname"
  go test -race -failfast -v ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # configuration
  install -vDm644 config.toml "$pkgdir/etc/immugw/immugw.toml"

  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build_output/immugw

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
