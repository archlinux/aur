# Maintainer: Matt Cuneo <m@cuneo.au>
_pkgname='matrix-authentication-service'
pkgname="$_pkgname-git"
pkgver=r2156.ba95dd02
pkgrel=1
pkgdesc='Authentication service for Matrix Synapse'
arch=('x86_64')
url="https://github.com/matrix-org/$_pkgname"
license=('AGPL3')
install="$_pkgname.install"
provides=('mas-cli')
depends=()
options=(!lto)
makedepends=(
  'nodejs'
  'rust'
  'opa'
  'npm'
)
source=(
  "$_pkgname::git+$url.git"
  sysusers.conf
  tmpfiles.conf
  systemd.service
  systemd-worker.service
)
b2sums=('SKIP'
        'e32a10d979cb385be8191ac29096ff25ea6233f693a5ec0aaf3eff76411aca4bd9298dfe36585da36f2128cf2f2e48878ffcf2c5a44452d86970e57ee77098d3'
        '42b3ab44075de968dd87668f54044e8215ceb57b77cac1b19b1f012afbc9d10352886c281fd539efa76d972fac1cb5478128240dc6e4565fe51c051d1dc79c84'
        'fd206cf9fbe26f3509053f3893066c6368024e8569194981085aff7bdbe65ecdcdd4384a5ba8119e1e6114eb576b9c683552c09f865f09e5171feecf3f0254f3'
        '39ba8399ca52b5bc5984f4fd426f812d6017a096368b3e63e16c0d9a0a2ec695b02b418b821adc62fb29609803355a1f673da3be7af5d9436e3c49e461d7d049')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$_pkgname"
  cd frontend
  npm ci
  npm run build
  cd ../policies
  make
  cd ..
  cargo build --release
}

package() {
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -vDm644 systemd-worker.service "$pkgdir/usr/lib/systemd/system/$_pkgname-worker.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  cd "$_pkgname"
  install -vd "$pkgdir/etc/$_pkgname"
  install -vd "$pkgdir/usr/share/$_pkgname/frontend"
  cp -R frontend/dist "$pkgdir/usr/share/$_pkgname/frontend"
  cp -R policies templates translations "$pkgdir/usr/share/$_pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/mas-cli
}
