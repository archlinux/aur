# Maintainer: Ethan Skinner <aur@etskinner.com>
# Contributor: Niklas <dev@n1klas.net>

pkgname=appdaemon
pkgver=3.0.5
pkgrel=1
pkgdesc="Python execution environment for Home Assistant automation apps"
arch=('any')
url="http://appdaemon.readthedocs.io/"
license=('Apache')
depends=('python-daemonize'
         'python-astral'
         'python-requests'
	 'python-aiohttp'
	 'python-yarl'
	 'python-jinja'
	 'python-aiohttp-jinja'
         'python-sseclient'
         'python-websocket-client'
         'python-aiohttp-jinja'
         'python-yaml>=5.1'
         'python-voluptuous'
         'python-feedparser'
         'python-iso8601'
         'python-bcrypt'
	 'python-paho-mqtt')
makedepends=('python-setuptools')
backup=('etc/appdaemon/appdaemon.yaml')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'appdaemon.yaml'
        'appdaemon.service'
        'appdaemon.sysusers')
sha512sums=('b395c258d193e6cf8b6734a652b0fc88110d377318ab163a71a2c25e40181f2e0ab95f5020f5f1acc1bd6e853537df98e8abd027e297269c91ab377585dcb612'
            '538a9da9a2c296694696fe69029b29ddd7bc21bcc071cbb54052eb82811e63849d8103951f23fcc2b623d628088f2bd0fbe469577fe9943598315c804654c9b8'
            'c1de8558962a1e92b44db6a6a95731094c4e1890c3c1a1c1436eda72d68997224f70c6dc9f8d1b86e1b131c0dc66a0f4107fdca0f75777220e14d57aeea0a222'
            'd46356da6a00398c77edf1143dbb2f6061d896986868226525afa0bd8c873f3cd699fa6c3fff4b120b04b7fb2761c55873bacccfff5eb3defab0d1b7f79cb878')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  replace '==' '>=' setup.py
}

replace() {
  pattern=$1
  substitute=$2
  file=$3
  echo -n "Replacing '$pattern' by '$substitute' in $file..."
  if grep -q $pattern $file && sed -i "s/$pattern/$substitute/" $file; then
    echo "DONE"
  else
    echo "FAILED"
    depname=$(echo $pattern | sed 's/[>=<].*$//')
    echo Current line in $file:
    grep $depname $file
    exit 1
  fi
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mkdir -p "${pkgdir}/etc/appdaemon/apps"
    install -Dm644 "${srcdir}/appdaemon.yaml" "${pkgdir}/etc/appdaemon/appdaemon.yaml"
    install -Dm644 "${srcdir}/appdaemon.service" "${pkgdir}/usr/lib/systemd/system/appdaemon.service"
    install -Dm644 "${srcdir}/appdaemon.sysusers" "${pkgdir}/usr/lib/sysusers.d/appdaemon.conf"
}
