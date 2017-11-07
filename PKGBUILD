# Maintainer: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Francois Menning <f.menning@protonmail.com>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname="gitea"
_gourl="code.gitea.io"

pkgname=gitea-git
pkgrel=1
pkgver=v1.1.0.r731.g61f5c225
pkgdesc="A painless self-hosted Git service."
url="https://gitea.io/"
license=("MIT")
arch=("i686" "x86_64" "armv6h" "armv7h")
depends=("git")
makedepends=("go")
optdepends=("sqlite: SQLite support"
            "mariadb: MariaDB support"
            "postgresql: PostgreSQL support"
            "mssql-server: MSSQL support"
            "redis: Redis support"
            "memcached: MemCached support"
            "openssh: GIT over SSH support"
            "pam: Authentication via PAM support")
conflicts=("gitea")
provides=("gitea")
options=("!strip" "emptydirs")
backup=("etc/gitea/app.ini")
install=gitea.install
source=("git://github.com/go-gitea/gitea.git"
        "0001-Adjust-config-for-Arch-Linux-package.patch"
        "0002-Adjust-service-file-for-Arch-Linux-package.patch")
sha256sums=('SKIP'
            '188f18acceb6342208502f808b07cf8b7e8f594f6b9d4f27bc5f02780a914840'
            '6cd1daa666659a68c98376f8bfae55402b5ffc39c1bf42b5ae0ee700249a3b73')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${srcdir}/src/${_gourl}"

  msg2 "Patch config and service file"
  patch -Np1 -i "${srcdir}/0001-Adjust-config-for-Arch-Linux-package.patch" "${srcdir}/src/${_gourl}/${_pkgname}/conf/app.ini"
  patch -Np1 -i "${srcdir}/0002-Adjust-service-file-for-Arch-Linux-package.patch" "${srcdir}/src/${_gourl}/${_pkgname}/contrib/systemd/${_pkgname}.service"
}

build() {
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  GOPATH="${srcdir}" go get -v -u github.com/go-macaron/bindata
  PATH="${srcdir}/bin:$PATH" GOPATH="${srcdir}" make DESTDIR="${pkgdir}/" TAGS="bindata sqlite tidb pam" clean generate build
}

package() {
  install -Dm0755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm0700 "${pkgdir}/var/log/${_pkgname}/"
  install -dm0700 "${pkgdir}/var/lib/${_pkgname}/"

  install -dm0755 "${pkgdir}/usr/share/${_pkgname}/"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/conf" "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/public" "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/templates" "${pkgdir}/usr/share/${_pkgname}"

  install -Dm0644 "${pkgdir}/usr/share/${_pkgname}/conf/app.ini" "${pkgdir}/etc/${_pkgname}/app.ini"
  install -Dm0644 "${srcdir}/src/${_gourl}/${_pkgname}/contrib/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm0644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
