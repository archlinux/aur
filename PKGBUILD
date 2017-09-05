# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-openpegasus
pkgver=2.14.1
pkgrel=1
pkgdesc="LSI Openpegasus libs"
arch=('i686' 'x86_64')
url='http://www.avagotech.com/products/server-storage'
license=('custom:TOG')
          # OpenPegasus site don't like wget/curl. :/
depends=('pam')
makedepends=('lynx'
             'icu'
             'openssl'
             'sqlite'
             'net-snmp'
             'openslp'
             )
DLAGENTS=('https::/usr/bin/lynx -accept_all_cookies -cmd_script=lynx_script_for_download_pegasus %u'
          'http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u'
          )
source=('lynx_script_for_download_pegasus' #IMPORTANT for download pegasus zip. please don't move to other place
        'https://collaboration.opengroup.org/pegasus/documents/32572/pegasus-2.14.1.tar.gz'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.7.0-PIE.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.9.0-no-rpath.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.13.0-gcc5-build.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.14.1-build-fixes.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.14.1-ssl-include.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.14.1-openssl-1.1-fix.patch'
        'ld.so.lsi-openpegasus.conf'
        )
sha256sums=('72d24d357601b9df8a418a7e7851d3b55c32614394e5507146fe961e4712c5e8'
            '9f2f13a35da218f3cb6e8478246ff7c4d3010560bb4d5de9cbf4272d48e353fb'
            'e3924bdb81a4dd2cedfb9c7ba669cb01b32f4c4e16b3af4c06f9a2426a9274d1'
            '66141323d6de100d9a1805f614a950944e223a36026b62b1a823c8aa148f26df'
            '8a68ecbd383f9121e54bd32f6094b2793367c15d8960ea5f92691e5b9bbcad99'
            '5863314f2ff17c32bc340efd5241f809bc1372b8e2fde0b3a2e22c7ab9b64281'
            '5de02253442ef8cb3b6f744fa4dd3237b66d96911ab8badd63336a7e1d28a429'
            'deb3e52e5406419cc42d15f1a668ed291ef8337217bb5bc9cefd01ef3b804371'
            '454fc2ecd0863b70622fdad471818699dc551030dca8557d1eeb54f835482036'
            )
options=('!strip')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  # Patch pegasus-toc sources
  cd pegasus
  patch -p1 -i "${srcdir}/pegasus-2.7.0-PIE.patch"
  patch -p1 -i "${srcdir}/pegasus-2.9.0-no-rpath.patch"
  patch -p1 -i "${srcdir}/pegasus-2.13.0-gcc5-build.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-build-fixes.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-ssl-include.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-openssl-1.1-fix.patch"

  setconf configure libbase lib
  sed 's|lib64|lib|g' -i configure
}

build() {
  msg2 "Build Pegasus-TOG framework"
  cd pegasus
  ./configure
  make -f GNUmakefile
}

package() {
  local _pegasus_lib=('libpegclient.so.1'
                      'libpegcommon.so.1'
                      'libpegconfig.so.1'
                      'libpegcql.so.1'
                      'libpegexportserver.so.1'
                      'libpeglistener.so.1'
                      'libpegprovider.so.1'
                      'libpegslp_client.so.1'
                      'libpegquerycommon.so.1'
                      'libpegqueryexpression.so.1'
                      'libpegwql.so.1'
                     )
  for i in ${_pegasus_lib[@]}; do install -Dm755 "${srcdir}/pegasus/lib/${i}" ${pkgdir}/usr/lib/${i}; done #"${pkgdir}/opt/lsi/Pegasus/${i}"; done

  # Create soname links
  _create_links

  # Add /opt/lsi/Pegasus ldconf search path
  #install -Dm644 "${srcdir}/ld.so.lsi-openpegasus.conf" "${pkgdir}/etc/ld.so.conf.d/lsi-openpegasus.conf"

  install -Dm644 "${srcdir}/pegasus/OpenPegasusNOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OpenPegasusNOTICE.txt"
}

