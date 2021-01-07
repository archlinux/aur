# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Kevin MacMartin <prurigro@gmail.com>
# Contributor: korjjj <korjjj+aur@gmail.com>

pkgbase=syncthing-git
pkgname=(syncthing-git syncthing-relaysrv-git)
pkgver=1.12.1.r41.ge6f0ed65b
pkgrel=1
arch=(x86_64)
url="https://syncthing.net/"
license=(MPL)
makedepends=(git go inetutils)
source=("git+https://github.com/syncthing/syncthing.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.sysusers"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.tmpfiles"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.service"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/gcc-pie-segfaults-race.patch")
sha256sums=('SKIP'
            '6ab96a5949e223d315d49663734ad27b70c72469c691a61ac198cb7794cb5eaa'
            'f899998985f2d374af57f17ef6362c37a305467858195b74d1c1def71d97273f'
            '7c2fbc9608d81f8080f8a9102b867a52a050b61f426a0c182ccc1cb5815e4981'
            '4e00b06544a900b206fc41b9250ab75ea51b8e1489b1eff042da4f08d8a84ab0')

prepare() {
  install -d "src/github.com/syncthing"
  mv syncthing "src/github.com/syncthing/syncthing"
  # go-pie with -race segfaults
  cd "${srcdir}/src/github.com/syncthing/syncthing"
  patch -Np1 -i "${srcdir}/gcc-pie-segfaults-race.patch"
}

pkgver() {
  cd "src/github.com/syncthing/syncthing"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export BUILD_HOST=archlinux
  export GOPATH="$SRCDEST/go-modules" GOROOT_FINAL="/usr/bin"
  cd "${srcdir}/src/github.com/syncthing/syncthing"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go run build.go -no-upgrade -version v${pkgver} build
  go run build.go -no-upgrade -version v${pkgver} build strelaysrv
}

check() {
  export GOPATH="$SRCDEST/go-modules" GOROOT_FINAL="/usr/bin"
  cd "${srcdir}/src/github.com/syncthing/syncthing"
  if [ "${CARCH}" == "x86_64" ] ; then
    go run build.go -no-upgrade test
  fi
}

package_syncthing-git() {
  pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
  conflicts=(syncthing)
  provides=(syncthing)

  cd "${srcdir}/src/github.com/syncthing/syncthing"
  install -Dm755 syncthing "${pkgdir}/usr/bin/syncthing"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/syncthing/README.md"
  install -Dm644 "etc/linux-systemd/system/syncthing-resume.service" \
    "${pkgdir}/usr/lib/systemd/system/syncthing-resume.service"
  install -Dm644 "etc/linux-systemd/system/syncthing@.service" \
    "${pkgdir}/usr/lib/systemd/system/syncthing@.service"
  install -Dm644 "etc/linux-systemd/user/syncthing.service" \
    "${pkgdir}/usr/lib/systemd/user/syncthing.service"

  # license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/syncthing/LICENSE

  # ufw preset
  install -Dm644 etc/firewall-ufw/syncthing \
    "$pkgdir/etc/ufw/applications.d/ufw-syncthing"

  # man pages
  cd "${srcdir}/src/github.com/syncthing/syncthing/man"
#   for file in $(find . -name '*.1' -print); do
#     install -Dm644 $file "${pkgdir}"/usr/share/man/man1/$file
#   done
  install -Dm644 syncthing.1 "${pkgdir}"/usr/share/man/man1/syncthing.1
  for file in $(find . -name '*.5' -print); do
    install -Dm644 $file "${pkgdir}"/usr/share/man/man5/$file
  done
  for file in $(find . -name '*.7' -print); do
    install -Dm644 $file "${pkgdir}"/usr/share/man/man7/$file
  done
}

package_syncthing-relaysrv-git() {
  pkgdesc='Relay server for Syncthing'
  conflicts=(syncthing-relaysrv)
  provides=(syncthing-relaysrv)

  cd "${srcdir}/src/github.com/syncthing/syncthing"
  install -Dm755 strelaysrv "${pkgdir}"/usr/bin/syncthing-relaysrv

  install -Dm644 man/strelaysrv.1 \
    "${pkgdir}"/usr/share/man/man1/syncthing-relaysrv.1
  
  install -Dm644 "${srcdir}"/syncthing-relaysrv.service \
    "${pkgdir}"/usr/lib/systemd/system/syncthing-relaysrv.service
  install -Dm644 "${srcdir}/syncthing-relaysrv.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/syncthing-relaysrv.conf"
  install -Dm644 "${srcdir}/syncthing-relaysrv.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/syncthing-relaysrv.conf"
}
