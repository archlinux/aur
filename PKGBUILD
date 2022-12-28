# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-openpegasus
pkgver=2.14.1
pkgrel=7
pkgdesc="Openpegasus libs for LSI (Broadcom) Raid products"
arch=('x86_64')
url='http://www.avagotech.com/products/server-storage'
license=('custom:TOG')
depends=('sqlite'
         'libssl.so'
         'libcrypt.so'
         'libcrypto.so'
         'libsqlite3.so'
         )
makedepends=('icu'
             'net-snmp'
             'openslp'
             'setconf'
             'libxcrypt'
             'openssl'
             )
provides=('libpegclient.so'
          'libpegcommon.so'
          'libpegconfig.so'
          'libpegexportserver.so'
          'libpeggeneral.so'
          'libpeghandler.so'
          'libpegindicationservice.so'
          'libpeglistener.so'
          'libpegprovider.so'
          'libpegprm.so'
          'libpegrepository.so'
          'libpegslp_client.so'
          'libpegquerycommon.so'
          'libpegqueryexpression.so'
          'libpegwql.so'
          )
source=('https://collaboration.opengroup.org/pegasus/documents/32572/pegasus-2.14.1.tar.gz'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.7.0-PIE.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.9.0-no-rpath.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.13.0-gcc5-build.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.14.1-build-fixes.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.14.1-ssl-include.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.14.1-openssl-1.1-fix.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/main/f/pegasus-2.14.1-build-fixes-2.patch'
        'Makefile.minimal'
        )
sha256sums=('9f2f13a35da218f3cb6e8478246ff7c4d3010560bb4d5de9cbf4272d48e353fb'
            'e3924bdb81a4dd2cedfb9c7ba669cb01b32f4c4e16b3af4c06f9a2426a9274d1'
            '66141323d6de100d9a1805f614a950944e223a36026b62b1a823c8aa148f26df'
            '8a68ecbd383f9121e54bd32f6094b2793367c15d8960ea5f92691e5b9bbcad99'
            '5863314f2ff17c32bc340efd5241f809bc1372b8e2fde0b3a2e22c7ab9b64281'
            '5de02253442ef8cb3b6f744fa4dd3237b66d96911ab8badd63336a7e1d28a429'
            'deb3e52e5406419cc42d15f1a668ed291ef8337217bb5bc9cefd01ef3b804371'
            '832be374999213a6d940e84c449a7c3566d9dda2b1c2348d7bc601bc907fc228'
            'SKIP'
            )
options=('debug')

_create_links() {
  # create soname links
  find "${pkgdir}" -type f -name '*.so*' -print0 | while read -d $'\0' _lib; do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  cd pegasus

  # Patch pegasus-toc sources
  patch -p1 -i "${srcdir}/pegasus-2.7.0-PIE.patch"
  patch -p1 -i "${srcdir}/pegasus-2.9.0-no-rpath.patch"
  patch -p1 -i "${srcdir}/pegasus-2.13.0-gcc5-build.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-build-fixes.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-ssl-include.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-openssl-1.1-fix.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-build-fixes-2.patch"

  # Fix sqlite and snmp detection
  sed 's|lib64/|\$libbase/|g' -i configure

  # set lib output directory
  setconf configure libbase lib

  # silence easy deprecation warnings
  # https://man7.org/linux/man-pages/man3/pthread_yield.3.html
  sed 's|pthread_yield|sched_yield|g' -i src/Pegasus/Common/Threads.h
  # https://www.openssl.org/docs/manmaster/man3/ERR_remove_state.html
  sed 's|ERR_remove_state(0);||g' -i src/Pegasus/Common/SSLContextRep.h
}

build() {
  cd pegasus

  export PEGASUS_EXTRA_C_FLAGS="${CFLAGS} -fno-strict-aliasing"
  export PEGASUS_EXTRA_CXX_FLAGS="${PEGASUS_EXTRA_C_FLAGS} -std=c++14"
  export PEGASUS_EXTRA_LINK_FLAGS="${LDFLAGS}"
  export PEGASUS_EXTRA_PROGRAM_LINK_FLAGS="-pie -Wl,-z,relro,-z,now,-z,nodlopen,-z,noexecstack"

  ./configure

  cp "${srcdir}/Makefile.minimal" Makefile.minimal
  sed 's|Makefile|Makefile.minimal|g' -i GNUmakefile

  make -f GNUmakefile minimal
}

package() {
  for i in ${provides[@]}.1; do install -Dm755 "${srcdir}/pegasus/lib/${i}" "${pkgdir}/usr/lib/${i}"; done

  # Create soname links
  _create_links

  install -Dm644 "${srcdir}/pegasus/OpenPegasusNOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OpenPegasusNOTICE.txt"
}
