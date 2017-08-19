# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.1.3
pkgrel=1
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
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
sha512sums=('d5ba857ba2c36b4969a2fbd82ce4146f4853629a7ecb8067821455ed2dafd5d6e53e003e8fbf359f1ba709afd902c95600a5677bb9d88f49c77aaebc166bc82a'
            '692ea79b3195f3222f69b485f8a7905223fa457dc5cb2b480edbac6f480ac4f74075accb04ae0c17b90e98e41f53224e661a85762310d7263921e763cb3fc257'
            'f72a6ea944e9f6b55c33a1b8f7bf5ff3c2f6dd6e12e3ab0702c74ec2e4ce6c7190aaf97676c3408004089688b91ead04f8a8054906aa73ebf4034fbf0d9d1104')

prepare() {
  mkdir -p "${srcdir}/src/code.gitea.io"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/code.gitea.io/${pkgname}"
}

build() {
  cd ${srcdir}/src/code.gitea.io/${pkgname}
  GOPATH="${srcdir}" PATH="${PATH}:${GOPATH}/bin/" make DESTDIR="${pkgdir}" TAGS="sqlite tidb pam" clean generate build
}

package() {
  install -o git -g git -d -m 750 "${pkgdir}/var/lib/gitea/"
  install -o git -g git -d -m 750 "${pkgdir}/var/lib/gitea/"{repos,tmp,attachments,data,indexer,conf}
  install -o git -g git -d -m 750 "${pkgdir}/var/log/gitea/"
  install -o root -g git -d -m 775 "${pkgdir}/etc/gitea/"

  install -Dm755 "${srcdir}/src/code.gitea.io/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/gitea.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/src/code.gitea.io/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -o root -g git -Dm644 "${srcdir}/app.ini" "${pkgdir}/etc/gitea/app.ini"

  cp -r "${srcdir}/src/code.gitea.io/${pkgname}/"{templates,options,public} "${pkgdir}/var/lib/${pkgname}"
  cp -r "${srcdir}/src/code.gitea.io/${pkgname}/options/locale" "${pkgdir}/var/lib/${pkgname}/conf"
}
