# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-openpegasus
pkgver=2.14.1
pkgrel=3
pkgdesc="Openpegasus libs for LSI (Broadcom) Raid products"
arch=('x86_64')
url='http://www.avagotech.com/products/server-storage'
license=('custom:TOG')
depends=('sqlite'
         'openssl'
         'libxcrypt'
         )
makedepends=('icu'
             'openssl'
             'net-snmp'
             'openslp'
             'setconf'
             )
source=('https://collaboration.opengroup.org/pegasus/documents/32572/pegasus-2.14.1.tar.gz'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/master/f/pegasus-2.7.0-PIE.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/master/f/pegasus-2.9.0-no-rpath.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/master/f/pegasus-2.13.0-gcc5-build.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/master/f/pegasus-2.14.1-build-fixes.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/master/f/pegasus-2.14.1-ssl-include.patch'
        'https://src.fedoraproject.org/rpms/tog-pegasus/raw/master/f/pegasus-2.14.1-openssl-1.1-fix.patch'
        )
sha256sums=('9f2f13a35da218f3cb6e8478246ff7c4d3010560bb4d5de9cbf4272d48e353fb'
            'e3924bdb81a4dd2cedfb9c7ba669cb01b32f4c4e16b3af4c06f9a2426a9274d1'
            '66141323d6de100d9a1805f614a950944e223a36026b62b1a823c8aa148f26df'
            '8a68ecbd383f9121e54bd32f6094b2793367c15d8960ea5f92691e5b9bbcad99'
            '5863314f2ff17c32bc340efd5241f809bc1372b8e2fde0b3a2e22c7ab9b64281'
            '5de02253442ef8cb3b6f744fa4dd3237b66d96911ab8badd63336a7e1d28a429'
            'deb3e52e5406419cc42d15f1a668ed291ef8337217bb5bc9cefd01ef3b804371'
            )

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
  cd pegasus

  # Patch pegasus-toc sources
  patch -p1 -i "${srcdir}/pegasus-2.7.0-PIE.patch"
  patch -p1 -i "${srcdir}/pegasus-2.9.0-no-rpath.patch"
  patch -p1 -i "${srcdir}/pegasus-2.13.0-gcc5-build.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-build-fixes.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-ssl-include.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-openssl-1.1-fix.patch"

  # Fix sqlite and snmp detection
  sed 's|lib64/|\$libbase/|g' -i configure

  # set lib output directory
  setconf configure libbase lib

  # add missing z library
  sed 's|lcrypt|& -lz|g' -i mak/config-linux.mak

}

build() {
  cd pegasus

  export PEGASUS_EXTRA_C_FLAGS="${CFLAGS} -Wall -Wno-unused -fno-strict-aliasing"
  export PEGASUS_EXTRA_CXX_FLAGS="${PEGASUS_EXTRA_C_FLAGS} -std=c++14"
  export PEGASUS_EXTRA_LINK_FLAGS="${LDFLAGS}"
  export PEGASUS_EXTRA_PROGRAM_LINK_FLAGS="-pie -Wl,-z,relro,-z,now,-z,nodlopen,-z,noexecstack"

  ./configure

  make -f GNUmakefile
}

package() {
  _pegasus_lib=('libpegclient.so.1'
                'libpegcommon.so.1'
                'libpegconfig.so.1'
                'libpegcql.so.1'
                'libpegexportserver.so.1'
                'libpeggeneral.so.1'
                'libpeghandler.so.1'
                'libpegindicationservice.so.1'
                'libpeglistener.so.1'
                'libpegprovider.so.1'
                'libpegprm.so.1'
                'libpegrepository.so.1'
                'libpegslp_client.so.1'
                'libpegquerycommon.so.1'
                'libpegqueryexpression.so.1'
                'libpegwql.so.1'
                )
  for i in ${_pegasus_lib[@]}; do install -Dm755 "${srcdir}/pegasus/lib/${i}" ${pkgdir}/usr/lib/${i}; done

  # Create soname links
  _create_links

  install -Dm644 "${srcdir}/pegasus/OpenPegasusNOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OpenPegasusNOTICE.txt"
}
