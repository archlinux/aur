# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Maintainer: Shuwen Jethro Sun <jethro.sun7+arch@gmail.com>

pkgname=ns3
pkgver=3.26
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://www.nsnam.org/'
license=('GPL')
depends=(
    'gcc' 'python2' 'python2-setuptools' 'qt4' 'mercurial'
    'cmake' 'cvs' 'unzip' 'bzr' 'p7zip' 'linux-headers' # FIXME
    'doxygen' 'graphviz' 'python2-pygraphviz'
    'sqlite'
    'libxml2' 'gtk2' 'pygtk'
    'boost' 'boost-libs' 'git' 'gdb' 'valgrind'
    'python2-sphinx'
# extra stuff
    'imagemagick' 'dia'  
    'goocanvas' 'pygccxml' 'pygoocanvas'
    'texlive-bin'
    'uncrustify' # utils/check-style.py style check program
    'openmpi' # MPI for HPC
    'flex' # for nsc
    )
makedepends=(
    'fakeroot'
    'findutils'
    )
optdepends=(
    'gsl' 'tcpdump' 'wireshark-gtk'
    )
source=(
    "https://www.nsnam.org/release/ns-allinone-${pkgver}.tar.bz2"
#"ns3-hg::hg+http://code.nsnam.org/ns-3-allinone"
    "ns3-openflow-hg::hg+http://code.nsnam.org/openflow"
    "ns3-click-git::git+https://github.com/kohler/click"
    "ns3-brite-hg::hg+http://code.nsnam.org/jpelkey3/BRITE"
#"ns3-nsc-hg::hg+https://secure.wand.net.nz/mercurial/nsc"
    )
md5sums=('286b4bc3f89c448850a0a6c0bca79742'
         'SKIP'
         'SKIP'
         'SKIP')
sha1sums=('4db9fb6cff2e7302f56fd2e625153735c0027dd1'
          'SKIP'
          'SKIP'
          'SKIP')
    
pkgver_git() {
  cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    printf "r%s" "${ver//[[:alpha:]]}"  
    echo ${ver:0:7}
}

pkgver_svn() {
  cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

#pkgver() {
#    pkgver_git
#}

prepare() {
  cd $srcdir/ns-allinone-$pkgver

# ./download.py -n ns-3-dev
    grep -rl '/usr/bin/env python' . \
    | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'

# compile openflow lib support
    cd $srcdir/ns3-openflow-hg
    grep -rl '/usr/bin/env python' . \
    | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
    ./waf configure
    ./waf build

# compile click support
    cd $srcdir/ns3-click-git
#autoreconf -if
    ./configure --disable-linuxmodule --enable-nsclick --enable-wifi
    rm -rf bin
    make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}')

# BRITE
    cd $srcdir/ns3-brite-hg
    make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}')

    if [ 0 = 1 ]; then
# Network Simulation Cradle (NSC)
      cd $srcdir/ns3-nsc-hg
        grep -rl '/usr/bin/env python' . \
        | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
        grep -rl '/usr/bin/env python' . \
        | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
#python2 scons.py
        SHLIBSUFFIX=.so ./scons.py
        fi
}

build() {
#cd "${srcdir}/${pkgname}"
  cd $srcdir/ns-allinone-$pkgver

    ./build.py \
    --build-options=--progress \
    --qmake-path=/usr/bin/qmake-qt4 \
    -- \
    --prefix=/usr \
    --with-python=/usr/bin/python2 \
    --progress \
    --enable-mpi \
    --enable-sudo \
    --with-nsclick=$srcdir/ns3-click-git \
    --with-openflow=$srcdir/ns3-openflow-hg \
    --with-brite=$srcdir/ns3-brite-hg \
    --libdir=/usr/lib \
#--with-nsc=$srcdir/ns3-nsc-hg \
#--enable-examples \
#--enable-tests \
#$(NULL)
}

verify_build() {
#cd "${srcdir}/${pkgname}"
  cd $srcdir/ns-allinone-$pkgver

# openflow
# https://www.nsnam.org/docs/release/3.13/models/html/openflow-switch.html
    ./waf --run openflow-switch
    ./waf --run "openflow-switch -v"

# NS-3 Click Integration Support
# https://www.nsnam.org/docs/models/html/click.html
    ./waf --run nsclick-simple-lan

# brite
# https://www.nsnam.org/wiki/BRITE_integration_with_ns-3
    ./waf --run 'brite-generic-example --verbose=1'

# nsc
# https://www.nsnam.org/docs/models/html/tcp.html?#network-simulation-cradle
    ./test.py -s ns3-tcp-interoperability
}

package() {
#cd "${srcdir}/${pkgname}/ns-3-dev"
  cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    ./waf install --destdir=$pkgdir/
}

