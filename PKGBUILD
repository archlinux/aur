# Maintainer: Modelmat <modelmat@outlook.com.au>

# Usage:
#  This package provides a configuration file in /etc/psiphon.conf
#  as well as systemd user service, `psiphon.service`. The service
#  will crash (probably a bug) as the `DataStoreDirectory` option
#  is empty.
#
#  However, if it is not set it will store temporary files in the
#  current working directory, which will fail for a user-service
#  (does not have write permissions for its directory). Hence, it
#  it advised that you set it to a writeable directory.
#
#  If it is necessary to have per-user configuration files, it is
#  advised to create them in `~/.config/systemd/user/` to override
#  the system-wide user service. 
#
#  This application also installs `/usr/bin/psiphon-tunnel-core`.

_pkgname=psiphon-tunnel-core
pkgname="$_pkgname-git"
pkgver=2.0.14.r3354.08f530bd
pkgrel=3
pkgdesc='Psiphon Tunnelling Proxy'
arch=('x86_64')
url="https://github.com/Psiphon-Labs/psiphon-tunnel-core"
license=('GPL')
makedepends=('go-pie' 'perl' 'docker' 'git')
depends=('glibc')
source=("git+$url.git"
        "psiphon.conf"
        "psiphon.service"
         "Dockerfile.patch")
backup=('etc/psiphon.conf' 'usr/lib/systemd/user/psiphon.service')
md5sums=('SKIP'
         'c1ec9a446e89495501b8375d2682aa49'
         'a6d6b01633a39325abbdb3597c50a4cc'
         '2a2474d64b2c4de819976b5f6bfa5c0f')

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

prepare(){
    if ! groups ${USER} | grep &>/dev/null '\bdocker\b'; then
      >&2 echo "The user ${USER} does not belong to the docker group. Please add it."
      exit 1
    fi

    if ! systemctl is-active docker | grep &>/dev/null '\bactive\b'; then
      >&2 echo "Docker service is not started. Please start it."
      exit 1
    fi
    patch --forward --strip=1 --input="Dockerfile.patch"
}

build() {
  cd "$_pkgname/ConsoleClient"

  docker build --no-cache=true -t psiclient \
  --build-arg USER_ID=$(id -u) \
  --build-arg GROUP_ID=$(id -g) \
  --build-arg USERNAME=$USER .
  docker images
  cd .. && \
  docker run \
  --rm \
  -v $PWD:/go/src/github.com/Psiphon-Labs/psiphon-tunnel-core \
  psiclient \
  /bin/bash -c './make.bash linux 64' \
  ; cd -
}

package() {
  cd "$_pkgname/ConsoleClient/bin/linux/"
  install -Dm755 ${_pkgname}-x86_64 "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$srcdir/psiphon.conf" "$pkgdir/etc/psiphon.conf"
  install -Dm644 "$srcdir/psiphon.service" "$pkgdir/usr/lib/systemd/user/psiphon.service"
}
