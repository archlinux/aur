# Maintainer GI_Jack <iamjacksemail@hackermail.com>
# Imported from ArchStrike
# Original: ArchStrike <team@archstrike.org>

buildarch=1

pkgname=cuckoo
pkgver=2.0.4.4
pkgrel=1
pkgdesc="A malware analysis system"
url="http://cuckoosandbox.org/"
arch=('any')
license=('GPL3')
install='cuckoo.install'
options=('!emptydirs')
depends=('python2' 'python2-sqlalchemy' 'python2-dpkt' 'python2-jinja'
         'python2-django' 'volatility' 'python2-maec' 'python2-magic'
         'libvirt' 'python2-bottle' 'python2-pefile' 'python2-pymongo'
         'tcpdump' 'python2-chardet' 'python2-requests' 'python2-dateutil')
optdepends=('python2-pydeep' 'python2-yara')
source=("https://downloads.cuckoosandbox.org/cuckoo-current.tar.gz"
  'cuckoo.desktop')
sha512sums=('a2853abcb7a8af9a197423b899f07fbb44763cfc8cd8415e42a0703bed59a1517fa8941417f92abdeff57222f1e5e671c9131a0a14f7df8546dc2900c9358399'
            'fde1e6d9c4bea273d848b9dbee09027f6eb7e8b48116ee4bcaddef314c7c22f8bca5a3e7e9dabe06d007fe603fe7c1cd518b2c707b41866945b0adf83dcc42a4')

prepare() {
  cd ${pkgname}
  find "${srcdir}" -type f -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
  sed -i 's|^version_check =.*|version_check = off|' conf/cuckoo.conf
  sed -i 's|^platform =.*|platform = linux|' conf/{kvm.conf,virtualbox.conf,vmware.conf,esx.conf}

}

package() {
  cd ${pkgname}
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/cuckoo"
  install -Dm644 docs/LICENSE "${pkgdir}/usr/share/licenses/cuckoo/LICENSE"
  install -Dm644 ${srcdir}/cuckoo.desktop "${pkgdir}/usr/share/applications/cuckoo.desktop"
  cp --no-preserve=ownership -a * "${pkgdir}/usr/share/cuckoo"
  chmod u+rwX,g+rwX,o+rX -R "${pkgdir}/usr/share/cuckoo"

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

