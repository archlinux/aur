# Maintainer: hellopoisonx <x1665341912@gmail.com>
_pkg='clash-flutter'
pkgname="${_pkg}-git"
pkgver=1.0.0
pkgrel=4
pkgdesc='A Flutter based GUI for Clash.Meta kernel'
arch=('x86_64' 'aarch64')
url='https://github.com/hellopoisonx/clash-flutter'
license=('MIT')
conflicts=("$pkgname-bin" "$pkgname-alpha" "$pkgname-alpha-bin" "$pkgname-alpha-git" "clash-flutter")
depends=(
  'polkit'
  'zenity'
)
makedepends=('fvm' 'git' 'llvm' 'go')
provides=('clash-flutter')

source=(
  "clash-flutter::git+https://github.com/hellopoisonx/$_pkg"
  "Country.mmdb::https://github.com/Dreamacro/maxmind-geoip/releases/download/20240812/Country.mmdb"
)

install=.install

function build() {
  cd "${srcdir}/$_pkg/core" || exit
  git submodule init
  git submodule update
  cp -r desktop_bindings mihomo/
  cd mihomo/desktop_bindings || exit
  go env -w GOPROXY=https://goproxy.io,direct
  go build -buildmode=c-shared -o libclash-meta.so -tags with_gvisor ./main.go
  mkdir ../../../linux/lib
  mv libclash-meta.so ../../../linux/lib/
  mv libclash-meta.h ../../../linux/lib/
  cd ../../../ || exit
  fvm install
  fvm flutter pub get
  fvm dart run build_runner clean
  fvm dart run build_runner build
  fvm flutter build linux --release
  rm -rf core/mihomo/desktop_bindings
  rm -rf linux/lib
}

function package() {
  install -Dm644 "${srcdir}/Country.mmdb" "$pkgdir/etc/$_pkg/Country.mmdb"
  cd "$srcdir/$_pkg/build/linux/x64/release/bundle" || exit
  install -Dm755 "./clash_flutter" "${pkgdir}/usr/share/$_pkg/$_pkg"
  cp --reflink=auto -r lib/ "${pkgdir}/usr/share/$_pkg/"
  cp --reflink=auto -r data/ "${pkgdir}/usr/share/$_pkg/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sfr "$pkgdir/usr/share/$_pkg/$_pkg" "$pkgdir/usr/bin/$_pkg"
  install -Dm644 "${srcdir}/$_pkg/clash-flutter.desktop" "${pkgdir}/usr/share/applications/$_pkg.desktop"
  install -Dm644 "${srcdir}/$_pkg/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  chmod 777 "${pkgdir}/etc/clash-flutter"
  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$_pkg.conf" <<END
/usr/share/${_pkg}/lib
END
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

sha256sums=('SKIP'
  'c17e6a0592307461733a5938d920ecf13e10843a2f109eadc328215ff2518236')
