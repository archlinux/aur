# vim:set ts=2 sw=2 et:
# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>
# Maintainer: kousu <nick@kousu.ca>


pkgname=matterbridge-git
_pkgname=matterbridge
pkgver=v1.26.0.r172.gc22034e9
pkgrel=1
pkgdesc="A simple chat bridge. Bridges between a growing number of protocols."
arch=('x86_64')
url="https://github.com/matterbridge-org/matterbridge"
license=('AGPL-3.0-only')
depends=('libolm')
makedepends=('git' 'go')
provides=('matterbridge')
conflicts=('matterbridge')
backup=("etc/matterbridge/matterbridge.toml")
source=(
  "${_pkgname}::git+https://github.com/matterbridge-org/matterbridge"
  "matterbridge.service"
  "matterbridge@.service"
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
    -buildmode=pie \
    -ldflags "-linkmode external -extldflags '${EXTLDFLAGS}' -s -w ${LDFLAGS}"
}

package() {
  install -Dm755 "$_pkgname/matterbridge" "$pkgdir/usr/bin/matterbridge"
  install -Dm644 "$_pkgname/matterbridge.toml.simple" "$pkgdir/etc/matterbridge.toml"
  install -Dm644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$_pkgname/README"
  install -Dm644 "$_pkgname/matterbridge.toml.sample" "$pkgdir/usr/share/doc/$_pkgname/matterbridge.toml.sample"

  install -Dm644 "$srcdir/matterbridge.service" "$pkgdir/usr/lib/systemd/system/matterbridge.service"
  install -Dm644 "$srcdir/matterbridge@.service" "$pkgdir/usr/lib/systemd/system/matterbridge@.service"
}

sha256sums=('SKIP'
            '7fad1096d304a6d2b4711850e553416553c5928b792a3afe22b5cbdd873403ae'
            'd6fdc567b2161f6cbaec4ab668b03f58c928370ef9cb27c2a4116feacc3a335f')
