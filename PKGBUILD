# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Austin Haedicke (austin.haedicke@gmail.com)
# Contributor: @RubenKelevra https://github.com/RubenKelevra
# Contributor: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Martin Wimpress <code@flexion.org>

pkgbase=syncthing-git
pkgname=(syncthing-git syncthing-discosrv-git syncthing-relaysrv-git)
pkgver=2.0.1.r0.g7a76685d7
pkgrel=1
arch=(x86_64)
url="https://syncthing.net/"
license=(MPL-2.0)
depends=(glibc)
makedepends=(git go)
source=("git+https://github.com/syncthing/syncthing.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-discosrv.sysusers"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-discosrv.tmpfiles"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-discosrv.service"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.sysusers"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.tmpfiles"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.service"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/gcc-pie-segfaults-race.patch")
sha256sums=('SKIP'
            'f6e704dd7b10127b1642c889a29e95468daa75d895493b235ce1ed5e97155b70'
            'a05a66efbbd13f20b5c3af56692fe219fadc967dba4eedb71494827795d2c140'
            '4dc66a098cf2f6e5bd34a48898f5c98aff74d3c8c61115313b0eff6b8d8b18f6'
            '6ab96a5949e223d315d49663734ad27b70c72469c691a61ac198cb7794cb5eaa'
            'f899998985f2d374af57f17ef6362c37a305467858195b74d1c1def71d97273f'
            '7c2fbc9608d81f8080f8a9102b867a52a050b61f426a0c182ccc1cb5815e4981'
            '6a58227c09a18fc7049ec38351a0fd98195688d15821d67d5af4facda401cbba')
options=(!lto)

prepare() {
  #patch -Np1 -i "${srcdir}/gcc-pie-segfaults-race.patch"

  #install -d "src/github.com/syncthing"
  #mv syncthing "src/github.com/syncthing/syncthing"
  # go-pie with -race segfaults
  #cd "${srcdir}/src/github.com/syncthing/syncthing"
true
}

pkgver() {
  #cd "src/github.com/syncthing/syncthing"
  cd "syncthing"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export BUILD_HOST=archlinux
  export GOPATH="$SRCDEST/go-modules" GOROOT_FINAL="/usr/bin"
  #cd "${srcdir}/src/github.com/syncthing/syncthing"
  cd "syncthing"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go run build.go -no-upgrade build
  go run build.go -no-upgrade build strelaysrv
  go run build.go -no-upgrade build stdiscosrv
}

check() {
  #export GOPATH="$SRCDEST/go-modules" GOROOT_FINAL="/usr/bin"
  #cd "${srcdir}/src/github.com/syncthing/syncthing"
  #cd "syncthing"
  #if [ "${CARCH}" == "x86_64" ] ; then
  #  go run build.go -no-upgrade test
  #fi
true
}

package_syncthing-git() {
  pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
  conflicts=(syncthing)
  provides=(syncthing)

  cd "syncthing"
  install -Dm755 syncthing "${pkgdir}/usr/bin/syncthing"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/syncthing/README.md"
  install -Dm644 "etc/linux-systemd/system/syncthing@.service" \
    "${pkgdir}/usr/lib/systemd/system/syncthing@.service"
  install -Dm644 "etc/linux-systemd/user/syncthing.service" \
    "${pkgdir}/usr/lib/systemd/user/syncthing.service"

  # ufw preset
  install -Dm644 etc/firewall-ufw/syncthing \
    "${pkgdir}/etc/ufw/applications.d/ufw-syncthing"

  # sysctl conf
  install -Dm644 etc/linux-sysctl/30-syncthing.conf \
    "${pkgdir}/usr/lib/sysctl.d/30-syncthing.conf"

  # man pages
  pushd man
  install -Dm644 syncthing.1 "${pkgdir}"/usr/share/man/man1/syncthing.1
  for file in $(find . -name '*.5' -print); do
    install -Dm644 $file "${pkgdir}"/usr/share/man/man5/$file
  done
  for file in $(find . -name '*.7' -print); do
    install -Dm644 $file "${pkgdir}"/usr/share/man/man7/$file
  done
}

package_syncthing-discosrv-git() {
  pkgdesc="Discovery server for Syncthing"
  conflicts=(syncthing-discosrv)
  provides=(syncthing-discosrv)

  cd "syncthing"
  install -Dm755 stdiscosrv "${pkgdir}"/usr/bin/syncthing-discosrv

  install -Dm644 man/stdiscosrv.1 \
    "${pkgdir}"/usr/share/man/man1/syncthing-discosrv.1

  install -Dm644 "${srcdir}"/syncthing-discosrv.service \
    "${pkgdir}"/usr/lib/systemd/system/syncthing-discosrv.service
  install -Dm644 "${srcdir}/syncthing-discosrv.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/syncthing-discosrv.conf"
  install -Dm644 "${srcdir}/syncthing-discosrv.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/syncthing-discosrv.conf"
}

package_syncthing-relaysrv-git() {
  pkgdesc="Relay server for Syncthing"
  conflicts=(syncthing-relaysrv)
  provides=(syncthing-relaysrv)

  cd "syncthing"
  install -Dm755 strelaysrv "${pkgdir}"/usr/bin/strelaysrv

  install -Dm644 man/strelaysrv.1 \
    "${pkgdir}"/usr/share/man/man1/syncthing-relaysrv.1

  install -Dm644 "${srcdir}"/syncthing-relaysrv.service \
    "${pkgdir}"/usr/lib/systemd/system/syncthing-relaysrv.service
  install -Dm644 "${srcdir}/syncthing-relaysrv.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/syncthing-relaysrv.conf"
  install -Dm644 "${srcdir}/syncthing-relaysrv.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/syncthing-relaysrv.conf"
}
