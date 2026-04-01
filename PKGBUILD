pkgname=hops-git
pkgver=0.1.0.r0.gc4f3efd
pkgrel=1
pkgdesc='TUI for managing /etc/hosts profiles'
arch=('x86_64' 'aarch64')
url='https://github.com/houz42/hops'
license=('MIT')
makedepends=('go>=1.22')
provides=('hops')
conflicts=('hops')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"
  go build -ldflags="-s -w" -o hops .
}

package() {
  cd "$pkgname"
  install -Dm755 hops "${pkgdir}/usr/bin/hops"
  install -Dm644 assets/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hops.svg"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/hops.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=hops
GenericName=Hosts Manager
Comment=TUI for managing /etc/hosts profiles
Exec=hops
Icon=hops
Terminal=true
Categories=System;Network;ConsoleOnly;
Keywords=hosts;dns;network;profiles
EOF
}
