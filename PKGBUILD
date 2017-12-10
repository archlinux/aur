# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.3.1
pkgrel=1
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://gitea.io'
license=('MIT')
makedepends=('go' 'git')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
conflicts=('gitea-git' 'gitea-git-dev')
backup=('etc/gitea/app.ini')
install=gitea.install
source=(https://github.com/go-gitea/gitea/archive/v${pkgver}.tar.gz
        gitea.service
        app.ini)
sha512sums=('45161e089d5437b5aacc9589a50a61da3a8f4c88edb33fe3605eb49f36f67cb0a8a80f261016745a6c5131755f7963b1b61df62e47aab2bcd43a6932dceadd0f'
            '90c034a73ea192dd18a423608ddc6b4237e530326d70a1055072ba766d4dca323ec877632a7425b6c3be93f1f7acdce81e6a21c9df9e0c06c1ffea6aeea3e4e9'
            '1c5c61259cabfb6f3ef41298ec964102d1062692a3d2c24916e7034df1b9d0aadcccb24c7032d6a0cd889ef49236edca38f185726f2df45b2b9621f5e94c3b96')

prepare() {
  mkdir -p "${srcdir}/src/code.gitea.io"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/code.gitea.io/${pkgname}"
  sed -i -e "s/\"main.Version.*$/\"main.Version=${pkgver}\"/" "${srcdir}/${pkgname}-${pkgver}/Makefile"
}

build() {
  cd ${srcdir}/src/code.gitea.io/${pkgname}
  GOPATH="${srcdir}" PATH="${PATH}:${GOPATH}/bin/" make DESTDIR="${pkgdir}" TAGS="sqlite tidb pam" clean generate build
}

package() {
  # the ownership is managed in the install script
  install -dm 750 "${pkgdir}/var/lib/gitea/"
  install -dm 750 "${pkgdir}/var/lib/gitea/"{repos,tmp,attachments,data,indexer,conf}
  install -dm 750 "${pkgdir}/var/log/gitea/"
  install -dm 775 "${pkgdir}/etc/gitea/"

  install -Dm755 "${srcdir}/src/code.gitea.io/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/gitea.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/src/code.gitea.io/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm664 "${srcdir}/app.ini" "${pkgdir}/etc/gitea/app.ini"

  cp -r "${srcdir}/src/code.gitea.io/${pkgname}/"{templates,options,public} "${pkgdir}/var/lib/${pkgname}"
  cp -r "${srcdir}/src/code.gitea.io/${pkgname}/options/locale" "${pkgdir}/var/lib/${pkgname}/conf"
}
