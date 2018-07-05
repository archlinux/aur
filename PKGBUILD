# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Anton Kudryavtsev <anton@anibit.ru>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname='gitea'
_gourl='code.gitea.io'
pkgname=gitea-git
pkgrel=1
pkgver=r6495.cfb76cd99
pkgdesc='A painless self-hosted Git service.'
url='https://gitea.io/'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('git' 'go')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
conflicts=('gitea')
provides=('gitea')
options=('!strip' 'emptydirs')
backup=('etc/gitea/app.ini')
install=gitea.install
source=('git://github.com/go-gitea/gitea.git'
        '01-adjust-config.patch'
        '02-adjust-service.patch'
        'gitea.tmpfiles'
)
sha512sums=('SKIP'
            '3f96361a5135ea11b438e2cad29f2033221c63c11d1f260474d589c469e5db760fbf4da0718f9d015e106b72a13c02ad2899a8a90ac07365e20b935b59e95a6c'
            '01d5cfe3e2967b680cce1a3980db6460db1aada82718316886e92d2f9ef30b66d37c6dbb7da7bbc3026b2f6985b65e07e5f8fd58904443155a81a1533eef1bc1'
            '0c6c9729f8dfd5b5fe2badf998e89624b00800f87ae1b28a68acd52f2621f3434cc3930a578d2bb3e27005f8ffbb0f4a0e4e4d3d2e2371d0214d36c805d65573')

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
  PATH="${srcdir}/bin:$PATH" GOPATH="${srcdir}" make DESTDIR="${pkgdir}/" TAGS="sqlite tidb pam" clean generate build
}

package() {
  cd "${srcdir}/src/${_gourl}/${_pkgname}"

  install -dm0750 "${pkgdir}/"{etc,var/log,var/lib}/${_pkgname}

  cp -r {custom,public,options,templates} "${pkgdir}/var/lib/${_pkgname}"

  install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 "custom/conf/app.ini.sample" "${pkgdir}/etc/${_pkgname}/app.ini"
  install -Dm0644 "contrib/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm0644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
