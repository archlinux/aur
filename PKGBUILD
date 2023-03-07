# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=17.2.5
pkgrel=6
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
source=("ceph-bin-${pkgver}-${pkgrel}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_linux_${arch}.tar.zstd"
        "ceph-libs-bin-${pkgver}-${pkgrel}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_libs_linux_${arch}.tar.zstd"
        "ceph-mgr-bin-${pkgver}-${pkgrel}.tar.zst::https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/ceph_mgr_linux_${arch}.tar.zstd")
sha512sums=('ad69d0b2cf9e94e667dee1b2e91b3db0c60780f01a3a20942123095771fd8869cdd4adfbad503b7d33f71ae1a847d05f57731bb750f3abc3ece49ea93a783587'
            'ef7e364e8a13910bee3d67a44550cbebd07188641a03e94a5ee957e79e7b763a34e9065c66b581e8f8a7187e5a0a45c6e6bc4ca0d395c77f28ef65fef38413ba'
            'fb536a74ee7c0f3c776ffe91116b05016bf925d9a85d7b58bddf9810ef19a66961b2e8d3cc48a66e6874851fa28b4429f6fc862590c894650ad86f2641e22e23')
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
