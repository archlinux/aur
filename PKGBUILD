# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bfgminer-git
pkgver=5.5.0.r34.g866fd36f
pkgrel=7
pkgdesc="Bitcoin miner featuring overclocking, monitoring, fan speed control and remote management. For FPGA/GPU/CPU Bitcoin mining."
arch=('x86_64' 'aarch64')
depends=('curl' 'gcc-libs' 'glibc' 'hidapi' 'jansson' 'libbase58' 'libblkmaker' 'libevent' 'libmicrohttpd' 'libusb' 
         'lm_sensors' 'libxcrypt' 'ncurses' 'systemd-libs')
makedepends=('uthash' 'yasm' 'git')
optdepends=('opencl-driver: OpenCL implementation for your GPU'
            'sh: for running /usr/bin/start-bfgminer.sh' 
            'screen: for running /usr/bin/start-bfgminer.sh'
            'python: for running api-example.py')
url='https://bitcointalk.org/?topic=877081'
license=('GPL-3.0-or-later')
provides=('bfgminer')
conflicts=('bfgminer')
source=("git+https://github.com/luke-jr/bfgminer"
        "git+https://github.com/bitcoin/libblkmaker.git"
        #"git+https://git.ozlabs.org/~ccan/ccan" Missing commit required?
        "git+https://github.com/rustyrussell/ccan"
        "git+https://github.com/luke-jr/libbase58.git"
        "git+https://github.com/KnCMiner/knc-asic"
        'remove-dangerous-rpath.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '087aa60d818ff37cb7a4edce7a34331a492b5e379a8e034d7a2e02b106bb6ea52b4ce6a1077f602987a2c30213bc185063990796a828ae95f60cff03c7a0bc3f')

pkgver(){
  cd ${pkgname//-git/}

  git describe --tags | sed "s/${pkgname//-git/}-//;s/-/.r/;s/-/./g" 
}

prepare() {
  cd ${pkgname//-git/}

  git submodule init
  local submodule
  grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r submodule
  do
    local repo
    repo="$(basename -s .git "${submodule}")"
    git config "submodule.${submodule}.url" "${srcdir}/${repo}"
  done
  git -c protocol.file.allow=always submodule update

  NOSUBMODULES=1 sh autogen.sh
  patch -p1 -i "${srcdir}"/remove-dangerous-rpath.patch
}

build() {
  cd "${pkgname//-git/}"

  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --enable-alchemist \
    --enable-bfsb \
    --enable-bitman \
    --enable-cpumining \
    --enable-jingtian \
    --enable-metabank \
    --enable-minergate \
    --enable-minion \
    --enable-opencl \
    --enable-keccak \
    --enable-scrypt \
    --with-system-libblkmaker \
    --with-udevrulesdir=/usr/lib/udev/rules.d \
    --enable-year2038

  # --enable-titan  multiple definition of `version'
  # --enable-kncasic multiple definition of `version`
  # --enable-knc (FS#33640)
  make
}

check(){
  cd "${pkgname//-git/}"
  LD_LIBRARY_PATH=${PWD}/libbase58/.libs:${PWD}/libblkmaker/.libs \
    make check
}

package() {
  cd "${pkgname//-git/}"

  make DESTDIR="${pkgdir}" install
}
