# Maintainer: Vlad <avireti@gmail.com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=atlassian-confluence
pkgver=5.7.1
pkgrel=1
pkgdesc="Enterprise wiki"
url="http://www.atlassian.com/software/confluence/overview"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-runtime-jre>=7')
optdepends=('mysql-connector: connect to MySQL'
            'libcups: used by bin/config.sh'
            'fontconfig: used by bin/config.sh')
backup=(etc/conf.d/confluence
        opt/atlassian-confluence/conf/server.xml
        opt/atlassian-confluence/confluence/WEB-INF/classes/confluence-init.properties)
install=confluence.install
source=(http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${pkgver}.tar.gz
        confluence.conf.d
        confluence.service)
sha256sums=('17eae4db5f08e7829f465aa6a98d7bcfe30d335afc97c52f57472c91bbe88da8'
            '0cf76082cf11c04131ad03cf784c7d58152c2c20bfdcbe9809e552cfd42ae9a3'
            '7017750e78fbe0611111ccc00a44f31a93241c4f924a893875804d50d085f9dd')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/opt/atlassian-confluence/
  cp -r "${srcdir}"/atlassian-confluence-${pkgver}/* "${pkgdir}"/opt/atlassian-confluence/
  find "${pkgdir}"/opt/atlassian-confluence/bin -name '*.bat' -type f -exec rm "{}" \;

  # Setup systemd service
  install -m755 -d "${pkgdir}"/usr/lib/systemd/system
  install -D -m644 "${srcdir}"/confluence.service "${pkgdir}"/usr/lib/systemd/system
  install -D -m644 "${srcdir}"/confluence.conf.d "${pkgdir}"/etc/conf.d/confluence
}
