# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=konnect
pkgver=0.30.0
_commit=b6b61ad87817f6eacea1223c062544f78812d792
pkgrel=1
pkgdesc='Konnect implements an OpenID provider (OP) with integrated web login and consent forms'
arch=('x86_64')
url="https://stash.kopano.io/projects/KC/repos/konnect"
license=('Apache')
depends=(glibc)
makedepends=('go-pie' 'git' 'yarn' 'scour')
backup=("etc/konnect/identifier-registration.yaml" "etc/konnect/scopes.yaml")
source=("git+https://github.com/Kopano-dev/konnect.git#tag=v${pkgver}?signed" konnect.sysusers)
validpgpkeys=('9DDB6CAD455D63112CAD26D8CA499C410B3C3354')
sha256sums=('SKIP'
            '29f9c23d317f769940537d186a30ca355e107d440047e516ff149d70b70b589f')

build() {
  cd $pkgname
  make vendor

  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname ./cmd/konnectd/
}

check() {
  cd $pkgname
  go test -mod=vendor ./...
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/konnectd

  # sysusers files
  install -D -m 0644 "${srcdir}"/${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf

  # conf files
  install -d "$pkgdir"/etc/konnect
  install -Dm644 identifier-registration.yaml.in "$pkgdir"/etc/konnect/identifier-registration.yaml
  install -Dm644 scopes.yaml.in "$pkgdir"/etc/konnect/scopes.yaml
}
