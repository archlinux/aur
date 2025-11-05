# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='barman'
pkgver='3.16.2'
pkgrel='1'
pkgdesc="Backup and recovery manager for PostgreSQL"
arch=('x86_64' 'aarch64')
url="https://www.pg${pkgname}.org/"
license=('GPL3')
depends=('rsync' 'python' 'python-argh' 'python-psycopg2'
	 'python-dateutil' 'python-argcomplete')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx'
	     'python-mock' 'python-pytest')
optdepends=('python-boto3' 'python-botocore')
source=("https://github.com/EnterpriseDB/${pkgname}/archive/refs/tags/release/${pkgver}.tar.gz"
	"${pkgname}.crond"
	"${pkgname}.logrotate")
sha256sums=('02206acb70dcfe3a6b51329e9c2b5848114e357f94dda86ba483aab1b11765ae'
            '43e90f39b167b682aa98e753c1803cf6244ba6c1eeb5738270fcb47837c25147'
            '723ba6c8ddce9284d48243787e6d24c40db98933f28bf6a79ce53a2c15bb261c')

build() {
  cd "${pkgname}-release-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  pushd "${pkgname}-release-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"

  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/etc/"{cron.d,${pkgname}.d,logrotate.d}

  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm0644 "scripts/${pkgname}.bash_completion" \
"${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm0644 "docs/${pkgname}.conf" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.conf"
  install -Dm0644 "docs/${pkgname}.d/passive-server.conf-template" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.d"
  install -Dm0644 "docs/${pkgname}.d/ssh-server.conf-template" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.d"
  install -Dm0644 "docs/${pkgname}.d/streaming-server.conf-template" "${pkgdir}/usr/share/doc/${pkgname}/etc/${pkgname}.d"

  popd
  install -Dm0644 "${pkgname}.crond" "${pkgdir}/usr/share/doc/${pkgname}/etc/cron.d/${pkgname}"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/usr/share/doc/${pkgname}/etc/logrotate.d/${pkgname}"
}
