# Maintainer: atom <admin@eyun.cf>

pkgname=drone-runner-docker
pkgver=1.6.3
pkgrel=2
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
			'9522dc5f4feacb67b921ed3d96a9de5e224d979953360d7553482231b18264de'
			'2f44ed0aae1df1df1aa2bc99874e43f7000c2ab54bcf60a178580783eb3115f3'
			'a2079ac7c935e246e6d77f0f9301971f4f5bc3e9e0ac50b7ea0a60c9daae8d24')

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
  install -Dm644 drone-runner-docker.ini "$pkgdir/etc/drone-runner/drone-runner-docker.ini"
}
