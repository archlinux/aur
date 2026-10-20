# Maintainer: Darko Demić <mail at darkodemic dot com>
#
# AUR package gpwebcam-git: gpwebcam built from the newest commit on main.
# Unlike gpwebcam and gpwebcam-bin, which GoReleaser pushes with every
# release, this file is pushed to the AUR by hand, only when it changes.
# Keep its dependencies and installed files in step with the AUR entries
# in .goreleaser.yaml.

pkgname=gpwebcam-git
pkgver=0.3.1.r1.g513ae03
pkgrel=1
pkgdesc='Use a GoPro connected over USB as a Linux webcam (latest commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/darkodemic/gpwebcam'
license=('Apache-2.0')
depends=('ffmpeg' 'hicolor-icon-theme')
makedepends=('git' 'go')
optdepends=('v4l2loopback-dkms: the loopback device that applications read'
            'libnotify: desktop notifications')
provides=('gpwebcam')
conflicts=('gpwebcam' 'gpwebcam-bin')
install=gpwebcam.install
source=('git+https://github.com/darkodemic/gpwebcam.git')
sha256sums=('SKIP')

pkgver() {
  cd gpwebcam
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gpwebcam
  # The module cache stays in the build directory and writable, so
  # makepkg can clean it up.
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-mod=readonly -modcacherw"
  go mod download
}

build() {
  cd gpwebcam
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o gpwebcam ./cmd/gpwebcam
}

package() {
  cd gpwebcam
  install -Dm755 gpwebcam "${pkgdir}/usr/bin/gpwebcam"
  install -Dm644 packaging/systemd/gpwebcam.service "${pkgdir}/usr/lib/systemd/user/gpwebcam.service"
  install -Dm644 packaging/modules-load.d/gpwebcam.conf "${pkgdir}/usr/lib/modules-load.d/gpwebcam.conf"
  install -Dm644 packaging/modprobe.d/99-gpwebcam.conf "${pkgdir}/usr/lib/modprobe.d/99-gpwebcam.conf"
  install -Dm644 packaging/desktop/gpwebcam.desktop "${pkgdir}/usr/share/applications/gpwebcam.desktop"
  install -Dm644 packaging/icons/gpwebcam.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gpwebcam.svg"
  install -Dm644 packaging/man/gpwebcam.1 "${pkgdir}/usr/share/man/man1/gpwebcam.1"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/gpwebcam/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gpwebcam/LICENSE"
}
