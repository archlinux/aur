pkgname=john-mpi
pkgver=1.9.0
pkgrel=1
_patchlevel=jumbo-1
_pkgname=john
arch=('i686' 'x86_64')
pkgdesc='JohnTheRipper password cracker with Jumbo patch and MPI support'
url='http://openwall.info'
license=('GPL')
provides=('john')
conflicts=('john' 'john-latest')
depends=('mpich' 'libpcap' 'opencl-icd-loader')
makedepends=('mpich' 'unzip' 'opencl-headers')
optdepends=(
  'bash-completion: completion for bash'
  'perl: perl based john scripts'
  'ruby: ruby based john scripts'
  'python2: python2 based john scripts'
  'python: python based john scripts')
backup=(etc/john/john.conf)
source=("https://www.openwall.com/${_pkgname}/k/${_pkgname}-${pkgver}-${_patchlevel}.tar.xz")

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}-${_patchlevel}/src
  sed 's|$prefix/bin|/usr/lib/john|' -i configure.ac
  autoreconf -fiv
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}-${_patchlevel}/src
  local PATH=/opt/mpich/bin:${PATH}

  ./configure --prefix=/usr --enable-mpi --enable-pkg-config --enable-pcap --with-systemwide
  make
}

# Taken from community/john
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}-${_patchlevel}
  # config
  sed -i 's#\$JOHN#/usr/share/john/#g' run/john.conf
  install -Dm 644 run/john.conf -t "${pkgdir}/etc/john"
  install -Dm 644 run/*.conf -t "${pkgdir}/usr/share/john"

  # opencl
  install -Dm 644 run/kernels/* -t "${pkgdir}/usr/share/john/kernels"

  # docs
  install -d "${pkgdir}/usr/share/doc/john"
  cp -r doc/* "${pkgdir}/usr/share/doc/john"
  rm "${pkgdir}/usr/share/doc/john/README"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  chmod -R o+r "${pkgdir}"/usr/share/doc/john/*

  # completion
  install -Dm 644 run/john.bash_completion "${pkgdir}/usr/share/bash-completion/completions/john"
  install -Dm 644 run/john.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_john"

  # binaries
  install -Dm 755 run/john -t "${pkgdir}/usr/bin"
  local john_bins=(calc_stat cprepair  genmkvpwd  luks2john.py    mkvcalcproba raw2dyna \
                   relbench  tgtsnarf  uaf2john   wpapcap2john vncpcap2john SIPdump)
  for bin in "${john_bins[@]}"; do
    install -Dm 755 "run/${bin}" "${pkgdir}/usr/bin/${bin/.py/}"
  done

  # scripts
  install -Dm 755 run/*.py run/*.pl run/*.rb run/{mailer,benchmark-unify} -t "${pkgdir}/usr/lib/john"

  # data
  install -Dm 644 run/*.chr run/*.lst run/dictionary* run/stats -t "${pkgdir}/usr/share/john"
  install -Dm 644 run/rules/* -t "${pkgdir}/usr/share/john/rules"

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
sha256sums=('f5d123f82983c53d8cc598e174394b074be7a77756f5fb5ed8515918c81e7f3b')
