# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname='gitea'
pkgname=gitea-git
pkgver=v1.6.0_rc1_103_gd487a76ee284
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
        gitea-repos.patch
        gitea-ldflags.patch
        gitea-disable-u2f.patch)
sha512sums=('SKIP'
            '0c58381f38fff0d029fd1b32f65536a7f96d0daa4aa1ee7c1c483f818c822c0088bfa980991800775eaece272e9d995faf5cadb7cfe648c75b6da579f38f3ed6'
            '6487cd8a5de45e68bc842979197c442d1cbd8c79cf6781431e8965a2ef89cccadc20f75f3ee2e3403707ddb9f801ec782dec360fabc9d9dfc2ce2b1edd76482a'
            '7bed1338af9d44de55964b9cf98816109da45a43c07b3260f51b7d517cf2e2d0c496c8ba5df44d57c9a8aa6aea18614a619ea14600a8f62d72c79485a74e6ab0'
            '8d3024a17c8faae80b2af349457701c45695f70e2e5c5bf43f33c277bde8241f5e01ee08c534902fd5be976b49d85d0112bda7a2e6fb940179a99029d9e404fb'
            '779869c10bcb37581cde6df38f0905618099d604f29b0281abc4fa4c2302b8063063d0e8b0efdd99897b127c45103d376ba4a121e66edd51944abaf0235ab834')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  cd ${srcdir}/${_pkgname}
  # Change default repos path for ArchLinux
  patch -Np1 -i ../../gitea-repos.patch
  # Fix LDFLAGS not being respected by Go
  patch -Np1 -i ../../gitea-ldflags.patch
  # https://github.com/go-gitea/gitea/issues/4692
  patch -Np1 -i ../../gitea-disable-u2f.patch

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
  install -D ${_pkgname}/custom/conf/app.ini.sample "${pkgdir}"/etc/gitea/app.ini
}

# vim: ts=2 sw=2 et:
