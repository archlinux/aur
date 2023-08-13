# Maintainer: Jun Ouyang <ouyangjun1999@gmail.com>

pkgname=derper
pkgver=1.46.1
pkgrel=1

pkgdesc='Tailscale runs DERP relay servers to help connect your nodes.'
url='https://github.com/tailscale/tailscale'
arch=('x86_64')
license=('BSD')

depends=('glibc')
makedepends=('go' 'git')

options=(!lto)
backup=('etc/conf.d/derper')


source=("derper-v$pkgver.tar.gz::https://github.com/tailscale/tailscale/archive/v$pkgver.tar.gz"
        derper.service
        derper.sysusers
        derper.conf)

sha256sums=('a567bafec720869faa25eb1886dac1b519679c8dbe5762d1e9cdb653898df076'
            '0b745c4985cb2768ad8db035f4c057e811a32cbd3cb45f0def3a8163ca404980'
            '710595c0e34f6bc2152549bb72f7cb9d7f820740976aecdf89d298f6a9604d1d'
            'ecaebd5f1fb0853464afeece438269303e8590aec8689554516036575deabcfc')

build() {
  cd tailscale-$pkgver
  go build -buildmode=pie -ldflags "-linkmode=external -extldflags=$LDFLAGS" ./cmd/derper
}

package() {
  install -Dm644 derper.service "$pkgdir"/usr/lib/systemd/system/derper.service
  install -Dm644 derper.sysusers "$pkgdir"/usr/lib/sysusers.d/derper.conf
  install -Dm644 derper.conf "${pkgdir}"/etc/conf.d/derper

  cd tailscale-$pkgver
  install -Dm755 -t "$pkgdir"/usr/bin derper
}
