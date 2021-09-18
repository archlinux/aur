# Maintainer: atom <admin@eyun.cf>

_pkgname=drone-runner-docker
pkgname=drone-runner-docker-git
pkgver=1.6.3.r17.g0dd3da2
pkgrel=1
pkgdesc="Drone pipeline runner that executes builds inside Docker containers"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Polyform-Small-Business-1.0.0' 'Polyform-Free-Trial-1.0.0')
url="https://github.com/drone-runners/drone-runner-docker"
depends=('docker')
makedepends=('go')
provides=('drone-runner-docker')
conflicts=('drone-runner-docker')
backup=("etc/drone-runner/drone-runner-docker.ini")
install='drone-runner-docker.install'
source=(git+https://github.com/drone-runners/drone-runner-docker.git
		drone-runner-docker.service
		drone-runner-docker.ini
		drone-runner-docker.install)
sha256sums=('SKIP'
			'9522dc5f4feacb67b921ed3d96a9de5e224d979953360d7553482231b18264de'
			'f70c7a90f1acb3056189151be16d41e70b7ca5453b318aa0035a359658a3d2aa'
			'24d550d856360ba31558177a683bfcdc9535f0b001c4c02c2f502b23b8f7c541')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  go build -o release/drone-runner-docker
}

check() {
  cd "$srcdir/${_pkgname}"
  go test -v --cover ./engine/...
  go test -v --cover ./internal/...
}

package() {
  # binaries
  install -Dm755 "$srcdir/${_pkgname}/release/drone-runner-docker" "$pkgdir/usr/bin/drone-runner-docker"
  
  # license
  install -Dm644 "$srcdir/${_pkgname}/licenses/Polyform-Free-Trial.md" "$pkgdir/usr/share/${pkgname}/Polyform-Free-Trial.md"
  install -Dm644 "$srcdir/${_pkgname}/licenses/Polyform-Small-Business.md" "$pkgdir/usr/share/${pkgname}/Polyform-Small-Business.md"
  
  # service
  install -Dm644 drone-runner-docker.service "$pkgdir/usr/lib/systemd/system/drone-runner-docker.service"
  
  # config
  install -Dm644 drone-runner-docker.ini "$pkgdir/etc/drone-runner/drone-runner-docker.ini"
}
