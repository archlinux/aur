# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=cuckoo
pkgver=2.0.7
pkgrel=1
pkgdesc="Cuckoo Sandbox is an automated dynamic malware analysis system"
url="http://cuckoosandbox.org/"
arch=('any')
license=('GPL-3.0')
install='cuckoo.install'
options=('!emptydirs')
depends=('python2' 'python2-sqlalchemy' 'python2-dpkt' 'python2-jinja'
         'python2-django' 'volatility' 'python2-maec' 'python-magic'
         'libvirt' 'python2-bottle' 'python2-pefile' 'python2-pymongo'
         'tcpdump' 'python2-chardet' 'python2-requests' 'python2-dateutil')
optdepends=('python2-pydeep' 'python2-yara')
makedepends=('python-setuptools' 'gendesk')
source=("https://github.com/cuckoosandbox/cuckoo/archive/${pkgver}.tar.gz")
md5sums=('82c69e491c552d265065eee169a217d0')

prepare() {
  cd ${pkgname}-${pkgver}
  find "${srcdir}" -type f -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
  python2 stuff/monitor.py
}

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec="${pkgname}" --categories=Application\;Development --icon "${pkgname}"
}

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 docs/LICENSE "${pkgdir}/usr/share/licenses/cuckoo/LICENSE"
  install -Dm644 cuckoo.desktop "${pkgdir}/usr/share/applications/cuckoo.desktop"
  cat > "${pkgdir}/usr/bin/cuckoo" <<EOF
#!/usr/bin/env bash
if ! id | grep -q '(cuckoo)' && ! [ \$EUID -eq 0 ] ; then
  echo "==> Add yourself to the cuckoo group to use cuckoo as an unprivledged user."
  exit 1
fi
cd /usr/share/${pkgname}
python2 cuckoo.py "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}