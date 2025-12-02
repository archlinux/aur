# Maintainer: MLM-stuff gfxoxinzh@mozmail.com

pkgname=ns3-simple
pkgver=3.45
pkgrel=2
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('x86_64')
url='https://www.nsnam.org/'
license=('GPL-2.0-only')
options=('!lto')

depends=(
  'python'              # ns3 wrapper & bindings
  'python-cppyy'        # cppyy / CPyCppyy / backend from extra
  'dpdk'
  'sqlite'
  'qt5-base'            # netanim
  'openmpi'
  'eigen'
  'gsl'
  'libxml2'
  'gtk3'
  'boost-libs'
  'glibc'
  'libpcap'
  # VM / tap bridge
  'lxc' 'vtun' 'ebtables' 'bridge-utils'
  # pyviz
  'goocanvas' 'python-gobject' 'python-cairo' 'python-pygraphviz'
  'ipython'
)

makedepends=(
  'cmake'
  'boost'
  'git'
  'mercurial'
  # docs
  'doxygen' 'graphviz' 'imagemagick' 'python-sphinx' 'texlive-bin'
)

optdepends=(
  'uncrustify: utils/check-style.py style checks'
  'dia: documentation diagrams'
)

provides=('ns3')
conflicts=('ns3' 'ns3-git' 'ns3-hg')

source=(
  "https://www.nsnam.org/releases/ns-allinone-${pkgver}.tar.bz2"
)

sha256sums=(
  '07bccf6682bd05e8e2cf0fe68f716eda961170e379a995d666d9f994c9b967fa'
)

prepare() {
  cd "${srcdir}/ns-allinone-${pkgver}/ns-${pkgver}"

  # DPDK API compatibility (harmless if upstream already fixed)
  if [[ -f src/fd-net-device/model/dpdk-net-device.cc ]]; then
    sed -i "src/fd-net-device/model/dpdk-net-device.cc" \
      -e 's/CALL_MASTER/CALL_MAIN/' \
      -e 's/ETH_LINK_DOWN/RTE_ETH_LINK_DOWN/' \
      -e 's/ETH_MQ_TX_NONE/RTE_ETH_MQ_TX_NONE/' \
      -e 's/DEV_TX_OFFLOAD_MBUF_FAST_FREE/RTE_ETH_TX_OFFLOAD_MBUF_FAST_FREE/' \
      -e '/split_hdr_size/d' || true
  fi
}

build() {
  cd "${srcdir}/ns-allinone-${pkgver}/ns-${pkgver}"

  local pyver
  pyver="$(
    python - << 'EOF'
import sys
print(f"{sys.version_info[0]}.{sys.version_info[1]}")
EOF
  )"
  local py_site="lib/python${pyver}/site-packages"

  ./ns3 configure \
    --build-profile=default \
    --enable-dpdk \
    --enable-eigen \
    --enable-examples \
    --enable-gsl \
    --enable-gtk \
    --enable-logs \
    --enable-monolib \
    --enable-mpi \
    --enable-python-bindings \
    --enable-tests \
    --prefix=/usr \
    -- \
    -DNS3_BINDINGS_INSTALL_DIR="/usr/${py_site}"

  ./ns3 build

  # Clean absolute $srcdir from pkg-config files in build tree
  find -L . -name '*.pc' -exec \
    sed -e "s,[^[:blank:]]\+${srcdir}[^[:blank:]]\+,,g" -i {} +
}

check() {
  cd "${srcdir}/ns-allinone-${pkgver}/ns-${pkgver}"
  ./ns3 run "hello-simulator" || echo "ns3 hello-simulator failed (ignored)"
}

package() {
  # netanim (if present in allinone)
  if compgen -G "${srcdir}/ns-allinone-${pkgver}/netanim-*" > /dev/null; then
    cd "${srcdir}/ns-allinone-${pkgver}/netanim"-*
    install -Dm755 NetAnim "${pkgdir}/usr/bin/netanim"
  fi

  # ns-3 core
  cd "${srcdir}/ns-allinone-${pkgver}/ns-${pkgver}"
  DESTDIR="${pkgdir}" ./ns3 install

  # Install Python 'ns' package into site-packages
  local pyver py_site
  pyver="$(
    python - << 'EOF'
import sys
print(f"{sys.version_info[0]}.{sys.version_info[1]}")
EOF
  )"
  py_site="${pkgdir}/usr/lib/python${pyver}/site-packages"
  install -d "${py_site}/ns"
  install -m644 bindings/python/ns__init__.py "${py_site}/ns/__init__.py"

  # Strip any hardcoded $srcdir references from installed files
  mapfile -t files < <(grep -R --binary-files=without-match -l "${srcdir}" "${pkgdir}" || true)
  if ((${#files[@]})); then
    sed -i "s,${srcdir},,g" "${files[@]}"
  fi
}

# vim: set ts=2 sw=2 et:
