# Maintainer: atom <admin@eyun.cf>

pkgname=drone-runner-docker
pkgver=1.6.3
pkgrel=1
pkgdesc="Drone pipeline runner that executes builds inside Docker containers"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache 2')
url="https://github.com/drone-runners/drone-runner-docker"
depends=('docker')
makedepends=('go')
conflicts=('drone-agent')
backup=("etc/drone/drone-runner-docker.ini")
install='drone-runner-docker.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
		drone-runner-docker.service
		drone-runner-docker.ini
		drone-runner-docker.install)
sha256sums=('ef5fd33a55ddb90a5e09a0302c03af2b365b4a0242561d8c4dcbf70953f1cf5d'
			'57a747457cb1557b11ceeffafe8364e974b19a819edb2052d9016abc4efb20d8'
			'2f44ed0aae1df1df1aa2bc99874e43f7000c2ab54bcf60a178580783eb3115f3'
			'000c21b30b1ed811f3ab97b891358d659cf43257f58d522d54d99a8b18572687')

build() {
  cd "${pkgname}-${pkgver}"
  go build -o release/drone-runner-docker
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -v --cover ./engine/...
  go test -v --cover ./internal/...
}

package() {
  # binaries
  install -Dm755 "$srcdir/${pkgname}-${pkgver}/release/drone-runner-docker" "$pkgdir/usr/bin/drone-runner-docker"
  
  # license
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/licenses/Polyform-Free-Trial.md" "$pkgdir/usr/share/${pkgname}/Polyform-Free-Trial.md"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/licenses/Polyform-Small-Business.md" "$pkgdir/usr/share/${pkgname}/Polyform-Small-Business.md"
  
  # service
  install -Dm644 drone-runner-docker.service "$pkgdir/usr/lib/systemd/system/drone-runner-docker.service"
  
  # config
  install -Dm644 drone-runner-docker.ini "$pkgdir/etc/drone/drone-runner-docker.ini"
}
