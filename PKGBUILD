# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Michał Sałaban <michal@salaban.info>

pkgname='nginx-amplify-agent'
pkgver=1.8.0_2
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc='A Python application that provides system and NGINX metric collection'
arch=('any')
url="https://www.nginx.com/products/${pkgname%-agent}/"
license=('BSD')
depends=(
  'nginx'
  'python-gevent>=21.12.0'
  'python-greenlet>=1.1.1'
  'python-netifaces>=0.11.0'
  'python-netaddr>=0.8.0'
  'python-flup>=1.0.3'
  'python-crossplane>=0.5.7'
  'python-rstr>=3.0.0'
  'python-psutil>=5.8.0'
  'python-daemon>=2.2.4'
  'python-requests>=2.26.0'
  'python-ujson>=5.1.0'
  'python-pymysql>=1.0.2'
  'python-setproctitle>=1.1.10'
  'python-scandir>=1.5'
)
makedepends=('python-setuptools')
# checkdepends=('python-pyhamcrest')
_pkgtarname="${pkgname}-${_pkgver}"
source=("${_pkgtarname}.tar.gz::https://github.com/nginxinc/${pkgname}/archive/v${_pkgver}.tar.gz"
        "amplify-agent.service"
        "tmpfile.conf")
backup=('etc/amplify-agent/agent.conf')
b2sums=('cb99e22cd0e5f4473727653f401bec97b1d65e19b700213ac9e9a6e4607f0adf0e078613ef83d8e6cf54064a04904bf2765438bbf290a5e47dee4d7aaeba84f4'
        'ae469466413cc086d943fa2eee41615333cdfdb6d2029e5f3dd80dcf889e49b76be8e6ca8fabd1f2511a084263c860b4ef6bfb30aeb06ed58ee95bd9a8c6a209'
        'cb408a4d33586db82096fd92e801d72f461adc657007c4c78a137a8c0edaf3ec191118b465c37bb109f8d1d03a743cecff3ddd1d39f5d70f10342ecc70e3f07f')

prepare() {
  cd "${_pkgtarname}"

  # remove bogus 'amplify.zope.*' includes, as they don't exist in package source
  sed -e "/amplify.zope/c     ))," \
      -i setup.py
}

build() {
  cd "${_pkgtarname}"
  python setup.py build
}

package() {
  install -Dm 644 'amplify-agent.service' "${pkgdir}/usr/lib/systemd/system/amplify-agent.service"
  install -Dm 644 'tmpfile.conf' "${pkgdir}/usr/lib/tmpfiles.d/amplify-agent"

  cd "${_pkgtarname}"
  python setup.py install -O1 --skip-build --root="${pkgdir}"

  mv "${pkgdir}"/etc/amplify-agent/agent.conf{.default,}
  chgrp http -R "${pkgdir}/etc/amplify-agent/"
  install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -dm 755 -o http -g http "${pkgdir}/var/log/amplify-agent"
}
