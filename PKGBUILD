# Maintainer: Tim Meusel <tim@bastelfreak.de>

pkgname=hiera
pkgver=3.8.0
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
sha512sums=('192076c462edb46ea9142ada17885c659661b85f8df45c1eadeb16050c2ee0e2fc2606d8d07e67e24095709fa6270bf3d386142cb11e3aa18fcd63dd3cd869aa'
            '80735805c1340b046812f32df22be4acc11ea6c0e045a783f044839634da0209dc5816722c40b61e951819817e4adbda57c5a6f5c396144f531b2540963187b0'
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
