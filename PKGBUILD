pkgname='webvirt-react-git'
pkgver=1.0.0.r1.g6cbf3c1
pkgrel=1
pkgdesc='React web front-end to webvirt_api'
license=('Apache')
url='https://github.com/kevr/webvirt_react'

arch=('any')
depends=(
  'webvirt-api'
  'nginx'
)
makedepends=('nodejs')
provides=('webvirt-react')
conflicts=('webvirt-react')

install='webvirt-react-git.install'

source=(
  "${pkgname}::git+https://github.com/kevr/webvirt_react"
  'Config.json.patch'
)
sha256sums=(
  'SKIP'
  '6baf5067cff704dee99c010b5086d74c8eba2bac4714068269fd113d3a8ec36f'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  patch -p1 < "$srcdir/Config.json.patch"
}

build() {
  cd "$pkgname"
  npm install
  npm run build
}

package()
{
  cd "$pkgname"
  install -Dm644 res/nginx.conf "$pkgdir"/var/lib/webvirt_react/nginx.conf
  install -Dm644 res/webvirt.service "$pkgdir"/usr/lib/systemd/system/webvirt.service

  cd build
  find . -type f -exec install -vDm644 {} "$pkgdir"/usr/share/webvirt_react/{} \;
}
