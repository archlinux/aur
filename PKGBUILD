# Maintainer: graysky <graysky AT proton DOT me>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>
# Contributor: Akshay S Dinesh <asdofindia at gmail dot com>

pkgname=caddy-ratelimit
_pkgname=caddy
pkgver=2.11.4
pkgrel=1
pkgdesc='Fast web server with automatic HTTPS with ratelimit support'
arch=(x86_64)
url='https://github.com/caddyserver/caddy'
license=(Apache-2.0)
depends=(
  glibc
  mailcap
)
makedepends=(
  git
  go
  xcaddy
)
backup=(etc/caddy/Caddyfile)
options=(!lto)
provides=(caddy)
conflicts=(caddy)
source=(
  "git+https://github.com/caddyserver/caddy.git#tag=v${pkgver}"
  "caddy-dist::git+https://github.com/caddyserver/dist.git#tag=v${pkgver}"
  caddy.service
  caddy-api.service
  caddy.tmpfiles
  caddy.sysusers
  Caddyfile
  use-data-dir-for-autosave.patch
  "$_pkgname-disable-executable-altering-commands.patch::https://src.fedoraproject.org/rpms/caddy/raw/rawhide/f/0001-Disable-commands-that-can-alter-the-binary.patch"
)
sha512sums=('43f5f0a48ec97be1a4ab7a1f0beca32c373134066611d2caacb935dd6865f3c367b0092a90021ca8d6c6629baab5b3d7c21898a6772573e30c52621310ba586c'
            '053b0a8d5311c8e0c6e40786b87e73e2e1205757cff3aa8aff6d22fad8cceb4f9acff7b66e5a29ab1ea624085dd41140c92693b887fd9a890e97a479e1f846fb'
            'e6cdf5f81af01d0a6290ef9503d0bd90244684a6305e5638f079c234b2bc6454688daea3ea9d1b6a6f00eeba0375e9c4372e64c5cb49b5d1206384d2a7201273'
            '6c9d5dce22f1f0f4e222d4adeccd93c486b3be2ac221a7f8a58933b22ce91fe3da8ad38e6db7212846e4ab6336ebc058df16215a43636b965dfed469b3aaa2f6'
            '55ee8d3f8b14f9adddc7a1026addcea4f85b4bae4cd512fd4da2a5e8adaae4b6fd0f486d2e3847f75518f4710a897b4fca84e48ee15700b968bad762125c4742'
            'b24ff0fc8df05ac92ba6860ce1b9975ecce48492b08c1b03545e7b20d2956f130cdee215fc78c751f9ab4869008e2b9bf7f861311fe16c8f5a85a42e347337c6'
            '4be1ed23e6600d8072c7f4fabd2bd926708502a55d84ae4f62aff9885c7b8e45ad0554503d0fc796338577adfca9e467c468a82ba56ffd69e4ec2778d69bc198'
            '563d6b45e91fc584fb5a27caaa382f59c140cb0a1b28b8d8faced4f7c7cad86d8671eb6ac10056f41518a842c8f606130d7e0c71df2b731d5eb0b4c868ea5d41'
            '42384fa3314e367c4d7ac3e07af66cf7000f68b6d6354183c5ee1579bd46ea6a29edfa84f9cdf5084d99d74af50ea5b14e3979d38ff806232756991bcac2e8db')
validpgpkeys=(
  29D0817A67156E4F25DC24782A349DD577D586A5 # Matthew Holt <mholt@users.noreply.github.com>
)

prepare() {
  # welcome page
  sed 's|/var/www/html|/srv/http|g' -i caddy-dist/welcome/index.html

  cd ${_pkgname}
  # do not write in /etc
  patch -Np1 < ../use-data-dir-for-autosave.patch
  # disable commands that bypass the package manager
  patch -Np1 < ../$_pkgname-disable-executable-altering-commands.patch
}

build() {
  cd ${_pkgname}
  export CGO_LDFLAGS=${LDFLAGS}
  export CGO_CPPFLAGS=${CPPFLAGS}
  export CGO_CFLAGS=${CFLAGS}
  export CGO_CXXFLAGS=${CXXFLAGS}
  export GOFLAGS="-buildmode=pie -buildvcs=false -mod=mod"
  export GONOSUMDB="*"
  export GONOSUMCHECK="*"
  export GOPATH="$srcdir"

  xcaddy build "v${pkgver}" \
    --with "github.com/caddyserver/caddy/v2=$srcdir/${_pkgname}" \
    --with github.com/mholt/caddy-ratelimit \
    --output "$srcdir/${_pkgname}/build/caddy"

  for i in zsh bash fish; do
    ./build/caddy completion $i > caddy.$i
  done
}

check() {
  cd ${_pkgname}
  go test -short ./...
  version=$(./build/caddy version)
  echo "Caddy version: ${version}"
  # if [[ $version != v$pkgver ]]; then
  if [[ $version != *"v$pkgver"* ]]; then
    exit 1
  fi
}

package() {
  install -vDm 644 -t "${pkgdir}/usr/share/caddy" caddy-dist/welcome/index.html

  install -vDm 644 -t "${pkgdir}/usr/lib/systemd/system" caddy.service caddy-api.service
  install -vDm 644 caddy.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
  install -vDm 644 caddy.sysusers "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

  install -vDm 644 -t "${pkgdir}/etc/caddy" Caddyfile
  install -vd "${pkgdir}/etc/caddy/conf.d"

  install -vDm 644 caddy/caddy.zsh "${pkgdir}/usr/share/zsh/site-functions/_caddy"
  install -vDm 644 caddy/caddy.bash "${pkgdir}/usr/share/bash-completion/completions/caddy"
  install -vDm 644 caddy/caddy.fish "${pkgdir}/usr/share/fish/vendor_completions.d/caddy.fish"

  install -vDm 755 -t "${pkgdir}/usr/bin" ${_pkgname}/build/caddy
}

# vim: ts=2 sw=2 et:
