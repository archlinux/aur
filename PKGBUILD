# Maintainer: Sledge Sulaweyo <sledge.sulaweyo#gmail.com>
# Contributor: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jeremy Audet <ichimonji10#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.10.3
pkgrel=1
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='https://opennebula.org/'
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
         'python'
         'mariadb'
         'libmariadbclient'
         'zeromq')
makedepends=('xmlrpc-c'
             'pkgconfig'
             'scons'
             'mariadb'
             'libmariadbclient'
             'libvncserver' # needed to build sunstone
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
        'install.sh.patch'
        'fix_kvm_emulator.patch'
        'opennebula.install')
md5sums=('63a0c34c039f06ba99fbf98f6a8045b4' # package
         '69c4374554ae689c44b0ef8c0a31b911' # opennebula.service
         '74bc0a908441063a44cb134449564db1' # opennebula-scheduler.service
         'f207636bd04a621f20b14a37c6ad49b7' # opennebula-sunstone.service
         '91d608d9576dc800a12597135ad0203d' # opennebula-econe.service
         '773c9f257b8a367ad4b4ca7694294460' # opennebula-oneflow.service
         '63b217d32a279adbb50b68106cc83578' # opennebula-onegate.service
         '3c38e24ef93de0982737f3dabbb9d251' # opennebula-novnc.service
         '05f58094a1d132f2164599e068158cd7' # opennebula.conf
         '2f1c73538c52324c224684072ea7877b' # opennebula.logrotate
         'e00db582c46c97d96115eef252f37b40' # install.sh.patch
         '680931b4555ea25a17ea8c20b382d175' # fix_kvm_emulator.patch
         '6621891a6de781d24e4395a36da2d0b0') # opennebula.install

prepare() {
  cd "one-release-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/install.sh.patch"
  patch -p0 < "${srcdir}/fix_kvm_emulator.patch"
  # Patch npm package versions to support node 12+
  # grunt-sass version
  sed -i 's/1.2.1/2.1.0/' "${srcdir}/one-release-${pkgver}/src/sunstone/public/package.json"
  # node-sass
  sed -i 's/3.10.1/4.13.0/' "${srcdir}/one-release-${pkgver}/src/sunstone/public/package.json"

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

