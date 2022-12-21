# Maintainer: Amish <contact at via dot aur>

pkgname=snort-nfqueue
_pkgname=snort3
_openappid=26425
pkgver=3.1.50.0
pkgrel=1
pkgdesc='A lightweight network IDS / IPS with NFQUEUE and OpenAppID support.'
arch=('i686' 'x86_64')
url='https://www.snort.org'
license=('GPL')
provides=('snort')
conflicts=('snort')
depends=('gperftools' 'hwloc' 'hyperscan' 'libdaq>=3.0.10' 'libdnet' 'libmnl' 'libnetfilter_queue' 'libpcap' 'libunwind' 'luajit' 'lz4' 'openssl' 'pcre' 'pulledpork' 'xz' 'zlib')
makedepends=('cmake' 'pkgconf')
backup=('etc/snort/snort.lua'
        'etc/snort/snort_defaults.lua'
        'etc/snort/local.lua'
        'etc/snort/homenet.lua'
        'etc/snort/rules/local.rules'
        'etc/snort/rules/snort.rules'
        'etc/snort/lists/default.blocklist'
        'etc/snort/lists/default.allowlist'
        'etc/logrotate.d/snort')
install=snort.install
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/snort3/snort3/archive/refs/tags/${pkgver}.tar.gz"
        "snort-openappid-${_openappid}.tar.gz::https://snort.org/downloads/openappid/${_openappid}"
        'local.lua'
        'snort.logrotate'
        'snort.sysusers'
        'snort.tmpfiles'
        'snort.service')
sha256sums=('983497578587c5b1291994608fef70700d7f251461e79ac897751bba57cc56b5'
            '8513877ce2264bb22119d911c2cf11f73735c866e2ca0d061c35eef6740d51f9'
            '55ae10b6d24abadb03dd4f010fdf71e077370227db6835e48881836a8ea082a8'
            'a8a7684a676da5cd55c2b5ab012dac3d14c5a6c62f6e37c4913ba1dbe506088e'
            'ae3245c5de527fb487c459f2f4a9c78803ae6341e9c81b9a404277679cdee051'
            'bc4a02d184601faba5cd0f6cb454097a3b04a0c8fe56f5f8b36d24513484faa2'
            'cb1108ab0a6ad38981a6f308b0ae2b276b68d08bfa0e38c036eae277b38b28d8')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure_cmake.sh --prefix=/usr --enable-tcmalloc --with-daq-libraries=/usr/lib/daq/ --disable-static-daq
    make -C build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make -C build DESTDIR="${pkgdir}" install

    mv "${pkgdir}"{/usr,}/etc
    install -D -m644 "${srcdir}"/local.lua "${pkgdir}"/etc/snort
    install -D -m644 "${srcdir}"/snort.logrotate "${pkgdir}"/etc/logrotate.d/snort
    install -D -m644 "${srcdir}"/snort.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/snort.conf
    install -D -m644 "${srcdir}"/snort.sysusers "${pkgdir}"/usr/lib/sysusers.d/snort.conf
    install -D -m644 "${srcdir}"/snort.service "${pkgdir}"/usr/lib/systemd/system/snort.service
    install -D -m644 /dev/null "${pkgdir}"/etc/snort/rules/snort.rules
    install -D -m644 /dev/null "${pkgdir}"/etc/snort/lists/default.blocklist
    install -D -m644 /dev/null "${pkgdir}"/etc/snort/lists/default.allowlist
    echo -e "HOME_NET = [[ 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 ]]\nEXTERNAL_NET = 'any'" > "${pkgdir}"/etc/snort/homenet.lua
    echo -e '#pulledpork will put rules here in snort.rules\n#alert icmp any any -> any any ( msg:"ICMP Traffic Detected"; sid:10000001; metadata:policy security-ips alert; )' > "${pkgdir}"/etc/snort/rules/local.rules
    chmod 0644 "${pkgdir}"/etc/snort/{homenet.lua,rules/{local,snort}.rules}

    # rule files and other settings
    sed -i -e "/^EXTERNAL_NET\\s\\+=/ a include 'homenet.lua'" \
      -e "/^HOME_NET\\s\\+=/ i -- we set HOME_NET and EXTERNAL_NET here or via an included file" \
      -e 's/^\(HOME_NET\s\+=\)/--\1/g' \
      -e 's/^\(EXTERNAL_NET\s\+=\)/--\1/g' \
      "${pkgdir}"/etc/snort/snort.lua
    sed -i -e "s/^\\(RULE_PATH\\s\\+=\\).*/\\1 'rules'/g" \
      -e "s/^\\(BUILTIN_RULE_PATH\\s\\+=\\).*/\\1 'builtin_rules'/g" \
      -e "s/^\\(PLUGIN_RULE_PATH\\s\\+=\\).*/\\1 'so_rules'/g" \
      -e "s/^\\(WHITE_LIST_PATH\\s\\+=\\).*/\\1 'lists'/g" \
      -e "s/^\\(BLACK_LIST_PATH\\s\\+=\\).*/\\1 'lists'/g" \
      "${pkgdir}"/etc/snort/snort_defaults.lua

    # OpenAppID files
    install -d -m755 "${pkgdir}"/usr/lib/openappid/custom/{libs,lua,port}
    cp -a --no-preserve=ownership -t "${pkgdir}"/usr/lib/openappid/ "${srcdir}"/odp
}
