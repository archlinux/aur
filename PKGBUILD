# Maintainer: Tim Meusel <tim@bastelfreak.de>

pkgname=hiera
pkgver=3.10.0
pkgrel=1
pkgdesc='Lightweight pluggable hierarchical database'
arch=('any')
url="https://github.com/puppetlabs/${pkgname}"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.gemspec::https://raw.githubusercontent.com/puppetlabs/hiera/${pkgver}/.gemspec"
        ruby3.patch)
sha512sums=('b195e8051c95396693536ca36ae9020077556db9547f8eb6876217200a674fce7eb8298da49ba35a19fd9f8e10c5fe80d8f569ab66665ebe34b5af8a8eb9e644'
            '2096e3b888b37d4004373eaf123d81c8b5ef367bc423b186ae34f7ab89a8ab752a28505fc6491ddc6dfdf85ac3b18a5940d9ee1951f547969c846382a30bf947'
            '4e55027f5c21872eb55ae80656c3039a92717d2619cbeef1a86c8d5f938727b3f9ff68bdceb71b3198597bcd5cb981a8b3b07528003364041ef387376d80d275')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../ruby3.patch
}

package() {
  cd "${pkgname}-${pkgver}"
  ruby install.rb --destdir="${pkgdir}" --sitelibdir="$(ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]')" --mandir=/
  install -Dm644 "../${pkgname}-${pkgver}.gemspec" -t "${pkgdir}/usr/lib/ruby/gems/3.0.0/specifications/"
  install -d "${pkgdir}/var/lib/hiera/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 CONTRIBUTING.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
