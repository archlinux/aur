# Maintainer: DanielNak <daniel@tee.cat>
# Contributor: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>

_pkgname=docker-credential-helpers
_author=docker
pkgname=docker-credential-secretservice
pkgver=0.8.1.r0.g292722b
pkgrel=1
pkgdesc="Store docker credentials using the D-Bus Secret Service"
arch=(x86_64 i686 aarch64)
url="https://github.com/docker/docker-credential-helpers"
url="https://github.com/$_author/$_pkgname"
license=('MIT')
depends=('libsecret')
makedepends=('git' 'go')
source=("git+${url}")
b2sums=('SKIP')

# If project uses github releases:
prepare() {
  cd "$_pkgname"
  git checkout $(curl -s https://api.github.com/repos/$_author/$_pkgname/releases | grep tag_name | cut -d '"' -f4 | head -n 1)
}

pkgver() {
  cd "$_pkgname"
  (set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-v -buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make secretservice
}

package() {
  cd "$_pkgname"
  install -Dm755 bin/build/docker-credential-secretservice "$pkgdir/usr/bin/docker-credential-secretservice"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  echo "Remember to add the following to $HOME/.docker/config.json :"
  echo '
{
  "credsStore": "osxkeychain"
}
'
  echo "Refer to https://docs.docker.com/engine/reference/commandline/login/#credentials-store for more information"
}

# vim:set ts=2 sw=2 et:
