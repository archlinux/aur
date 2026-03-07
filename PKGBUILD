pkgname=traefik-certs-dumper
pkgver=2.11.0
pkgrel=1
pkgdesc='Dump ACME data from Traefik (acme.json) to certificate files'
arch=('x86_64' 'aarch64')
url='https://github.com/ldez/traefik-certs-dumper'
license=('Apache')
depends=('glibc')
makedepends=('go')
backup=('etc/conf.d/traefik-certs-dumper')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ldez/traefik-certs-dumper/archive/refs/tags/v${pkgver}.tar.gz"
  "traefik-certs-dumper.service"
  "traefik-certs-dumper.conf"
)

sha256sums=('0a9b48af5daf60e61e594f7a65d48c7bfdfa25833d4daf95a5e7a2606487e1e3'
            '5e1c32df98ccbba5cd54601debc6825605c210ddc6db4c0203a141f62d559e0a'
            'f5f94aa45994371d03522d1ab0e42d2be525e15c13d982e39b2f5b2f78d0db20')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags="-s -w" -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary + license
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # docs
  install -Dm644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/docs"
  cp -a docs/. "${pkgdir}/usr/share/doc/${pkgname}/docs/"

  # upstream contrib unit as example (contrib is external/not maintained)
  if [[ -f contrib/traefik-certs-dumper.service ]]; then
    install -Dm644 contrib/traefik-certs-dumper.service \
                  "${pkgdir}/usr/share/doc/${pkgname}/traefik-certs-dumper.service.example"
  fi

  # Arch-friendly systemd unit
  install -Dm644 "${srcdir}/traefik-certs-dumper.service" \
                 "${pkgdir}/usr/lib/systemd/system/traefik-certs-dumper.service"

  # config (editable, preserved on upgrade)
  install -Dm644 "${srcdir}/traefik-certs-dumper.conf" \
                 "${pkgdir}/etc/conf.d/traefik-certs-dumper"
}
