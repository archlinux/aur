# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_pkgname=moonfire-nvr
pkgname=moonfire-nvr-git
pkgver=r302.35e6891
pkgrel=2
pkgdesc='Security camera network video recorder'
arch=('x86_64')
url=https://github.com/scottlamb/moonfire-nvr
license=('GPL3')
depends=('ffmpeg' 'gcc-libs' 'ncurses' 'nodejs' 'sqlite')
makedepends=('git' 'rust' 'yarn')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("git+$url.git"
        'moonfire-nvr.service'
        'moonfire-nvr.sysusers.conf')
sha512sums=('SKIP'
            '0214fe2f816456d85a8b2a4366feb8b22b61af8845fc4fcd90d6eb17151482bf07e890dd939d64960dd0f6dbe1c6c615d81efe68a738df40edd0007ea3c1df16'
            '4e5be3c260bea782e2a4b226a1a375f97e9fd2e8ec0c1f4dc32176681b50db7fc17bacb77c5f2b8ae3d49f3d400ccbda3ad25dc32832e8042807e2d61fe3f15d')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  yarn
  yarn build
  cargo build --release
}

package() {
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system $_pkgname.service
  install -Dm644 $_pkgname.sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf

  cd $_pkgname
  install -Dt "$pkgdir"/usr/bin target/release/$_pkgname
  mkdir -p "$pkgdir"/usr/lib/moonfire-nvr
  cp -R ui-dist "$pkgdir"/usr/lib/moonfire-nvr/ui
}

# vim:set ts=2 sw=2 et:
