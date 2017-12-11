# Maintainer: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Francois Menning <f.menning@protonmail.com>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname="gitea"
_gourl="code.gitea.io"

pkgname=gitea-git
pkgrel=3
pkgver=r5927.3b525d56
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
            'd80d9bb906337d89f09edfc4e958ee75213d957e386ae8f420098e4d6a5b79ed6834ac1be28e69d8b99cb6614a36c87de1880ac262134273020e4f031c38f5cd'
            'db4ad287cfc9f42495bd20771135e140656271b3678827e3e751ec023c1e90b99bfd097d57562b19fc8fa983bd8be877350ef7dcb071c14c310800a7485e9896')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i -e "s/\"main.Version.*$/\"main.Version=${pkgver}\"/" "${srcdir}/${_pkgname}/Makefile"
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
