# Maintainer: Sergi Jimenez <sjr@redhat.com>
pkgname=kcli
pkgver=12.6
pkgrel=1
pkgdesc="CLI wrapper around libvirt/aws/gcp/kubevirt/openstack/ovirt"
arch=('any')
url="https://github.com/karmab/kcli"
license=('Apache')
depends=('cdrtools'
         'nmap'
         'python'
         'libvirt-python>=2.0.0'
         'python-docker>=2.0.0'
         'python-flask'
         'python-iptools'
         'python-kubernetes'
         'python-netaddr'
         'python-pyaml'
         'python-prettytable'
         'python-boto3'
         'python-google-api-python-client'
         'python-google-auth-httplib2'
         'python-neutronclient'
         'python-glanceclient'
         'python-keystoneclient'
         'python-novaclient')

makedepends=('python2-setuptools'
             'ruby-ronn')
optdepends=('libvirt: locally managed VMs'
            'qemu: libvirt KVM driver'
            'docker: interaction with local docker daemon')
provides=("kcli=${pkgver}")
source=($pkgname-$pkgver.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('16b069580372d066537ca767aca587a577e3848c67a10cd267bcbb67d9d926b4')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"

  install -m 755 -o root -g root -d ${pkgdir}/usr/share/kcli
  install -m 755 -o root -g root -d ${pkgdir}/usr/share/man/man1
  cp -r extras "${pkgdir}/usr/share/kcli/"
  cp -r plans "${pkgdir}/usr/share/kcli/"
  cp -r samples "${pkgdir}/usr/share/kcli/"

  LANG=en_US.UTF-8 ronn --pipe -r README.md | gzip -c > kcli.1.gz
  install -m 644 -o root -g root  kcli.1.gz "${pkgdir}/usr/share/man/man1/"
}
