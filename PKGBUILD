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
pkgver=v1.14.0_dev_415_g4aabbacdfe
pkgrel=1
pkgdesc='Painless self-hosted Git service. Community managed fork of Gogs.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://gitea.io/'
license=('MIT')
depends=('git')
makedepends=('go-pie' 'npm')
optdepends=('mariadb: MariaDB support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support'
            'pam: Authentication via PAM support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'sqlite: SQLite support')
backup=('etc/gitea/app.ini')
conflicts=('gitea')
provides=('gitea')
source=(git+https://github.com/go-gitea/gitea.git
        gitea.tmpfiles
        gitea.service
        gitea.sysusers
        gitea-arch-defaults.patch)
sha512sums=('SKIP'
            '89bf119a91fd48ed35c06131c67de1b4300bd2e79522c47aee9a73d7f1ebb08d9bceadc37408bd2425475d92c8bf59d87a799f2ce0a46bee860bf9fc7a904103'
            '0b93ddbb88ff843014f583a36c00156c011cca568cb69b61eb4c576c557b21ecdab1b105815a5dfdd08349e4e3b0976c8bdf87c8d3b201edae95de9070200352'
            '77f672ed82bc8f78ca04b1e2b7c7d026cb897da6e4f057817adbe1242bf8a67875061553806e6b027cdb3266cdf217ee3993efd9242a66c5802ed34344b5ded1'
            'e498110c830e6a93fb2a003a4bfef376d30646a7589248ea04531f6cc27dae5d2a2e41ffa6153d2b30b63dcf4be729a14f18cf12dcdf521c170870eec65ba8da')
install=gitea.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  cd ${srcdir}/${_pkgname}
  # Change default repos path for ArchLinux and some additional settings
  patch -Np1 -i ../gitea-arch-defaults.patch

  # Be nice to people with read-only home
  GOCACHE="${srcdir}/cache" make vendor
}

build() {
  # Again, be nice to people with read-only home
  export GOCACHE="${srcdir}/cache"
  cd ${srcdir}/${_pkgname}
  make generate
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  LDFLAGS="-linkmode external -extldflags \"${LDFLAGS}\" -X \"code.gitea.io/gitea/modules/setting.AppWorkPath=/var/lib/gitea/\""
  make TAGS="sqlite pam" EXTRA_GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw" build
}

package() {
  install -Dm755 ${_pkgname}/${_pkgname} -t "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/${_pkgname}/
  cp -dr --no-preserve=ownership ${_pkgname}/{options,public,templates} "${pkgdir}"/usr/share/${_pkgname}/
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
  install -D ${_pkgname}/custom/conf/app.example.ini "${pkgdir}"/etc/gitea/app.ini
}

# vim: ts=2 sw=2 et:
