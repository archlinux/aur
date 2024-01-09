# Maintainer: Matt Cuneo <m@cuneo.au>
_pkgname='matrix-authentication-service'
pkgname="$_pkgname-git"
pkgver=r2156.ba95dd02
pkgrel=3
pkgdesc='Authentication service for Matrix Synapse'
arch=('x86_64')
url="https://github.com/matrix-org/$_pkgname"
license=('AGPL3')
install="$_pkgname.install"
provides=('mas-cli')
depends=()
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
)
b2sums=('SKIP'
        'f6ffc73dfaca2ffdc3551071dfc31f94bae50393d9609bc4498901c87750560e31cf14bdeb00474d8bc51b175468501f3ad0f015ce242c5a4c571eb94ed9a851'
        '7fdd9c3762be351b9fa9948b247af9520b17bdcf8a92849a83479ca8f24dde3e56404eee24b9a05380491a63c4be55b0ceecdcc25e5de6febc5d1bce727df1ab'
        'bdcb4bd4b778c5959f36ccbc7fdb220f580acb04652221db0fca1ed11ed5f0e0d16fee05762375bbf118de12110e57dfb294541ef972a034819992993ad90488')
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
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  cd "$_pkgname"
  install -vd "$pkgdir/etc/$_pkgname"
  install -vd "$pkgdir/usr/share/$_pkgname/frontend"
  install -vd "$pkgdir/usr/share/$_pkgname/templates"
  install -vd "$pkgdir/usr/share/$_pkgname/translations"
  cp -R frontend/dist "$pkgdir/usr/share/$_pkgname/frontend"
  cp -R policies "$pkgdir/usr/share/$_pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/mas-cli
}
