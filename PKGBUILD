# Maintainer: RXTX4816

pkgname=cockpit-dockermanager-git
_pkgname=cockpit-dockermanager
pkgver=1.0.8.r26.g435f014
pkgrel=1
pkgdesc="Cockpit application for managing Docker containers (git)"
arch=('any')
url="https://github.com/chrisjbawden/cockpit-dockermanager"
license=('MIT')
depends=('cockpit' 'docker')
makedepends=('git')
provides=('cockpit-dockermanager')
conflicts=('cockpit-dockermanager')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local tag count hash
  tag=$(git tag --list 'v[0-9]*' --sort=-v:refname | grep -Ev '(canary|latest)' | head -n1)
  hash=$(git rev-parse --short=7 HEAD)

  if [[ -n "$tag" ]]; then
    count=$(git rev-list --count "${tag}"..HEAD)
    printf '%s.r%s.g%s\n' "${tag#v}" "$count" "$hash"
  else
    printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$hash"
  fi
}

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "$pkgdir/usr/share/cockpit/dockermanager"
  install -m644 dockermanager/index.html    "$pkgdir/usr/share/cockpit/dockermanager/index.html"
  install -m644 dockermanager/app.js        "$pkgdir/usr/share/cockpit/dockermanager/app.js"
  install -m644 dockermanager/style.css     "$pkgdir/usr/share/cockpit/dockermanager/style.css"
  install -m644 dockermanager/manifest.json "$pkgdir/usr/share/cockpit/dockermanager/manifest.json"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
