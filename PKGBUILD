# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Based on commit b9a15de92091334a6ff3fc9074655f6e5d9f24dd from the fedpkg
# master branch for freeipa.

# NOTE: ntp, autofs, and ntp support is currently broken because the formats of
# the /etc/conf.d/ configuration files in Arch Linux differ from the formats of
# Fedora's /etc/sysconfig/ configuration files.

# Active directory trusts will not (probably never) work in Arch. It requires a
# heavily patched version of Samba 4, which uses MIT Kerberos instead of
# Heimdal. (Fedora went through 174 releases to get this working O_O)

# Client only, for now
build_server=false

# AUR workaround
pkgname=freeipa

pkgbase=freeipa
: && pkgname=('freeipa')

if [ "x${build_server}" == "xtrue" ]; then
  pkgname+=('freeipa-server')
fi

pkgver=3.3.5
pkgrel=1
pkgdesc="The Identity, Policy, and Audit system"
arch=('i686' 'x86_64')
url="http://www.freeipa.org/"
license=('GPL')

# Client dependencies
makedepends=()

# FreeIPA server dependencies
if [ "x${build_server}" == "xtrue" ]; then
  makedepends+=('389-ds-base'
                #'libwbclient'
                'samba'
                'svrcore'
                'talloc'
                'tevent')

  # SELinux dependencies
  #makedepends+=('selinux-refpolicy-arch'
  #              'selinux-usr-checkpolicy'
  #              'selinux-usr-policycoreutils')
fi

# Other dependencies
makedepends+=('curl'
              'java-runtime>=7'
              'krb5'
              'libunistring'
              'nspr'
              'nss'
              'openssl'
              'openldap'
              'popt'
              'python2'
              'python2-distribute'
              'python2-dnspython'
              'python2-kerberos'
              'python2-krbv'
              'python2-ldap'
              'python2-lxml'
              'python2-memcached'
              'python2-m2crypto'
              'python2-netaddr'
              'python2-nss'
              'python2-polib'
              'python2-pyasn1'
              'python2-pylint'
              'python2-pyopenssl'
              # Red Hat specific
              #'python2-rhsm'
              'sssd'
              'xmlrpc-c')

# Dependencies for "make check"
checkdepends=('check' 'python2-nose')

options=('!libtool')
source=("http://www.freeipa.org/downloads/src/freeipa-${pkgver}.tar.gz"
        'sss-auth-setup.py'
        '0001-Use-Arch-Linux-Paths.patch'
        '0002-Add-Arch-Linux-Platform.patch'
        '0003-Use-Python-2.patch'
        '0004-NTP-Fixes.patch'
        '0005-Fix-nss-includes.patch'
        '0006-Disable-make-testcert.patch'
        '0007-Fix-nosetests-path.patch')
sha512sums=('58325e7a619eeb0170dd32a648f22e50c0df2d7bc0a7609b6f0be3b8328890e5e027ba094fd4970ac063544b4d163f4e07ac62c1b358dba5246e148c2fd830b6'
            '5f101692e311205b3706642c6f329459646aaa693683ab2d4847bd8a7f464ef99ec617b0422df8e25ec2a0dc3a68cd9bf54db4bb3013b84844df15160716adc8'
            '604927b05f248c6ee8a42c87198a3ab05aa2a98b3a8f4b9ee0352e049d9e59195eac2292b609a9f84b176875cd6640d118f7e5c35f74b042f7e03561aafd2c04'
            '7bd0dba218626f27f918b9cf15cf25183a90421ee2c792648f36e6cd75cf09f2ff04e30a9419f6033aa4d640fc1f7dcfa973fec9fc2c74354bb1e609621d449b'
            '872a172451c436fc916b72bc48733905b4f9298ece39ad737f60790e9fe2da896dfd2255f58d7aeb301c9c19a2bb2078684ca8449f9dec5dcb45fc1f5bda7b30'
            'a70bcc98ea71e8154e7600d6bf7ed8de6bbb73d31b5ccb0b556a538e9cce78fbd71698e3be6cfa33487226e0e79d6fb8ee78d926259a4543fe4300a6b90b9a09'
            '294a6e3a09cada150dd0f21c712f312840a882acb067520b70ebd058cd4ee88863a2a828df63efc190c5608ffb0d71d60253883baddeb7487aec7b3d905abb04'
            '5bc0afc21a9a178ace728f902422683502b6cf579585bc8feab42d1f7701e8609468e92265b22c7f1f958f0f175f3287ea011e8f149fb30b231708e15b6eefd2'
            '0a79540e0df4e7b0fed8fd378411799fc5b2152795e1938df2ee6935e944517cd8c780740e8aec2f718476f3b5bd0a36113b85add04d4bdb180da5ba80c37c50')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Change Fedora's paths to the equivalents in Arch Linux
  patch -p1 -i "${srcdir}/0001-Use-Arch-Linux-Paths.patch"
  # Make slight changes to Fedora 18's platform code (systemd service names,
  # /bin/ -> /usr/bin/, etc) and add a minimal Arch Linux platform that
  # calls most of Fedora 18's platform, except for AuthConfig
  patch -p1 -i "${srcdir}/0002-Add-Arch-Linux-Platform.patch"
  # FreeIPA hasn't been ported to Python 3, so the code must be modified to
  # run /usr/bin/python2
  patch -p1 -i "${srcdir}/0003-Use-Python-2.patch"
  # Arch Linux's ntp does not accept the '-U' parameter and does not have a
  # /etc/sysconfig/ configuration files, so the relevant code must be removed
  patch -p1 -i "${srcdir}/0004-NTP-Fixes.patch"
  # Arch Linux's nss package installs the header files to /usr/include/nss/
  # instead of /usr/include/nss3/
  patch -p1 -i "${srcdir}/0005-Fix-nss-includes.patch"
  # make-testcert requires a running certificate server to work properly
  patch -p1 -i "${srcdir}/0006-Disable-make-testcert.patch"
  # Arch Linux's python2-nose package installs nosetests as
  # /usr/bin/nosetests2
  patch -p1 -i "${srcdir}/0007-Fix-nosetests-path.patch"

  export SUPPORTED_PLATFORM=archlinux
  export PYTHON=python2

  # Force regeneration of platform support
  rm ipapython/services.py

  make version-update

  pushd ipa-client
  ../autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  popd

  if [ "x${build_server}" == "xtrue" ]; then
    pushd daemons
    ../autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --with-openldap
    popd

    pushd install
    ../autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
    popd

    make IPA_VERSION_IS_GIT_SNAPSHOT=no all
  else
    make IPA_VERSION_IS_GIT_SNAPSHOT=no client
  fi
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  # Tests require FreeIPA to be installed and set up
  #make test
}

# All files are in freeipa package. This one is here only for the dependencies.
package_freeipa-server() {
  : && pkgdesc="The IPA authentication server"
  depends=("freeipa=${pkgver}-${pkgrel}"
           '389-ds-base'
           'acl'
           'apache'
           'cyrus-sasl-gssapi'
           'keyutils'
           'krb5'
           'memcached'
           'mod_auth_kerb'
           'mod_nss'
           'mod_wsgi'
           'nss'
           'ntp'
           'openldap'
           'python2-dnspython'
           'python2-krbv'
           'python2-ldap'
           'python2-memcached'
           'python2-pyasn1'
           'slapi-nis'
           'systemd'
           'tomcat7'
           'zip')
  optdepends=('python2-m2crypto: For Microsoft Active Directory trusts'
              'samba: For Microsoft Active Directory trusts'
              'sssd: For Microsoft Active Directory trusts')
  backup=('etc/ipa/html/browserconfig.html'
          'etc/ipa/html/ffconfig.js'
          'etc/ipa/html/ffconfig_page.js'
          'etc/ipa/html/ipa_error.css'
          'etc/ipa/html/ssbrowser.html'
          'etc/ipa/html/unauthorized.html')
  # Backup files created by this package
  backup+=('etc/httpd/conf/extra/ipa-rewrite.conf'
           'etc/httpd/conf/extra/ipa.conf'
           'etc/httpd/conf/extra/ipa-pki-proxy.conf'
           'usr/share/ipa/html/ca.crt')
  install=install.freeipa-server

  # SELinux dependencies
  #depends+=("freeipa-server-selinux=${pkgver}-${pkgrel}"
  #          'selinux-refpolicy-arch'
  #          'selinux-usr-policycoreutils')

  # Conflicts with mod_ssl, but that is a part of the apache package
  #conflicts=('mod_ssl')
}

package_freeipa() {
  : && pkgdesc="IPA authentication for use on clients"
  depends=('autofs'
           'bind'
           'certmonger'
           'curl'
           'cyrus-sasl-gssapi'
           'gnupg'
           'iproute2'
           'nfs-utils'
           'nfsidmap'
           'nss'
           'ntp'
           'oddjob'
           'pam-krb5'
           'python2-dnspython'
           'python2-kerberos'
           'python2-krbv'
           'python2-ldap'
           'python2-lxml'
           'python2-netaddr'
           'python2-nss'
           'python2-pyopenssl'
           'sssd'
           'wget'
           'xmlrpc-c')
  backup=('etc/ipa/default.conf'
          'etc/ipa/ca.crt')
  install=install.freeipa

  # authconfig is Fedora specific
  #depends+=('authconfig')

  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/sss-auth-setup.py" \
                "${pkgdir}/usr/bin/sss-auth-setup"

  cd "${srcdir}/${pkgbase}-${pkgver}"

  export SUPPORTED_PLATFORM=archlinux
  export PYTHON=python2

  # Force regeneration of platform support
  rm ipapython/services.py

  if [ "x${build_server}" == "xtrue" ]; then
    make install DESTDIR="${pkgdir}"
  else
    make client-install DESTDIR="${pkgdir}"
  fi

  if [ "x${build_server}" == "xtrue" ]; then
    # Some user-modifiable HTML files are provided. Move these to /etc and link
    # back.
    install -dm755 "${pkgdir}/etc/ipa/html/"
    install -dm755 "${pkgdir}/var/cache/ipa/sysrestore/"
    install -dm755 "${pkgdir}/var/cache/ipa/sysupgrade/"
    install -dm755 "${pkgdir}/usr/share/ipa/html/"
    ln -s ../../../../etc/ipa/html/ffconfig.js \
      "${pkgdir}/usr/share/ipa/html/ffconfig.js"
    ln -s ../../../../etc/ipa/html/ffconfig_page.js \
      "${pkgdir}/usr/share/ipa/html/ffconfig_page.js"
    ln -s ../../../../etc/ipa/html/ssbrowser.html \
      "${pkgdir}/usr/share/ipa/html/ssbrowser.html"
    ln -s ../../../../etc/ipa/html/unauthorized.html \
      "${pkgdir}/usr/share/ipa/html/unauthorized.html"
    ln -s ../../../../etc/ipa/html/browserconfig.html \
      "${pkgdir}/usr/share/ipa/html/browserconfig.html"
    ln -s ../../../../etc/ipa/html/ipa_error.css \
      "${pkgdir}/usr/share/ipa/html/ipa_error.css"

    # So we can own our Apache configuration
    install -dm755 "${pkgdir}/etc/httpd/conf/extra/"
    touch "${pkgdir}/etc/httpd/conf/extra/ipa.conf"
    touch "${pkgdir}/etc/httpd/conf/extra/ipa-pki-proxy.conf"
    touch "${pkgdir}/etc/httpd/conf/extra/ipa-rewrite.conf"
    install -dm755 "${pkgdir}/usr/share/ipa/html/"
    touch "${pkgdir}/usr/share/ipa/html/ca.crt"
    touch "${pkgdir}/usr/share/ipa/html/configure.jar"
    touch "${pkgdir}/usr/share/ipa/html/kerberosauth.xpi"
    touch "${pkgdir}/usr/share/ipa/html/krb.con"
    touch "${pkgdir}/usr/share/ipa/html/krb.js"
    touch "${pkgdir}/usr/share/ipa/html/krb5.ini"
    touch "${pkgdir}/usr/share/ipa/html/krbrealm.con"
    touch "${pkgdir}/usr/share/ipa/html/preferences.html"

    # systemd service
    install -dm755 "${pkgdir}/usr/lib/systemd/system/"
    install -m644 \
      init/systemd/ipa.service \
      init/systemd/ipa_memcached.service \
      "${pkgdir}/usr/lib/systemd/system/"

    # Configuration files
    install -dm755 "${pkgdir}/etc/conf.d/"
    install -m644 init/ipa_memcached.conf \
      "${pkgdir}/etc/conf.d/"

    # /run
    install -dm755 "${pkgdir}/run/"
    install -dm700 "${pkgdir}/run/ipa/"
    install -dm700 "${pkgdir}/run/ipa_memcached/"

    # systemd tmpfiles.d configuration
    install -dm755 "${pkgdir}/usr/lib/tmpfiles.d/"
    install -m644 init/systemd/ipa.conf.tmpfiles \
      "${pkgdir}/usr/lib/tmpfiles.d/ipa.conf"

    # bash completion configuration files
    install -dm755 "${pkgdir}/etc/bash_completion.d/"
    install -m644 contrib/completion/ipa.bash_completion \
      "${pkgdir}/etc/bash_completion.d/ipa"

    # Web UI plugin dir
    install -dm755 "${pkgdir}/usr/share/ipa/ui/js/plugins/"

    # Backup directory
    install -dm755 "${pkgdir}/var/lib/ipa/backup/"
  fi

  install -dm755 "${pkgdir}/var/lib/ipa-client/sysrestore/"

  # /etc/ipa/ is needed for ipa-client-install
  install -dm755 "${pkgdir}/etc/ipa/"

  # Fix filenames
  pushd "${pkgdir}/usr/lib/python2.7/site-packages/"
  mv ipapython-${pkgver}*-py2.7.egg-info ipapython-${pkgver}-py2.7.egg-info
  popd

  find "${pkgdir}/" \( -name '*.pyc' -o -name '*.pyo' \) -delete

  # Not packaging the tests for now
  find "${pkgdir}/" -type f | grep '\.py' | grep ipatests | xargs rm -f
}
