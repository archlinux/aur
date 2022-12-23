# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=17.2.5
pkgrel=5
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
source=("ceph-bin-${pkgver}-${pkgrel}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_linux_${arch}.tar.zstd"
        "ceph-libs-bin-${pkgver}-${pkgrel}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_libs_linux_${arch}.tar.zstd"
        "ceph-mgr-bin-${pkgver}-${pkgrel}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_mgr_linux_${arch}.tar.zstd")
sha512sums=('15cfadd37b088791e4fe240fdcb15471e952f740722e9d20a9ea535de5e82acb59bdcf42de4b94bc694948469c2a8ea442b8157670c5ec94c2e617a86a0ac43f'
            '445bf7563f3b14c34e79fcee902905c89dc52bd6a5871384e3d9bddbfc8e101c1c23da41695e21e4faef49841023ffd73a18a6786f93f99463e4fa42e2d135f4'
            'ab6a698e9f2a125874fd952304ae2c0459ed39cbd0c194af02ae7ffd9560f74387e731c666a51aaf0762907ac6e5fac0aa18a4b6f69bd0f6642fe9d5f9bb19c1')
# Don't extract source archives
noextract=("${source[@]%%::*}")


package_ceph-libs-bin() {
  depends=('boost-libs' 'curl' 'glibc' 'keyutils' 'libutil-linux' 'bzip2' 'lz4' 'nss'
           'oath-toolkit' 'python' 'snappy' 'systemd-libs' 'fmt' 'cryptsetup'
           'lua' 'librdkafka' 'libaio' 'gperftools' 'librabbitmq-c'
           'python-prettytable' 'python-yaml' 'python-setuptools')
  provides=("ceph-libs=${pkgver}-${pkgrel}")
  conflicts=('ceph-libs')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-libs-bin-${pkgver}-${pkgrel}.tar.zst -C "${pkgdir}"
}

package_ceph-bin() {
  depends=("ceph-libs=${pkgver}-${pkgrel}"
           'boost-libs' 'curl' 'fuse3' 'fmt' 'glibc' 'gperftools' 'java-runtime'
           'keyutils' 'libaio' 'libutil-linux' 'librdkafka' 'cryptsetup' 'libnl'
           'ncurses'
           'nss' 'oath-toolkit' 'python'
           'snappy' 'sudo' 'systemd-libs' 'lua' 'gawk')
  backup=('etc/logrotate.d/ceph'
          'etc/udev/rules.d/50-ceph-rbd.rules'
          'etc/sysctl.d/90-ceph-osd.conf'
          'etc/sudoers.d/90-ceph')
  optdepends=('smartmontools: disk monitoring via S.M.A.R.T'
              'nvme-cli: disk monitoring for NVMe drives')
  provides=("ceph=${pkgver}-${pkgrel}")
  conflicts=('ceph')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-bin-${pkgver}-${pkgrel}.tar.zst -C "${pkgdir}"
}

package_ceph-mgr-bin() {
  depends=("ceph=${pkgver}-${pkgrel}" "ceph-libs=${pkgver}-${pkgrel}"
           'bash' 'boost-libs' 'curl' 'gperftools' 'nss' 'fmt'
           'python' 'python-cherrypy' 'python-pecan' 'python-pyjwt' 'python-more-itertools' 'python-routes'
           'python-numpy' 'python-scipy' 'python-six' 'python-coverage' 'python-pytest' 'python-dateutil'
           'python-prettytable' 'python-requests' 'python-pyopenssl' 'python-bcrypt' 'python-yaml'
           'python-werkzeug' 'python-jinja')
  optdepends=('python-influxdb: influx module'
              'python-kubernetes: rook module'
              'python-prometheus_client: prometheus module'
              'python-remoto: ssh module')
  provides=("ceph-mgr=${pkgver}-${pkgrel}")
  conflicts=('ceph-mgr')
  options=('emptydirs' '!strip')

  cd "${srcdir}"

  tar --exclude='.*' --zstd -xv -f ceph-mgr-bin-${pkgver}-${pkgrel}.tar.zst -C "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
