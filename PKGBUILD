# Maintainer: atom <admin@eyun.cf>

_pkgname=drone-runner-docker
pkgname=drone-runner-docker-git
pkgver=1.6.3.r5.g67ee5cc
pkgrel=1
pkgdesc="Drone pipeline runner that executes builds inside Docker containers"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache 2')
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
			'2f44ed0aae1df1df1aa2bc99874e43f7000c2ab54bcf60a178580783eb3115f3'
			'a2079ac7c935e246e6d77f0f9301971f4f5bc3e9e0ac50b7ea0a60c9daae8d24')

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
