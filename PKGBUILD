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
pkgver=r5946.9a0e2a8b0
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
            '43818244bdc615ed4bb6ea9128a81839fafb1ff63e4fa15f8a4ded8c53fd21172c508442598ec6962749fed0dcd1bca5c9d59d20a94e21cfae92e97eebf9ecbd'
            'd501e9422cbdcec11a0455cd1243a28bb134727e759e04f619938b739fc8e58f5860d6622f13b9f9d82dc7cfee4ca5f4fcb6f1fd9a7bd68b4ee8b357dcdc6bee')

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
