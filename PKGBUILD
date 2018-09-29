# Maintainer: Sledge Sulaweyo <sledge.sulaweyo#gmail.com>
# Contributor: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jeremy Audet <ichimonji10#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.6.1
pkgrel=1
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='http://docs.opennebula.org/stable'
license=('Apache')
depends=('ruby'
         'ruby-bundler'
         'xmlrpc-c'
         'openssl'
         'sqlite3'
         'openssh'
         'libxml2'
         'curl'
         'libxslt'
         'expat'
         'nfs-utils'
         'cdrkit'
         'log4cpp'
         'python2' # needed for novnc
         'mariadb'
         'libmariadbclient')
makedepends=('xmlrpc-c'
             'pkgconfig'
             'scons'
             'mariadb'
             'libmariadbclient'
             'npm' # needed to build sunstone
             'grunt-cli' # needed to build sunstone
             'bower') # needed to build sunstone
optdepends=('nfs-utils: for using the shared file system storage model'
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
source=("https://github.com/OpenNebula/one/archive/release-${pkgver}.tar.gz"
        'opennebula.service'
        'opennebula-scheduler.service'
        'opennebula-sunstone.service'
        'opennebula-econe.service'
        'opennebula-oneflow.service'
        'opennebula-onegate.service'
        'opennebula-novnc.service'
        'opennebula.conf'
        'opennebula.logrotate'
        'chown_fix.patch'
        'set_locations.patch'
        'fix_kvm_emulator.patch'
        'opennebula.install')
md5sums=('564b5fb1ef19b0c5b7ea54bdb96df101' #package
            '6d4b3b7c89371c2bd086525a6b5a0027' #opennebula.service
            'b576f9dd30d62dc4b3090878561ed3e6' #opennebula-scheduler.service
            'c56b5f98dc9df8677761de70e0e6a1be' #opennebula-sunstone.service
            'e0d276ff2a885679ac6a227e2e592509' #opennebula-econe.service
            'bdccd7529afc2d87bcc3361c72259db2' #opennebula-oneflow.service
            'cb945dde4dbabde055d63bb59bff4cd4' #opennebula-onegate.service
            '3c38e24ef93de0982737f3dabbb9d251' #opennebula-novnc.service
            '8cbcd7b189f191554e5722a087a4fa22' #opennebula.conf
            '2f1c73538c52324c224684072ea7877b' #opennebula.logrotate
            'cd272404aba91a27cf89ce22364e51b4' #chown_fix.patch
            'bab6415dd2437c6dfdadad90efedeff3' #set_locations.patch
            '680931b4555ea25a17ea8c20b382d175' #fix_kvm_emulator.patch
            'ef157cdab2befdd7a38985297d2c5a23' #opennebula.install
            )

prepare() {
  cd "one-release-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
  patch < "${srcdir}/set_locations.patch"
  patch -p0 < "${srcdir}/fix_kvm_emulator.patch"
  # As we install from the github release sources we need to build sunstone as well.
  # To do that we need the npm environment set up
  # https://docs.opennebula.org/5.4/integration/references/sunstone_dev.html#sunstone-dev
  cd "${srcdir}/one-release-${pkgver}/src/sunstone/public/"
  npm install
  bower install
}

build() {
  cd "one-release-${pkgver}"

  ###########################################################################
  ##                                                                       ##
  ## It is highly recommended that you read the documentation and tweak    ##
  ## the PKGBUILD accordingly:                                             ##
  ## http://docs.opennebula.org/stable/integration/references/compile.html ##
  ##                                                                       ##
  ###########################################################################

  # This builds the vanilla OpenNebula package. Tweak this line as desired.
  scons new_xmlrpc=yes mysql=yes sqlite=yes sunstone=yes parsers=yes
}

package() {
  cd "one-release-${pkgver}"

  install -D -m644 "${srcdir}/opennebula.service" "${pkgdir}/usr/lib/systemd/system/opennebula.service"
  install -D -m644 "${srcdir}/opennebula-scheduler.service" "${pkgdir}/usr/lib/systemd/system/opennebula-scheduler.service"
  install -D -m644 "${srcdir}/opennebula-novnc.service" "${pkgdir}/usr/lib/systemd/system/opennebula-novnc.service"
  install -D -m644 "${srcdir}/opennebula-sunstone.service" "${pkgdir}/usr/lib/systemd/system/opennebula-sunstone.service"
  install -D -m644 "${srcdir}/opennebula-econe.service" "${pkgdir}/usr/lib/systemd/system/opennebula-econe.service"
  install -D -m644 "${srcdir}/opennebula-oneflow.service" "${pkgdir}/usr/lib/systemd/system/opennebula-oneflow.service"
  install -D -m644 "${srcdir}/opennebula-onegate.service" "${pkgdir}/usr/lib/systemd/system/opennebula-onegate.service"
  install -D -m644 "${srcdir}/opennebula.conf" "${pkgdir}/etc/tmpfiles.d/opennebula.conf"
  install -D -m644 "${srcdir}/opennebula.logrotate" "${pkgdir}/etc/logrotate.d/opennebula"

  DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
}

