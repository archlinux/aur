# Maintainer: kageru <kageru@encode.moe>
# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname='gitea'
pkgname=gitea-git
pkgver=v1.19.0_dev_286_g477a1cc40e
pkgrel=1
pkgdesc='Painless self-hosted Git service. Community managed fork of Gogs.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://gitea.io/'
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
backup=('etc/gitea/app.ini')
options=(!lto)
conflicts=('gitea')
provides=('gitea')
source=(
    git+https://github.com/go-gitea/gitea.git#branch=main
    gitea.tmpfiles
    gitea.service
    gitea.sysusers
    app.ini
)
sha512sums=(
    'SKIP'
    '89bf119a91fd48ed35c06131c67de1b4300bd2e79522c47aee9a73d7f1ebb08d9bceadc37408bd2425475d92c8bf59d87a799f2ce0a46bee860bf9fc7a904103'
    'd65e053a98976423c6c1f3a4b6b0fd40f51e50a32d7afc651fc02414bb9f3bf574a58cc6a8c96760b85ab9f4f2bfcd0884bd7e9edcc2d71f07e7c1a548783c4c'
    '77f672ed82bc8f78ca04b1e2b7c7d026cb897da6e4f057817adbe1242bf8a67875061553806e6b027cdb3266cdf217ee3993efd9242a66c5802ed34344b5ded1'
    '704930578fe4231c45bcfdcc65df5d4f523b96909e670cc6e4f098770043b0f47fe5d90621788bc6ba300b0f19909a203068d2a1c142e7c5d29dc03a0dc5fc1d'
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
  export LDFLAGS="-X 'code.gitea.io/gitea/modules/setting.AppWorkPath=/var/lib/gitea/'"
  export EXTRA_GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export TAGS="bindata sqlite sqlite_unlock_notify pam"
  make -j1 # building in parallel breaks the bindata target which relies on execution order
}

package() {
  install -Dm755 ${_pkgname}/${_pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
  install -Dm644 app.ini "${pkgdir}"/etc/gitea/app.ini
}

# vim: ts=2 sw=2 et:
