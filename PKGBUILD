# Maintainer: Maximilian Friedersdorff <max@friedersdorff.com>
# Contributor: kageru <kageru@encode.moe>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname='forgejo'
pkgname=forgejo-git
pkgver=v1.19.0_dev_209_g158e78f98e
pkgrel=2
pkgdesc='Self-hosted, lightweight software forge. A "soft" fork of Gitea.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://forgejo.org'
license=('MIT')
depends=('git')
makedepends=('go' 'npm')
optdepends=(
    'mariadb: MariaDB support'
    'memcached: MemCached support'
    'openssh: GIT over SSH support'
    'pam: Authentication via PAM support'
    'postgresql: PostgreSQL support'
    'redis: Redis support'
    'sqlite: SQLite support'
)
backup=('etc/forgejo/app.ini')
conflicts=('forgejo')
provides=('forgejo')
source=(
    git+https://codeberg.org/forgejo/forgejo#branch=forgejo
    forgejo.tmpfiles
    forgejo.service
    forgejo.sysusers
    app.ini
)
sha512sums=(
    'SKIP'
    '9a3aa163892eaa889e74d066db9d620db098535b08fa51df689e7aa5885393a14b820308364196db54d7ce502791ea56b662d8aede17fad99f8f62d1a3ca6776'
    'ac8bbe3c13ff5d544499d3b1c6291348712aea20d0a56906691f47e8df4cbe7cde22e2a2f02c927fa106f597db4ca0fc0db69dda51f2ad86eff1ffd2da978d35'
    '74d9eb51eec3d614f68744df47cc1a1c6ddfdc8fbfdcb20ecffc7e4105e20055ddcd8dd29eb39a79177bf712708c9e15bcfc1b89c3920ec1579b7bf50f98b7b5'
    '582cbd9deceb039e169d5a701831f4eb9fe07004ae485642f7038e931799596e01efd37c086ff15d80118e44ff72ab539efa847f8fb2556850cadf3877e28f8f'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  cd ${srcdir}/${_pkgname}
  # Be nice to people with read-only home
  GOCACHE="${srcdir}/cache" make vendor
}

build() {
  cd ${srcdir}/${_pkgname}
  # Again, be nice to people with read-only home
  export GOCACHE="${srcdir}/cache"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export LDFLAGS="-X 'code.gitea.io/gitea/modules/setting.AppWorkPath=/var/lib/forgejo/'"
  export EXTRA_GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export TAGS="bindata sqlite sqlite_unlock_notify pam"
  make -j1 # building in parallel breaks the bindata target which relies on execution order
}

package() {
  install -Dm755 ${_pkgname}/gitea "${pkgdir}"/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
  install -Dm644 app.ini "${pkgdir}"/etc/${_pkgname}/app.ini
}

# vim: ts=2 sw=2 et:
