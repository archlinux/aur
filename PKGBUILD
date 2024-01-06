#Maintainer: Raihan Ahamed (raihan2000) <raihan1999ahamed@gmail.com>

pkgname=(hexagonrpcd)
pkgdesc="Qualcomm HexagonFS daemon"
pkgver=0.1.0.r0.g23b7681
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
    545d9db944cd3237fa3aec6de69837c7d5091d290092846e561b73529964d46f
    8034ebd8d4a7301d29ba7badbd87c165379272c8d99a32d75c68715cbceb9ff1
    67a474836f161055dedcaf99ecc32a9995127fce5ecca2d25d7b9d460cdf7413
)

pkgver() {
  cd sensh
  git describe --long --abbrev=7 --tags $_commit | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  echo -e 'g fastrpc\nu fastrpc - "Qualcomm HexagonFS service" /var/lib/fastrpc' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/fastrpc.conf"

  # Allow access for FastRPC node for FastRPC user/group
  install -Dm 644 "$srcdir"/10-fastrpc.rules -t "$pkgdir"/usr/lib/udev/rules.d/

  install -Dm755 "$srcdir"/$pkgname-adsp-rootpd.service "$pkgdir"/usr/lib/systemd/system/$pkgname-adsp-rootpd.service
  install -Dm755 "$srcdir"/$pkgname-adsp-sensorspd.service "$pkgdir"/usr/lib/systemd/system/$pkgname-adsp-sensorspd.service
  install -Dm755 "$srcdir"/$pkgname-sdsp.service "$pkgdir"/usr/lib/systemd/system/$pkgname-sdsp.service
}
