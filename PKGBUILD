# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname='gitea'
pkgname=gitea-git
pkgver=v1.6.0_rc1_180_gb3b7598ec684
pkgrel=1
pkgdesc='Painless self-hosted Git service. Community managed fork of Gogs.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://gitea.io/'
license=('MIT')
depends=('git')
makedepends=('go' 'go-bindata')
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
source=("git+https://github.com/go-gitea/gitea.git"
        gitea.tmpfiles
        gitea.service
        gitea.sysusers
        gitea-arch-defaults.patch
        gitea-ldflags.patch
        gitea-disable-u2f.patch)
sha512sums=('SKIP'
            '89bf119a91fd48ed35c06131c67de1b4300bd2e79522c47aee9a73d7f1ebb08d9bceadc37408bd2425475d92c8bf59d87a799f2ce0a46bee860bf9fc7a904103'
            '0b93ddbb88ff843014f583a36c00156c011cca568cb69b61eb4c576c557b21ecdab1b105815a5dfdd08349e4e3b0976c8bdf87c8d3b201edae95de9070200352'
            '77f672ed82bc8f78ca04b1e2b7c7d026cb897da6e4f057817adbe1242bf8a67875061553806e6b027cdb3266cdf217ee3993efd9242a66c5802ed34344b5ded1'
            '36abba7ed22a1ce59ab1005b988f177d8ab13101684237d515a80b12a082487f8643f6f36d15e0b0823949134cecc61bd523057e80a93cf4c98d2e5b5902d968'
            '8d3024a17c8faae80b2af349457701c45695f70e2e5c5bf43f33c277bde8241f5e01ee08c534902fd5be976b49d85d0112bda7a2e6fb940179a99029d9e404fb'
            '779869c10bcb37581cde6df38f0905618099d604f29b0281abc4fa4c2302b8063063d0e8b0efdd99897b127c45103d376ba4a121e66edd51944abaf0235ab834')
install=gitea.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  cd ${srcdir}/${_pkgname}
  # Change default repos path for ArchLinux
  patch -Np1 -i ../../gitea-arch-defaults.patch
  # Fix LDFLAGS not being respected by Go
  patch -Np1 -i ../../gitea-ldflags.patch
  # https://github.com/go-gitea/gitea/issues/4692
  patch -Np1 -i ../../gitea-disable-u2f.patch

  # Make sure we rebuild the mod file from Gopkg.toml to pick up any changes.
  rm -f go.mod
  go mod init || true
}

build() {
  cd ${srcdir}/${_pkgname}
  make generate
  EXTRA_GOFLAGS="-gcflags all=-trimpath=${srcdir}/${_pkgname} -asmflags all=-trimpath=${srcdir}/${_pkgname}" \
  make GOFLAGS="-v" TAGS="bindata sqlite pam" build
}

package() {
  install -Dm755 ${_pkgname}/${_pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${_pkgname}/
  install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
  install -D ${_pkgname}/custom/conf/app.ini.sample "${pkgdir}"/etc/gitea/app.ini
}

# vim: ts=2 sw=2 et:
