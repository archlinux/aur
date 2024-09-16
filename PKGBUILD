# Maintainer: Pajama Shark <pajama.shark@warpmail.net>

# https://github.com/eikek/sharry

pkgname=sharry
pkgver=1.14.0
pkgrel=1
pkgdesc='A self-hosted file sharing web application'
url="https://eikek.github.io/sharry"
arch=('any')
license=('GPL3')
_server_name="${pkgname}-restserver"

provides=(sharry)
replaces=()
conflicts=()
backup=("etc/${pkgname}/${pkgname}.conf")
depends=('bash' 'java-runtime-headless')
optdepends=('postgresql: to use Postgres as the database backend'
            'mariadb: to use MariaDB as the database backend')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/eikek/sharry/releases/download/v${pkgver}/${_server_name}-${pkgver}.zip"
        ${pkgname}.service
        ${pkgname}.sysusers
        )
        
sha256sums=('346302ef9bef1857a2b39cc365b40bfaaef56e9d144143995285cf0682f37377'
            '93f3f13ee65c6dfcbee8075fc6079735bddb46d647a217f7a96b030a4a45a026'
            '3d84fe25c85a95f7dc9100038beeb0a3d6742e29eec516eed1f266bc9d2d7cce')

package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/etc/${pkgname}
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}

  # Fix the runner script paths:
  sed -i "s/\${app_home}\/\.\.\/lib/\/usr\/share\/java\/${pkgname}/" ${srcdir}/${_server_name}-${pkgver}/bin/${_server_name}
  sed -i "s/config.file=\${app_home}\/\.\.\/conf/config.file=\/etc\/sharry/" ${srcdir}/${_server_name}-${pkgver}/bin/${_server_name}

  # Install all the JARs...
  find "${srcdir}" -name '*.jar' -exec install -m644 {} "${pkgdir}/usr/share/java/${pkgname}/" \;

  install -Dm755 "${srcdir}/${_server_name}-${pkgver}/bin/${_server_name}" "${pkgdir}/usr/bin/${_server_name}"
  install -Dm644 "${srcdir}/${_server_name}-${pkgver}/conf/sharry.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

