# vim:set ts=2 sw=2 et:
# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=matterbridge-git
_pkgname=matterbridge
pkgver=v1.16.1.r3.ged5386c2
pkgrel=1
pkgdesc="A simple chat bridge. Bridges between a growing number of protocols."
arch=('x86_64')
url="https://github.com/42wim/matterbridge"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'go')
provides=('matterbridge')
conflicts=('matterbridge')
backup=("etc/matterbridge/matterbridge.toml")
source=(
  "${_pkgname}::git+https://github.com/42wim/matterbridge"
  "matterbridge.service"
)

pkgver() {
  cd "$_pkgname"
  git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/cache"
  cd "${srcdir}/${_pkgname}"
  # Respect LDFLAGS
  EXTLDFLAGS=${LDFLAGS}
  LDFLAGS="-X main.githash=`git log --pretty=format:'%h' -n 1`"
  GOCACHE="${srcdir}/cache" go build -x \
    -ldflags "-linkmode external -extldflags '${EXTLDFLAGS}' -s -w ${LDFLAGS}"
}

package() {
  install -Dm755 "$_pkgname/matterbridge" "$pkgdir/usr/bin/matterbridge"
  install -Dm644 "$_pkgname/matterbridge.toml.simple" "$pkgdir/etc/$_pkgname/matterbridge.toml"
  install -Dm644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$_pkgname/README"
  install -Dm644 "$_pkgname/matterbridge.toml.sample" "$pkgdir/usr/share/doc/$_pkgname/matterbridge.toml.sample"

  install -Dm640 "$srcdir/matterbridge.service" "$pkgdir/usr/lib/systemd/system/matterbridge.service"
}

sha256sums=('SKIP'
            '4ea133c37b088a69a1f33c68101d6815948c0537de04908c9ed8ed36ab947fdc')
