# Maintainer: atom <admin@eyun.cf>

pkgname=drone-runner-docker
pkgver=1.6.3
pkgrel=3
pkgdesc="Drone pipeline runner that executes builds inside Docker containers"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache 2')
url="https://github.com/drone-runners/drone-runner-docker"
depends=('docker')
makedepends=('go')
conflicts=('drone-runner-docker-git')
backup=("etc/drone-runner/drone-runner-docker.ini")
install='drone-runner-docker.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
		drone-runner-docker.service
		drone-runner-docker.ini
		drone-runner-docker.install)
sha256sums=('ef5fd33a55ddb90a5e09a0302c03af2b365b4a0242561d8c4dcbf70953f1cf5d'
			'9522dc5f4feacb67b921ed3d96a9de5e224d979953360d7553482231b18264de'
			'f70c7a90f1acb3056189151be16d41e70b7ca5453b318aa0035a359658a3d2aa'
			'24d550d856360ba31558177a683bfcdc9535f0b001c4c02c2f502b23b8f7c541')

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
