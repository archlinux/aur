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
pkgver=r5939.b6d2243ac
pkgdesc="A painless self-hosted Git service."
url="https://gitea.io/"
license=("MIT")
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=("git")
makedepends=("go")
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
conflicts=("gitea")
provides=("gitea")
options=("!strip" "emptydirs")
backup=("etc/gitea/app.ini")
install=gitea.install
source=("git://github.com/go-gitea/gitea.git"
        "01-adjust-config.patch"
        "02-adjust-service.patch")
sha512sums=('SKIP'
            '5d1c61eb21315887a5362ac061ce600c42aa915136c7261ac1748eacb6f0ff53bd668e1626d9e3b98b7b32741f21ee71101bd024b73d999725b208164cc28e82'
            '24c0a5701562503d96ea09c7a6cd9db1a7a2140c1daa5ebb1b1e7b7e52387551e81601a867b3f726570aea815f1d8b84ade50230268b5420f036760981e13ccf')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i -e "s/\"main.Version.*$/\"main.Version=$(pkgver)\"/" "${srcdir}/${_pkgname}/Makefile"
  patch -Np1 -i "${srcdir}/01-adjust-config.patch" "${srcdir}/${_pkgname}/custom/conf/app.ini.sample"
  patch -Np1 -i "${srcdir}/02-adjust-service.patch" "${srcdir}/${_pkgname}/contrib/systemd/${_pkgname}.service"

  mkdir -p "${srcdir}/src/${_gourl}/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${srcdir}/src/${_gourl}"
}

build() {
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  GOPATH="${srcdir}" go get -v -u github.com/go-macaron/bindata
  PATH="${srcdir}/bin:$PATH" GOPATH="${srcdir}" make DESTDIR="${pkgdir}/" TAGS="bindata sqlite tidb pam" clean generate build
}

package() {
  install -dm0700 "${pkgdir}/var/log/${_pkgname}/"
  install -dm0700 "${pkgdir}/var/lib/${_pkgname}/"
  install -dm0755 "${pkgdir}/usr/share/${_pkgname}/"

  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/custom" "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/public" "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/templates" "${pkgdir}/usr/share/${_pkgname}"

  install -Dm0755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 "${srcdir}/src/${_gourl}/${_pkgname}/custom/conf/app.ini.sample" "${pkgdir}/etc/${_pkgname}/app.ini"
  install -Dm0644 "${srcdir}/src/${_gourl}/${_pkgname}/contrib/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm0644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
