# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.0.2
pkgrel=2
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='http://docs.opennebula.org/stable'
license=('Apache')
depends=('ruby>=1.8.7'
         'xmlrpc-c>=1.31'
         'openssl>=0.9.8'
         'sqlite3>=3.6'
         'openssh'
         'libxml2>=2.7'
         'curl'
         'libxslt'
         'expat'
         'cdrkit'
         'log4cpp>=1.0'
         'ruby-opennebula>=4.14.2'
         'ruby-sinatra'
         'ruby-builder'
         'ruby-nokogiri')
makedepends=('xmlrpc-c>=1.31'
             'pkgconfig'
             'scons>=0.98')
optdepends=('nfs-utils: for using the shared file system storage model'
            'mariadb>=5.1: optional replacement for SQLite as the DB back-end'
            'libmariadbclient>=5.1: required if using MariaDB/MySQL instead of SQLite'
            'ruby-sequel: required when upgrading the database'
            'ruby-sqlite3: required when upgrading the database')
conflicts=('opennebula-unstable')
install=opennebula.install
backup=('etc/one/oned.conf'
        'etc/one/sunstone-server.conf'
        'etc/one/cli/onedatastore.yaml'
        'etc/one/cli/oneshowback.yaml'
        'etc/one/cli/onevdc.yaml'
        'etc/one/cli/onemarket.yaml'
        'etc/one/cli/onetemplate.yaml'
        'etc/one/cli/onevm.yaml'
        'etc/one/cli/oneacct.yaml'
        'etc/one/cli/oneuser.yaml'
        'etc/one/cli/onevrouter.yaml'
        'etc/one/cli/oneimage.yaml'
        'etc/one/cli/onemarketapp.yaml'
        'etc/one/cli/onehost.yaml'
        'etc/one/cli/onevnet.yaml'
        'etc/one/cli/onecluster.yaml'
        'etc/one/cli/onezone.yaml'
        'etc/one/cli/onesecgroup.yaml'
        'etc/one/cli/onegroup.yaml'
        'etc/one/cli/oneacl.yaml'
        'etc/one/ec2_driver.conf'
        'etc/one/econe.conf'
        'etc/one/az_driver.conf'
        'etc/one/onegate-server.conf'
        'etc/one/oneflow-server.conf'
        'etc/one/az_driver.default'
        'etc/one/tmrc'
        'etc/one/vmm_exec/vmm_execrc'
        'etc/one/vmm_exec/vmm_exec_vcenter.conf'
        'etc/one/vmm_exec/vmm_exec_kvm.conf'
        'etc/one/oned.conf'
        'etc/one/auth/ldap_auth.conf'
        'etc/one/auth/x509_auth.conf'
        'etc/one/auth/server_x509_auth.conf'
        'etc/one/ec2query_templates/m1.small.erb'
        'etc/one/defaultrc'
        'etc/one/sunstone-views.yaml'
        'etc/one/hm/hmrc'
        'etc/one/sunstone-logos.yaml'
        'etc/one/sunstone-views/admin.yaml'
        'etc/one/sunstone-views/groupadmin_vcenter.yaml'
        'etc/one/sunstone-views/cloud_vcenter.yaml'
        'etc/one/sunstone-views/admin_vcenter.yaml'
        'etc/one/sunstone-views/cloud.yaml'
        'etc/one/sunstone-views/groupadmin.yaml'
        'etc/one/sunstone-views/user.yaml'
        'etc/one/sched.conf'
        'etc/one/ec2_driver.default')
changelog=ChangeLog
source=("http://downloads.opennebula.org/packages/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'opennebula.service'
        'opennebula-sunstone.service'
        'opennebula-econe.service'
        'opennebula-oneflow.service'
        'chown_fix.patch'
        'set_locations.patch'
        'fix_kvm_emulator.patch')
sha512sums=('95d61476538e32b75c3ac870c4ba19e4f352a90e1d6e76355efab4f4679291ba2fcd223ec39f9b3cbd29bc5c5c7a5388c1c402c5c84b22f81729ff240b6d34b6'
            'f91678e5de6f5b980b6b50c7d1922ee9a836df416236ab9cde9e8a9352cdbb9f4102f47870d5405514173c1c9a510feefa191b55644269aee859c559beb8f600'
            '2d1921ccacb222b0c652be6f4f7f74bd3ba482754a9cf19db63c51b7a62b803e4de9b90284e16d51b1b4db215d65ad3fed7269d55cc57135ddfd050fd32b7407'
            '79a778c3086bdd1ef286252add60922d61384f193a44facc47442516e21b6997560326e2a4f6dc9a554615bbd78bf343a1a29569966f25d30238ead346da29d7'
            'ab5b458f53047d1c1320f5fc3fb134b19c391ad85332577b5ffadfb8cedd299a4d47bb0973a6bfb1394ab9d15d7e92c7d1e22c269c0aeeb833a2a140ece8d06e'
            '8d6a311072da61ca49458aaf787daf4ef5c5969a9aa282f2276d679dc38e14e5fd1c23bc51b12a29d2d40b65aa45bd2c38d6741726b09d75a38565b7d4ad4677'
            '1f20e688a0f6d36a6bc875392473e75c7de77b159b9cbdf262ac0f093b4d65555231ab15897156e2558d0df6ae631f8d79a3265073ea8c0546586937544e47c9'
            '997218a2dbc807cf2114fc5bb68a3da8d17cdf38aa3d7b51afaab52cf2638cc46293d42799a6d805b799c7748e326ab2780f81ca73121ebdf320ec046c41407d')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
  patch < "${srcdir}/set_locations.patch"
  patch -p1 < "${srcdir}/fix_kvm_emulator.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  ###########################################################################
  ##                                                                       ##
  ## It is highly recommended that you read the documentation and tweak    ##
  ## the PKGBUILD accordingly:                                             ##
  ## http://docs.opennebula.org/stable/integration/references/compile.html ##
  ##                                                                       ##
  ###########################################################################

  # This builds the vanilla OpenNebula package. Tweak this line as desired.
  scons -j "$(nproc)" new_xmlrpc=yes
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m644 "${srcdir}/opennebula.service" "${pkgdir}/usr/lib/systemd/system/opennebula.service"
  install -D -m644 "${srcdir}/opennebula-sunstone.service" "${pkgdir}/usr/lib/systemd/system/opennebula-sunstone.service"
  install -D -m644 "${srcdir}/opennebula-econe.service" "${pkgdir}/usr/lib/systemd/system/opennebula-econe.service"
  install -D -m644 "${srcdir}/opennebula-oneflow.service" "${pkgdir}/usr/lib/systemd/system/opennebula-oneflow.service"

  DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
}
