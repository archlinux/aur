# Maintainer: fish4terrisa-MSDSM <fish4terrisa@fishinix.org>
pkgname=goxray-git
pkgver=v0.0.9.r0.g66ce4ce
pkgrel=1
pkgdesc="Desktop Xray VPN client for macOS and Linux"
arch=("x86_64")
url="https://github.com/goxray/desktop"
license=("GPLv3")
makedepends=("git" "go")
depends=("glibc" "xray")
provides=(goxray)
conflicts=(goxray)
source=("git+https://github.com/goxray/desktop.git"
        "goxray.install"
        "goxray.service")
sha256sums=('SKIP'
            '4ef4bc3a56cc52dcd3e65b19a39edf2b9abe0ef7c262a93d33838b47641862c1'
            '57ba9c93e31ac3ae6ca4103675d8fefece4373298de480cef0827af65b191597')

pkgver() {
  cd "${srcdir}/desktop"
  printf v"%s" "$(git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/desktop"

    # https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    export GO_LDFLAGS="-linkmode=external" 

    CGO_ENABLED=1 go build -ldflags "$GO_LDFLAGS" 
}

package() {
  cd "${srcdir}/desktop"
  install -Dm755 desktop "$pkgdir/usr/bin/goxray"

  cd "${srcdir}"
  install -Dm644 goxray.service "$pkgdir/usr/lib/systemd/user/goxray.service"

  cd "${srcdir}/desktop"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
