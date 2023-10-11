#Maintainer: Raihan Ahamed (raihan2000) <raihan1999ahamed@gmail.com>

pkgname=(hexagonrpcd)
pkgdesc="Qualcomm HexagonFS daemon"
pkgver=v0.1.0
pkgrel=1
arch=(any)
license=(GPL-3.0-or-later)
url="https://gitlab.com/flamingradian/sensh/"
depends=(glibc)
makedepends=(
    linux-headers
    meson
    git
)
_commit=23b7681f3faad422fa5751886f901bf03775243d  # tags/0.1.0^0
source=(
    "git+https://gitlab.com/flamingradian/sensh.git#commit=$_commit"
    10-fastrpc.rules
    noshared.patch
    hexagonrpcd-adsp-rootpd.service
    hexagonrpcd-adsp-sensorspd.service
    hexagonrpcd-sdsp.service
)
sha256sums=(
    SKIP
    41dfc4e8c4fd88f461a5a6e4a4e86849eb302f8bcb2b5ce2efa9690f5415d52d
    2b22f7c6ab7e9dce334aa219cd1b07f4fadab1679f5f39a0da5631e2ee0bc0fa
    ca375937f6e3ad0a69f7418e479ebbb4e488bc26e8b8547df59f2196d5c30c20
    c63e9df4b593b3445253b48fe6d386cfcba6123737d54469d7da5b46786004e7
    b514cf5d6a8c35fc2b43fcac01f54145c75650784d6791835aadb596c033eb69
)

pkgver() {
  cd sensh
  git describe --tags | sed 's/-rc/rc/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd sensh

  git apply ../noshared.patch
}

build() {
  arch-meson sensh/fastrpc build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install --no-rebuild -C build

  # Allow access for FastRPC node for FastRPC user/group
  install -Dm 644 "$srcdir"/10-fastrpc.rules -t "$pkgdir"/usr/lib/udev/rules.d/

  install -Dm755 "$srcdir"/$pkgname-adsp-rootpd.service "$pkgdir"/usr/lib/systemd/system/$pkgname-adsp-rootpd.service
  install -Dm755 "$srcdir"/$pkgname-adsp-sensorspd.service "$pkgdir"/usr/lib/systemd/system/$pkgname-adsp-sensorspd.service
  install -Dm755 "$srcdir"/$pkgname-sdsp.service "$pkgdir"/usr/lib/systemd/system/$pkgname-sdsp.service
}

install=$pkgname.install
