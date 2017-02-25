# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gitea
_gourl="code.gitea.io"
pkgname=gitea-git
pkgver=r4990.80f900eb
pkgrel=1
pkgdesc='A painless self-hosted Git service.'
url='https://gitea.io/'
license=('MIT')
source=('git://github.com/go-gitea/gitea.git'
        'gitea.service.patch'
        'app.ini')
sha256sums=('SKIP'
            'f7b570315bd98a4e2d1c82ebdc2e78d76f6df49286ca4ac59cfb2b3f9985d1f9'
            '6ec975577a54e68d05a9292230c1aee19358459366688819cec4445e8d3c5210')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('go')
makedepends=('patch' 'git' 'go-bindata')
optdepends=('mariadb: MariaDB database support'
            'postgresql: PostgreSQL database support'
            'sqlite: SQLite database support'
            'redis: Redis session support'
            'memcached: MemCached session support'
            'openssh: Git over SSH support')
install=gitea.install
backup=("var/lib/gitea/custom/conf/app.ini")
conflicts=('gitea')
options=('!strip' 'emptydirs')
provides=('gitea')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}/${_pkgname}"
  cp -r "${srcdir}/gitea" "${srcdir}/src/${_gourl}"

  # patch
  msg2 "Patch gitea.service"
  patch -Np1 -i "${srcdir}/gitea.service.patch" "${srcdir}/src/${_gourl}/${_pkgname}/scripts/systemd/gitea.service"
}

build() {
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" make DESTDIR="$pkgdir/" TAGS="sqlite tidb pam" clean generate build
}

package() {
  install -dm755 ${pkgdir}/var/lib/${_pkgname}/{custom/conf,conf,data/{attachments,avatars,sessions,tmp},options,repo}
  install -dm755 ${pkgdir}/var/log/gitea
  install -Dm755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/src/${_gourl}/${_pkgname}/scripts/systemd/gitea.service" "${pkgdir}/usr/lib/systemd/system/gitea.service"
  install -Dm644 "${srcdir}/app.ini" "${pkgdir}/var/lib/${_pkgname}/custom/conf/app.ini"
  cp -r ${srcdir}/src/${_gourl}/${_pkgname}/{conf,templates,options,public} ${pkgdir}/var/lib/${_pkgname}
  cp -r ${srcdir}/src/${_gourl}/${_pkgname}/options/locale ${pkgdir}/var/lib/${_pkgname}/conf
}
