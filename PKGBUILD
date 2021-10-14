# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <puppet-aur (at) emeraldreverie (dot) org>
# Contributor: Hyacinthe Cartiaux <hyacinthe (dot) cartiaux (at) free (dot) fr>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Miah Johnson <miah (at) chia-pet dot org>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

_pkgname=puppet
pkgname=puppet5
pkgver=5.5.22
pkgrel=3
pkgdesc='Server automation framework and application'
arch=('any')
url='https://puppet.com/products/open-source-projects'
license=('Apache')
depends=('facter' 'hiera' 'ruby27-multi_json' 'ruby27-augeas' 'ruby27-shadow' 'ruby27-sync')
backup=('etc/puppetlabs/puppet/auth.conf'
        'etc/puppetlabs/puppet/puppet.conf')
install=$_pkgname.install
source=("https://downloads.puppetlabs.com/$_pkgname/$_pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('5332b084a63bdf244672cc4751022c84a1cc50d3f394a13bdcbccf7fcf4ebea67953e88957f23046608bf25e9182548449be824c18289cb2bf1e3ed29b40dc58'
            'SKIP')
validpgpkeys=('6F6B15509CF8E59E6E469F327F438280EF8D349F')
conflicts=('puppet')
provides=('puppet')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # FS#45044: fix file location
  sed -i 's_/opt/puppetlabs/puppet_/usr_' ext/systemd/puppet.service

}

package() {
  cd "${_pkgname}-${pkgver}"

  ruby-2.7 install.rb --destdir="$pkgdir" --sitelibdir="$( ruby-2.7 -e 'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -d "$pkgdir"/usr/lib/{sysusers.d,tmpfiles.d}

  echo 'u puppet 52 "Puppet" /var/lib/puppet' > "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  echo "d /run/puppetlabs 0755 ${_pkgname} ${_pkgname} -" > "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

  # systemd
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/ext/systemd/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Match permissions that puppet sets when running
  install -dm775 "${pkgdir}/var/lib/puppet"
  chmod 750 "${pkgdir}/var/log/puppetlabs/puppet"

  rm -r "${pkgdir}/var/run"
}
