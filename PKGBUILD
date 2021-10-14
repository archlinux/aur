# Maintainer: Thore Bödecker <foxxx0@archlinux.org

pkgname=mcollective
pkgver=2.12.5
pkgrel=3
pkgdesc="The Marionette Collective, a framework for building server orchestration or parallel job-execution systems."
arch=('any')
url='https://puppet.com/docs/mcollective/current/index.html'
license=('Apache')
backup=('etc/puppetlabs/mcollective/server.cfg' 'etc/puppetlabs/mcollective/client.cfg')
depends=('ruby' 'puppet5' 'ruby-stomp')
optdepends=(
  'ruby-nats-pure: NATS backend'
  'ruby-net-ping: ping interface supporting various protocols'
  'ruby-sys-proctable: interface for providing process table info'
)
source=(
  "https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
  'mcollective.service'
  'ruby30.patch'
)
sha512sums=('f24c971a816f89196085574416a209ccf5584e61975a6a301aa6c697debf675a3ef49acf5ad3c772b8225d50fd149848afa79e7a5666b471299beb11e213cd57'
            'SKIP'
            '132cdf7d4262ed3969ab09d2951bf79a3182e2a795a2778bd6f4d5d66b53b17f170a7b106e4499f73acdd4a0b29b48eb34fb7a1cd5cba36b70570a9775fda9b1'
            'cd1e76378e3f6c3d759d2d9cb52825484c7f0efc11a577cf317a937dcd1597b1d7f7c5ae2049a2be5fb6f922b731a94851c7c7d10415e63f8b9928383536a614')
validpgpkeys=(
  '6F6B15509CF8E59E6E469F327F438280EF8D349F' # Puppet, Inc. Release Key
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../ruby30.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ruby install.rb \
      --destdir="${pkgdir}" \
      --rdoc \
      --configs \
      --configdir="/etc/puppetlabs/${pkgname}" \
      --bindir="/usr/bin" \
      --sbindir="/usr/bin" \
      --plugindir="/usr/lib/${pkgname}" \
      --sitelibdir="$(ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]')" \
      --no-batch-files \
      --full

  find "${pkgdir}" -type d -name 'debian' -exec rm -rf {} +
  find "${pkgdir}" -type d -name 'redhat' -exec rm -rf {} +

  install -D -m755 -d "${pkgdir}/usr/lib/${pkgname}"

  install -D -m644 "${srcdir}/mcollective.service" "${pkgdir}/usr/lib/systemd/system/mcollective.service"

  sed -i \
      -e "s|/usr/libexec/${pkgname}|/usr/lib/${pkgname}|g" \
      -e "s|/etc/${pkgname}|/etc/puppetlabs/${pkgname}|g" \
      "${pkgdir}/etc/puppetlabs/${pkgname}"/*.cfg
}
