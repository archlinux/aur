# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Zezadas

_pkgname=john
pkgname=john-git
pkgver=1.8.0.jumbo.1.r7035.gedcbeda1f
pkgrel=1
pkgdesc="fast password cracker (using the git repository of the jumbo patch)"
arch=('i686' 'x86_64')
url="http://www.openwall.com/$_pkgname/"
license=('GPL2' 'custom')
depends=('openssl-1.0' 'gmp' 'libpcap' 'openmpi' 'gcc-libs' 'opencl-icd-loader')
makedepends=('git' 'libgsf' 'libxml2' 'nss' 'opencl-headers' 'pkg-config')
optdepends=("perl: for executing some of the scripts at /usr/share/john"
            "ruby: for executing some of the scripts at /usr/share/john"
            "python: for executing some of the scripts at /usr/share/john"
            "nss: to use mozilla2john"
            "libgsf: to use office2john"
            "libxml2: to use office2john")
provides=('john')
conflicts=('john')
backup=('etc/john/john.conf')
install=john.install
options=('!strip')
source=("$_pkgname::git+https://github.com/magnumripper/JohnTheRipper.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname/"
  sed 's|env python|env python2|' -i run/*.py
  sed 's|/usr/bin/python|/usr/bin/python2|' -i run/*.py
  sed 's|"x$enable_native_tests" = xyes -a "x$PKG_CONFIG"|"x$PKG_CONFIG"|' -i src/configure
}

build() {
  cd "$srcdir/$_pkgname/src"
  
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  local JOHN_CFG_FULL_NAME="" #"-DCFG_FULL_NAME='\"/etc/john/john.conf\"'"
  local JOHN_SYSTEMWIDE_FLAGS="" #"-DJOHN_SYSTEMWIDE_EXEC='\"/usr/lib/john\"' -DJOHN_SYSTEMWIDE_HOME='\"/etc/john\"'"
  local JOHN_FLAGS="-DJOHN_SYSTEMWIDE=1 ${JOHN_SYSTEMWIDE_FLAGS} -DCPU_FALLBACK ${JOHN_CFG_FULL_NAME}"
  local CFLAGS="${CFLAGS} ${JOHN_FLAGS}"
  local CONFIGURE_FLAGS="--prefix=/usr --disable-native-tests --enable-openmp --enable-mpi --enable-native-march"
  CONFIGURE_FLAGS+=" --enable-opencl --enable-pkg-config --enable-pcap"

  if [[ "${CARCH}" == "x86_64" ]]; then
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS}"
    make clean; make
    mv ../run/john{,-non-avx}
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS} -mavx"
    make clean; make
    mv ../run/john{,-non-xop}
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS} -mxop"
    make clean; make
  elif [[ "${CARCH}" == "i686" ]]; then
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS}"
    make clean; make
    mv ../run/john{,-non-mmx}
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS} -mmmx"
    make clean; make
    mv ../run/john{,-non-sse}
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS} -msse2"
    make clean; make
    mv ../run/john{,-non-avx}
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS} -mavx"
    make clean; make
    mv ../run/john{,-non-xop}
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS} -mxop"
    make clean; make
  else
    ./configure ${CONFIGURE_FLAGS} CFLAGS="${CFLAGS}"
    make clean; make
  fi
    
}

package() {
    cd ${srcdir}/$_pkgname/
	# config file
	sed -i 's|$JOHN/john.local.conf|/etc/john/john.local.conf|g' ${srcdir}/$_pkgname/run/john.conf
	sed -i 's|$JOHN|/etc/john|g' ${srcdir}/$_pkgname/run/john.conf
	install -Dm644 ${srcdir}/$_pkgname/run/john.conf ${pkgdir}/etc/john/john.conf	

	# opencl
    install -Dm 644 run/kernels/* -t "${pkgdir}/usr/share/john/kernels"
	
	# rules
    install -Dm 644 run/rules/* -t "${pkgdir}/usr/share/john/rules"
	
	# docs
	install -d ${pkgdir}/usr/share/doc/john
	install -m644 ${srcdir}/$_pkgname/doc/* ${pkgdir}/usr/share/doc/john/
	install -Dm644 ${srcdir}/$_pkgname/doc/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

	# completion
   install -Dm 644 run/john.bash_completion "${pkgdir}/usr/share/bash-completion/completions/john"
   install -Dm 644 run/john.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_john"
	
	####
    install -Dm644 ${srcdir}/$_pkgname/run/*.conf ${pkgdir}/usr/share/john/

	# binaries
    install -Dm 755 run/john -t "${pkgdir}/usr/bin"
    install -Dm 755 run/john-non-* -t "${pkgdir}/usr/lib/john"||true
    local john_bins=(calc_stat cprepair  genmkvpwd   mkvcalcproba raw2dyna \
                     relbench  tgtsnarf  uaf2john   wpapcap2john vncpcap2john SIPdump)
    for bin in "${john_bins[@]}"; do
      install -Dm 755 run/${bin} -t "${pkgdir}/usr/bin"
    done
    #TODO luks2john.py
    # scripts
    install -Dm 755 run/*.py run/*.pl run/*.rb run/{mailer,benchmark-unify} -t "${pkgdir}/usr/lib/john"
    
    # data
    install -Dm 644 run/*.chr run/*.lst run/dictionary* run/stats -t "${pkgdir}/usr/share/john"
    
	# syminks
    cd "${pkgdir}/usr/bin"
    local john_links=(base64conv    dmg2john       gpg2john      hccap2john    \
                      keepass2john  keychain2john  keyring2john  keystore2john \
                      kwallet2john  pfx2john       putty2john    pwsafe2john   \
                      racf2john     rar2john       ssh2john      unique        \
                      unshadow      zip2john       unafs         undrop        \
                      truecrypt_volume2john)
    for link in "${john_links[@]}"; do
      ln -s john ${link}
    done
}

# vim:set ts=2 sw=2 et:

