# Maintainer: Matt Cuneo <m@cuneo.au>
pkgname=authentik-outpost
pkgver=2025.6.2
pkgrel=1
pkgdesc="Open-source Identity Provider focused on flexibility and versatility."
arch=('x86_64')
url="https://goauthentik.io/"
license=('MIT')
conflicts=(authentik-outpost-bin)
backup=(etc/authentik-outpost-ldap.env etc/authentik-outpost-proxy.env etc/authentik-outpost-radius.env etc/authentik-outpost-rac.env)
_outposts=(ldap proxy radius rac)
source=("git+https://github.com/goauthentik/authentik.git#tag=version/${pkgver}"
        "authentik-outpost.service"
        "authentik-outpost.env"
)
optdepends=('guacamole-server: required for rac outpost')
makedepends=('git'
  'go'
)

prepare() {
  cd "$srcdir/authentik"
  sed -i 's|\(guacdPath.*"\).*\("\)|\1/usr/bin/guacd\2|' ./internal/outpost/rac/guacd.go
}

build() {
  cd "$srcdir/authentik"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  for outpost in "${_outposts[@]}"; do
    go build -o "./authentik-outpost-$outpost" "./cmd/$outpost"
  done
}

package() {
  for outpost in  "${_outposts[@]}"; do
    install -Dm755 "$srcdir/authentik/authentik-outpost-$outpost" -t "$pkgdir/usr/bin/"
    install -Dm644 authentik-outpost.service "$pkgdir/usr/lib/systemd/system/authentik-outpost-$outpost.service"
    sed -i "s/\[outpost\]/$outpost/g" "$pkgdir/usr/lib/systemd/system/authentik-outpost-$outpost.service"
    install -Dm644 authentik-outpost.env "$pkgdir/etc/authentik-outpost-$outpost.env"
  done
}
sha256sums=('fa6640ad3448985ee82a412f7c7db3c39e98d5d5eb63167aa42738853327fa18'
            '19e2025eca5b450b2e1dd15a174fa9438f7ac41c200720b4959b93adf0d2362b'
            '6be54203da7d45e96aaacb5b3abdf3b4fc896138e807f6e65c60090fd17127b2')
