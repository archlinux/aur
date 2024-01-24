# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='barman'
pkgver='3.10.0'
pkgrel='1'
pkgdesc="Backup and recovery manager for PostgreSQL"
arch=('x86_64' 'aarch64')
url="https://www.pg${pkgname}.org/"
license=('GPL3')
depends=('rsync' 'python' 'python-argh' 'python-psycopg2'
	 'python-dateutil' 'python-argcomplete')
makedepends=('python-distribute' 'python-sphinx' 'python-mock' 'python-pytest')
optdepends=('python-boto3' 'python-botocore')
source=("https://github.com/EnterpriseDB/${pkgname}/archive/refs/tags/release/${pkgver}.tar.gz"
	"${pkgname}.crond"
	"${pkgname}.logrotate"
	"passive-server.conf-template"
	"ssh-server.conf-template"
	"streaming-server.conf-template")
sha256sums=('171c61f24d0ffa0c96427043d91c218afff893a34bfd4ca1cd0c10b768943c8e'
            '43e90f39b167b682aa98e753c1803cf6244ba6c1eeb5738270fcb47837c25147'
            '723ba6c8ddce9284d48243787e6d24c40db98933f28bf6a79ce53a2c15bb261c'
            '631afa66223a705db3c1d5a4749b8f60368f86b72a3c0fc7eef9ca48af312c50'
            '0c014a7232f33444dde368da6b8a61e10d0f7c346a240ffdcbbf46ed77ac2366'
            '28895cd3a857d98d14ac4b86fb1f968c49834fd22310c4de676fdda2ea75c855')

package() {
  pushd "${pkgname}-release-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/etc/"{cron.d,${pkgname}.d,logrotate.d}

  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm0644 "scripts/${pkgname}.bash_completion" \
"${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm0644 "doc/${pkgname}.conf" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.conf"

  popd
  install -Dm0644 "${pkgname}.crond" "${pkgdir}/usr/share/doc/${pkgname}/etc/cron.d/${pkgname}"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/usr/share/doc/${pkgname}/etc/logrotate.d/${pkgname}"
  install -Dm0644 "passive-server.conf-template" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.d"
  install -Dm0644 "ssh-server.conf-template" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.d"
  install -Dm0644 "streaming-server.conf-template" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.d"
}
